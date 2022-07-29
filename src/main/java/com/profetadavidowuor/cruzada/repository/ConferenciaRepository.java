package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Conferencia;
import com.profetadavidowuor.cruzada.model.Pais;
import org.springframework.data.repository.CrudRepository;

public interface ConferenciaRepository extends CrudRepository<Conferencia, Integer> {

    Conferencia findByPaisIdAndEstado(Integer idPais, String estado) throws Exception;
}