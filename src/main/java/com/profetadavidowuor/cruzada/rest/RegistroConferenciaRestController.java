package com.profetadavidowuor.cruzada.rest;

import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegistroConferenciaRestController {

    private static final Logger logger = LogManager.getLogger(RegistroConferenciaRestController.class);

    @PostMapping(value="/registrarParticipanteConferencia")
    public ResponseEntity<String> registrarParticipanteConferencia(@RequestBody RequestRegistroConferencia requestRegistroConferencia) throws Exception {

        logger.info("Inicio registrarParticipanteConferencia.......");

        logger.info("requestRegistroConferencia ==> " + requestRegistroConferencia);

        logger.info("Fin registrarParticipanteConferencia.......");

        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
