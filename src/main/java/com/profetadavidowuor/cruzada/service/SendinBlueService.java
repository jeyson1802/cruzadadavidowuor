package com.profetadavidowuor.cruzada.service;

public interface SendinBlueService {

    void crearContacto(String email, String apellidos, String nombres, String numero, String idLista) throws Exception;
}
