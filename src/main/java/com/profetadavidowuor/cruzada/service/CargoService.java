package com.profetadavidowuor.cruzada.service;

import com.profetadavidowuor.cruzada.dto.CargoDto;
import com.profetadavidowuor.cruzada.dto.PaisDto;

import java.util.List;

public interface CargoService {

    List<CargoDto> listarCargos() throws Exception;

}
