package com.profetadavidowuor.cruzada.rest;

import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;
import com.profetadavidowuor.cruzada.service.RegistroConferenciaService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;

import javax.servlet.http.HttpServletResponse;

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

    @PostMapping (value="/generarConstanciaParticipante/{idParticipante}")
    public void generarConstanciaParticipante(@PathVariable("idParticipante") Integer idParticipante,
                                                    HttpServletResponse response) throws Exception {

        logger.info("Inicio generarConstanciaParticipante.......");

        String nombreArchivo = idParticipante + "_" + "ConstanciaConferencia.pdf";
        response.setContentType("application/x-pdf");
        response.setHeader("Content-disposition", "inline; filename=" + nombreArchivo);

        registroConferenciaService.generarConstanciaParticipante(idParticipante, response.getOutputStream());

        logger.info("Fin generarConstanciaParticipante.......");

    }

    @PostMapping (value="/enviarEmailConstanciaParticipante/{idParticipante}")
    public void enviarEmailConstanciaParticipante(@PathVariable("idParticipante") Integer idParticipante) throws Exception {

        logger.info("Inicio enviarEmailConstanciaParticipante.......");

        registroConferenciaService.enviarEmailConstanciaParticipante(idParticipante);

        logger.info("Fin enviarEmailConstanciaParticipante.......");

    }
}
