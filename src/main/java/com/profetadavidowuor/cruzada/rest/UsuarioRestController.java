package com.profetadavidowuor.cruzada.rest;

import com.profetadavidowuor.cruzada.model.Usuario;
import com.profetadavidowuor.cruzada.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioRestController {

    @Autowired
    private UsuarioRepository usuarioRepository;

    @GetMapping
    public Page<Usuario> findAll(@RequestParam int page, @RequestParam int size) {
        PageRequest pr = PageRequest.of(page,size);
        return usuarioRepository.findAll(pr);
    }

}
