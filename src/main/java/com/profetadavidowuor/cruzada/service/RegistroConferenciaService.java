package com.profetadavidowuor.cruzada.service;

import com.profetadavidowuor.cruzada.dto.CargoDto;
import com.profetadavidowuor.cruzada.dto.RegistroConferenciaDto;
import com.profetadavidowuor.cruzada.request.RequestRegistroConferencia;

import java.util.List;

public interface RegistroConferenciaService {

    RegistroConferenciaDto registrarParticipanteConferencia(RequestRegistroConferencia requestRegistroConferencia) throws Exception;

}
