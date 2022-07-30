package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.dto.ConferenciaDto;
import com.profetadavidowuor.cruzada.model.Conferencia;
import com.profetadavidowuor.cruzada.model.RegistroConferencia;
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

@Service
public class RegistroConferenciaServiceImpl implements RegistroConferenciaService {

    private static final Logger logger = LogManager.getLogger(RegistroConferenciaServiceImpl.class);

    @Autowired
    private RegistroConferenciaRepository registroConferenciaRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public void registrarParticipanteConferencia(RequestRegistroConferencia requestRegistroConferencia) throws Exception {

        logger.info("conferencia ===> " + requestRegistroConferencia.toString());

        RegistroConferencia registroConferencia = modelMapper.map(requestRegistroConferencia, RegistroConferencia.class);

        logger.info("conferenciaDto ===> " + registroConferencia.toString());

    }
}
