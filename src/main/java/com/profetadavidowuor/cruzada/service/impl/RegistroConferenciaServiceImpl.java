package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;
import com.profetadavidowuor.cruzada.model.Conferencia;
import com.profetadavidowuor.cruzada.model.RegistroConferencia;
import com.profetadavidowuor.cruzada.repository.ConferenciaRepository;
import com.profetadavidowuor.cruzada.repository.RegistroConferenciaRepository;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;
import com.profetadavidowuor.cruzada.service.EmailService;
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

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.time.Instant;
import java.util.Base64;
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
    private EmailService emailService;

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

        byte[] qrCode = generarCodigoQRConIdParticipante(registroConferenciaDto.getId());

        String qrCodeBase64 = Base64.getEncoder().encodeToString(qrCode);

        registroConferenciaDto.setQrCodeBase64(qrCodeBase64);

        logger.info("registroConferenciaDto ===> " + registroConferenciaDto.toString());

        return registroConferenciaDto;

    }
    @Override
    public void generarConstanciaParticipante(Integer idParticipante, OutputStream outputStream) throws Exception {

        Map<String, Object> parametros = generarParametrosParticipante(idParticipante);

        jasperReportService.exportarPDFStream(Constante.REPORTE_CONSTANCIA_PARTICIPANTE_JRXML, parametros, null, outputStream);

    }

    @Override
    public void enviarEmailConstanciaParticipante(Integer idParticipante) throws Exception {

        Map<String, Object> parametros = generarParametrosParticipante(idParticipante);

        Map<String, byte[]> imagenesCorreo = new HashMap<>();
        imagenesCorreo.put("QrCode", Base64.getDecoder().decode(StringUtil.toStr(parametros.get("IMG_BASE_64"))));

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        jasperReportService.exportarPDFStream(Constante.REPORTE_CONSTANCIA_PARTICIPANTE_JRXML, parametros, null, outputStream);

        Map<String, byte[]> adjuntos = new HashMap<>();
        adjuntos.put(idParticipante + "ConstanciaConferencia", outputStream.toByteArray());

        emailService.sendMail("emails/constancia", "Constancia de Registro a la Conferencia", StringUtil.toStr(parametros.get("CORREO")), parametros, imagenesCorreo, adjuntos);

    }

    private byte[] generarCodigoQRConIdParticipante(Integer idParticipante) {

        String urlDecodeQR = Constante.URL_GENERATE_QR_CODE.concat(Base64.getEncoder().encodeToString(StringUtil.toStr(idParticipante).getBytes()));

        byte[] qrCode = qrCodeService.generateQRCode(urlDecodeQR, 250, 250);

        return qrCode;
    }

    private Map<String, Object> generarParametrosParticipante(Integer idParticipante) {

        RegistroConferencia participante = registroConferenciaRepository.findById(idParticipante).get();

        logger.info("participante ==> " + participante.toString());

        Conferencia conferencia = conferenciaRepository.findById(participante.getConferencia().getId()).get();

        logger.info("conferencia ==> " + conferencia.toString());

        byte[] qrCode = generarCodigoQRConIdParticipante(idParticipante);

        String qrCodeBase64 = Base64.getEncoder().encodeToString(qrCode);

        Map<String, Object> parametros = new HashMap<>();
        parametros.put("IMG_BASE_64", qrCodeBase64);
        parametros.put("CONFERENCIA_DESCRIPCION", conferencia.getDescripcion());
        parametros.put("CODIGO_PARTICIPANTE", "Código de Participante N° " + idParticipante);
        parametros.put("NOMBRES_APELLIDOS", participante.getNombres() + " " + participante.getApellidos());
        parametros.put("CONFERENCIA_LUGAR", conferencia.getLugar());
        parametros.put("CONFERENCIA_HORARIO", conferencia.getHorario());
        parametros.put("CORREO", participante.getCorreo());

        return parametros;
    }
}
