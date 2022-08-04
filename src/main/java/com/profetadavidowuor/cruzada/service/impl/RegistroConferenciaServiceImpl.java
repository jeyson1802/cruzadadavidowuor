package com.profetadavidowuor.cruzada.service.impl;

import com.google.zxing.common.StringUtils;
import com.profetadavidowuor.cruzada.dto.ConferenciaDto;
import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;
import com.profetadavidowuor.cruzada.model.*;
import com.profetadavidowuor.cruzada.repository.ConferenciaRepository;
import com.profetadavidowuor.cruzada.repository.PaisRepository;
import com.profetadavidowuor.cruzada.repository.RegistroConferenciaRepository;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;
import com.profetadavidowuor.cruzada.service.ConferenciaService;
import com.profetadavidowuor.cruzada.service.JasperReportService;
import com.profetadavidowuor.cruzada.service.QRCodeService;
import com.profetadavidowuor.cruzada.service.RegistroConferenciaService;
import com.profetadavidowuor.cruzada.util.Constante;
import com.profetadavidowuor.cruzada.util.StringUtil;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.OutputStream;
import java.time.Instant;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class RegistroConferenciaServiceImpl implements RegistroConferenciaService {

    private static final Logger logger = LogManager.getLogger(RegistroConferenciaServiceImpl.class);

    @Autowired
    private RegistroConferenciaRepository registroConferenciaRepository;

    @Autowired
    private ConferenciaRepository conferenciaRepository;

    @Autowired
    private QRCodeService qrCodeService;

    @Autowired
    private JasperReportService<String> jasperReportService;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public RegistroConferenciaDto registrarParticipanteConferencia(RequestRegistroConferencia requestRegistroConferencia) throws Exception {

        logger.info("conferencia ===> " + requestRegistroConferencia.toString());

        modelMapper.getConfiguration().setAmbiguityIgnored(true);

        RegistroConferencia registroConferencia = modelMapper.map(requestRegistroConferencia, RegistroConferencia.class);

        registroConferencia.setEstado(Constante.COD_ESTADO_ACTIVO);
        registroConferencia.setFechaRegistro(Instant.now());
        registroConferencia.setUsuarioRegistro(Constante.USUARIO_DEFAULT);

        RegistroConferencia participante = registroConferenciaRepository.save(registroConferencia);

        logger.info("resultado ===> " + participante.toString());

        Conferencia conferencia = conferenciaRepository.findById(participante.getConferencia().getId()).get();
        participante.setConferencia(conferencia);

        RegistroConferenciaDto registroConferenciaDto = modelMapper.map(participante, RegistroConferenciaDto.class);

        String idParticipante = StringUtil.toStr(registroConferenciaDto.getId());

        String urlDecodeQR = Constante.URL_GENERATE_QR_CODE.concat(Base64.getEncoder().encodeToString(idParticipante.getBytes()));

        byte[] qrCode = qrCodeService.generateQRCode(urlDecodeQR, 250, 250);

        String qrCodeBase64 = Base64.getEncoder().encodeToString(qrCode);

        registroConferenciaDto.setQrCodeBase64(qrCodeBase64);

        logger.info("registroConferenciaDto ===> " + registroConferenciaDto.toString());

        return registroConferenciaDto;

    }
    @Override
    public void generarConstanciaParticipante(Integer idParticipante, OutputStream outputStream) throws Exception {

        RegistroConferencia participante = registroConferenciaRepository.findById(idParticipante).get();

        logger.info("participante ==> " + participante.toString());

        Conferencia conferencia = conferenciaRepository.findById(participante.getConferencia().getId()).get();

        logger.info("conferencia ==> " + conferencia.toString());

        String urlDecodeQR = Constante.URL_GENERATE_QR_CODE.concat(Base64.getEncoder().encodeToString(StringUtil.toStr(participante.getId()).getBytes()));

        byte[] qrCode = qrCodeService.generateQRCode(urlDecodeQR, 250, 250);

        String qrCodeBase64 = Base64.getEncoder().encodeToString(qrCode);

        Map<String, Object> parameters = new HashMap<>();
        parameters.put("IMG_BASE_64", qrCodeBase64);
        parameters.put("CONFERENCIA_DESCRIPCION", conferencia.getDescripcion());
        parameters.put("CODIGO_PARTICIPANTE", "Código de Participante N° " + idParticipante);
        parameters.put("NOMBRES_APELLIDOS", participante.getNombres() + " " + participante.getApellidos());
        parameters.put("CONFERENCIA_LUGAR", conferencia.getLugar());
        parameters.put("CONFERENCIA_HORARIO", conferencia.getHorario());

        jasperReportService.exportarPDFStream(Constante.REPORTE_CONSTANCIA_PARTICIPANTE_JRXML, parameters, null, outputStream);

    }
}
