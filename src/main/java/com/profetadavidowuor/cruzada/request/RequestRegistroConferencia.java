package com.profetadavidowuor.cruzada.request;

import java.io.Serializable;
import java.util.Objects;

public class RequestRegistroConferencia implements Serializable {

    private String nombres;
    private String apellidos;
    private String correo;
    private Long celular;
    private Integer edad;
    private String iglesia;
    private Integer idConferencia;
    private Integer idPais;
    private Integer idCargo;
    private Integer idFuente;

    public RequestRegistroConferencia() {
    }

    public RequestRegistroConferencia(String nombres, String apellidos, String correo, Long celular, Integer edad, String iglesia, Integer idConferencia, Integer idPais, Integer idCargo, Integer idFuente) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.celular = celular;
        this.edad = edad;
        this.iglesia = iglesia;
        this.idConferencia = idConferencia;
        this.idPais = idPais;
        this.idCargo = idCargo;
        this.idFuente = idFuente;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Long getCelular() {
        return celular;
    }

    public void setCelular(Long celular) {
        this.celular = celular;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getIglesia() {
        return iglesia;
    }

    public void setIglesia(String iglesia) {
        this.iglesia = iglesia;
    }

    public Integer getIdConferencia() {
        return idConferencia;
    }

    public void setIdConferencia(Integer idConferencia) {
        this.idConferencia = idConferencia;
    }

    public Integer getIdPais() {
        return idPais;
    }

    public void setIdPais(Integer idPais) {
        this.idPais = idPais;
    }

    public Integer getIdCargo() {
        return idCargo;
    }

    public void setIdCargo(Integer idCargo) {
        this.idCargo = idCargo;
    }

    public Integer getIdFuente() {
        return idFuente;
    }

    public void setIdFuente(Integer idFuente) {
        this.idFuente = idFuente;
    }
}
