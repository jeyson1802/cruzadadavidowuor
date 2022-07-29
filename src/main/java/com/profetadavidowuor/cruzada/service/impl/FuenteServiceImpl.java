package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.dto.FuenteDto;
import com.profetadavidowuor.cruzada.model.Fuente;
import com.profetadavidowuor.cruzada.repository.FuenteRepository;
import com.profetadavidowuor.cruzada.service.FuenteService;
import com.profetadavidowuor.cruzada.util.Constante;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class FuenteServiceImpl implements FuenteService {

    private static final Logger logger = LogManager.getLogger(FuenteServiceImpl.class);

    @Autowired
    private FuenteRepository cargoRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<FuenteDto> listarFuentes() throws Exception {

        List<Fuente> listFuente = cargoRepository.findByEstadoOrderByIdAsc(Constante.COD_ESTADO_ACTIVO);

        logger.info("listFuente ===> " + listFuente.toString());

        List<FuenteDto> listFuenteDto = listFuente.stream().map(pais -> modelMapper.map(pais, FuenteDto.class)).collect(Collectors.toList());

        logger.info("listFuenteDto ===> " + listFuenteDto.toString());

        return listFuenteDto;

    }
}
