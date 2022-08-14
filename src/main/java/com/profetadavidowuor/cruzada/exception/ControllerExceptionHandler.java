package com.profetadavidowuor.cruzada.exception;

import com.profetadavidowuor.cruzada.rest.RegistroConferenciaRestController;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.Date;


@ControllerAdvice
public class ControllerExceptionHandler {

  private static final Logger logger = LogManager.getLogger(ControllerExceptionHandler.class);

  @ExceptionHandler(UnprocessableEntityException.class)
  public ResponseEntity<ResponseMessage> resourceUnprocessableEntityException(UnprocessableEntityException ex, WebRequest request) {

    ResponseMessage message = new ResponseMessage(
        new Date(),
        ex.getCode(),
        ex.getMessageError(),
        request.getDescription(false));
    
    return new ResponseEntity<ResponseMessage>(message, HttpStatus.UNPROCESSABLE_ENTITY);
  }

  @ExceptionHandler(Exception.class)
  public ResponseEntity<ResponseMessage> globalExceptionHandler(Exception ex, WebRequest request) {

    StringWriter printStackTrace = new StringWriter();
    ex.printStackTrace(new PrintWriter(printStackTrace));

    logger.error(printStackTrace.toString());

    ResponseMessage message = new ResponseMessage(
        new Date(),
        HttpStatus.INTERNAL_SERVER_ERROR.value(),
        printStackTrace.toString(),
        request.getDescription(false));
    
    return new ResponseEntity<ResponseMessage>(message, HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
