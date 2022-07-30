package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Cargo;
import com.profetadavidowuor.cruzada.model.Fuente;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface FuenteRepository extends CrudRepository<Fuente, Integer> {

    List<Fuente> findByEstadoOrderByIdAsc(String estado) throws Exception;
}