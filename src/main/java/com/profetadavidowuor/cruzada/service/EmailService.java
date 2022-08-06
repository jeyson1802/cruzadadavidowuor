package com.profetadavidowuor.cruzada.service;

import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;

public interface EmailService {

    String sendMailRegistroConferencia(RegistroConferenciaDto registroConferenciaDto) throws Exception;
}
