package com.profetadavidowuor.cruzada.service;

import com.profetadavidowuor.cruzada.dto.CargoDto;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;

import java.util.List;

public interface RegistroConferenciaService {

    Integer registrarParticipanteConferencia(RequestRegistroConferencia requestRegistroConferencia) throws Exception;

}
