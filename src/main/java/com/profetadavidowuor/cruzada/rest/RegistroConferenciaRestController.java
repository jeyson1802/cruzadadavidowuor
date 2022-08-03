package com.profetadavidowuor.cruzada.rest;

import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;
import com.profetadavidowuor.cruzada.exception.ResponseMessage;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;
import com.profetadavidowuor.cruzada.service.RegistroConferenciaService;
import com.profetadavidowuor.cruzada.service.impl.RegistroConferenciaServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;

import java.util.Date;

@RestController
public class RegistroConferenciaRestController {

    private static final Logger logger = LogManager.getLogger(RegistroConferenciaRestController.class);

    @Autowired
    private RegistroConferenciaService registroConferenciaService;

    @PostMapping(value="/registrarParticipanteConferencia")
    public ResponseEntity<RegistroConferenciaDto> registrarParticipanteConferencia(@RequestBody RequestRegistroConferencia requestRegistroConferencia,
                                                                            WebRequest request) throws Exception {

        logger.info("Inicio registrarParticipanteConferencia.......");

        logger.info("requestRegistroConferencia ==> " + requestRegistroConferencia);

        RegistroConferenciaDto registroConferenciaDto = registroConferenciaService.registrarParticipanteConferencia(requestRegistroConferencia);

        logger.info("registroConferenciaDto ==> " + registroConferenciaDto);

        logger.info("Fin registrarParticipanteConferencia.......");

        return new ResponseEntity<>(registroConferenciaDto, HttpStatus.OK);
    }
}
