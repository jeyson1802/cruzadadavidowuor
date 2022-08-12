package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Pais;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface PaisRepository extends CrudRepository<Pais, Integer> {

    List<Pais> findByEstadoOrderByDescripcionAsc(String estado) throws Exception;

    Pais findByCode(String code) throws Exception;
}