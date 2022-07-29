package com.profetadavidowuor.cruzada.service.impl;

import com.profetadavidowuor.cruzada.dto.PaisDto;
import com.profetadavidowuor.cruzada.model.Pais;
import com.profetadavidowuor.cruzada.repository.PaisRepository;
import com.profetadavidowuor.cruzada.service.PaisService;
import com.profetadavidowuor.cruzada.util.Constante;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class PaisServiceImpl implements PaisService {

    private static final Logger logger = LogManager.getLogger(PaisServiceImpl.class);

    @Autowired
    private PaisRepository paisRepository;

    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<PaisDto> listarPaises() throws Exception {

        List<Pais> listPais = paisRepository.findByEstadoOrderByDescripcionAsc(Constante.COD_ESTADO_ACTIVO);

        logger.info("listPais ===> " + listPais.toString());

        List<PaisDto> listPaisDto = listPais.stream().map(pais -> modelMapper.map(pais, PaisDto.class)).collect(Collectors.toList());

        logger.info("listPaisDto ===> " + listPaisDto.toString());

        return listPaisDto;

    }
}
