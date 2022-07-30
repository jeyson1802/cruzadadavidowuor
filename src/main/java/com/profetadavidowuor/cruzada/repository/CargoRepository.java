package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Cargo;
import com.profetadavidowuor.cruzada.model.Pais;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CargoRepository extends CrudRepository<Cargo, Integer> {

    List<Cargo> findByEstadoOrderByIdAsc(String estado) throws Exception;
}