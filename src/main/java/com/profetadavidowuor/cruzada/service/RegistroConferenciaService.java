package com.profetadavidowuor.cruzada.service;

import com.profetadavidowuor.cruzada.dto.CargoDto;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;

import java.util.List;

public interface RegistroConferenciaService {

    void registrarParticipanteConferencia(RequestRegistroConferencia requestRegistroConferencia) throws Exception;

}
