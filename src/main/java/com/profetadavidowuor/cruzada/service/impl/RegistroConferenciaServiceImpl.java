package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.dto.ConferenciaDto;
import com.profetadavidowuor.cruzada.model.*;
import com.profetadavidowuor.cruzada.repository.ConferenciaRepository;
import com.profetadavidowuor.cruzada.repository.PaisRepository;
import com.profetadavidowuor.cruzada.repository.RegistroConferenciaRepository;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;
import com.profetadavidowuor.cruzada.service.ConferenciaService;
import com.profetadavidowuor.cruzada.service.RegistroConferenciaService;
import com.profetadavidowuor.cruzada.util.Constante;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.Instant;

@Service
public class RegistroConferenciaServiceImpl implements RegistroConferenciaService {

    private static final Logger logger = LogManager.getLogger(RegistroConferenciaServiceImpl.class);

    @Autowired
    private RegistroConferenciaRepository registroConferenciaRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public Integer registrarParticipanteConferencia(RequestRegistroConferencia requestRegistroConferencia) throws Exception {

        logger.info("conferencia ===> " + requestRegistroConferencia.toString());

        modelMapper.getConfiguration().setAmbiguityIgnored(true);

        RegistroConferencia registroConferencia = modelMapper.map(requestRegistroConferencia, RegistroConferencia.class);

        registroConferencia.setConferencia(new Conferencia(requestRegistroConferencia.getIdConferencia()));
        registroConferencia.setPais(new Pais(requestRegistroConferencia.getIdPais()));
        registroConferencia.setCargo(new Cargo(requestRegistroConferencia.getIdCargo()));
        registroConferencia.setFuente(new Fuente(requestRegistroConferencia.getIdFuente()));

        registroConferencia.setEstado(Constante.COD_ESTADO_ACTIVO);
        registroConferencia.setFechaRegistro(Instant.now());
        registroConferencia.setUsuarioRegistro(Constante.USUARIO_DEFAULT);

        RegistroConferencia resultado = registroConferenciaRepository.save(registroConferencia);

        logger.info("resultado ===> " + resultado.toString());

        return resultado.getId();

    }
}
