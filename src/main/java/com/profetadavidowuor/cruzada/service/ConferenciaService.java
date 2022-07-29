package com.profetadavidowuor.cruzada.service;

import com.profetadavidowuor.cruzada.dto.CargoDto;
import com.profetadavidowuor.cruzada.dto.ConferenciaDto;
import com.profetadavidowuor.cruzada.model.Conferencia;

import java.util.List;

public interface ConferenciaService {

    public ConferenciaDto obtenerConferenciaPorPais(Integer idPais) throws Exception;

}
