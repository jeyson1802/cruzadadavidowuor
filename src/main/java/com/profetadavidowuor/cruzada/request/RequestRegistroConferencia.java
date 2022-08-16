package com.profetadavidowuor.cruzada.request;

import java.io.Serializable;
import java.util.Objects;

public class RequestRegistroConferencia implements Serializable {

    private String nombres;
    private String apellidos;
    private String correo;
    private String celular;
    private Integer edad;
    private String iglesia;
    private Integer idConferencia;
    private String codePais;
    private Integer idCargo;
    private Integer idFuente;

    private Boolean suscripcion;

    public RequestRegistroConferencia() {
    }

    public RequestRegistroConferencia(String nombres, String apellidos, String correo, String celular, Integer edad, String iglesia, Integer idConferencia, String codePais, Integer idCargo, Integer idFuente, Boolean suscripcion) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.celular = celular;
        this.edad = edad;
        this.iglesia = iglesia;
        this.idConferencia = idConferencia;
        this.codePais = codePais;
        this.idCargo = idCargo;
        this.idFuente = idFuente;
        this.suscripcion = suscripcion;
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

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
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

    public String getCodePais() {
        return codePais;
    }

    public void setCodePais(String codePais) {
        this.codePais = codePais;
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

    public Boolean getSuscripcion() {
        return suscripcion;
    }

    public void setSuscripcion(Boolean suscripcion) {
        this.suscripcion = suscripcion;
    }
}
