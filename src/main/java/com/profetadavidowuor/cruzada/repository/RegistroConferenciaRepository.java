package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Pais;
import com.profetadavidowuor.cruzada.model.RegistroConferencia;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegistroConferenciaRepository extends JpaRepository<RegistroConferencia, Integer> {

    RegistroConferencia findByCorreo(String correo) throws Exception;
}