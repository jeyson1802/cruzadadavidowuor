package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Pais;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PaisRepository extends CrudRepository<Pais, Integer> {

    public List<Pais> findByEstadoOrderByDescripcionAsc(String estado) throws Exception;
}