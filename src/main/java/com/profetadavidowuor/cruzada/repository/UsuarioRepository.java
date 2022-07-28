package com.profetadavidowuor.cruzada.repository;

import com.profetadavidowuor.cruzada.model.Usuario;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface UsuarioRepository extends PagingAndSortingRepository<Usuario, Integer> {
}