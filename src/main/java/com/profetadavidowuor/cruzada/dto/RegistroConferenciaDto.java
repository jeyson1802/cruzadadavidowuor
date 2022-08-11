package com.profetadavidowuor.cruzada.dto;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;

public class RegistroConferenciaDto implements Serializable {
    private Integer id;
    private String nombres;
    private String apellidos;
    private String correo;
    private String celular;
    private Integer edad;
    private String iglesia;
    private ConferenciaDto conferencia;
    private PaisDto pais;
    private CargoDto cargo;
    private FuenteDto fuente;
    private String estado;
    private Instant fechaRegistro;
    private String usuarioRegistro;
    private Instant fechaModificacion;
    private String usuarioModificacion;

    private String qrCodeBase64;

    public RegistroConferenciaDto() {
    }

    public RegistroConferenciaDto(Integer id, String nombres, String apellidos, String correo, String celular, Integer edad, String iglesia, ConferenciaDto conferencia, PaisDto pais, CargoDto cargo, FuenteDto fuente, String estado, Instant fechaRegistro, String usuarioRegistro, Instant fechaModificacion, String usuarioModificacion, String qrCodeBase64) {
        this.id = id;
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.correo = correo;
        this.celular = celular;
        this.edad = edad;
        this.iglesia = iglesia;
        this.conferencia = conferencia;
        this.pais = pais;
        this.cargo = cargo;
        this.fuente = fuente;
        this.estado = estado;
        this.fechaRegistro = fechaRegistro;
        this.usuarioRegistro = usuarioRegistro;
        this.fechaModificacion = fechaModificacion;
        this.usuarioModificacion = usuarioModificacion;
        this.qrCodeBase64 = qrCodeBase64;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public ConferenciaDto getConferencia() {
        return conferencia;
    }

    public void setConferencia(ConferenciaDto conferencia) {
        this.conferencia = conferencia;
    }

    public PaisDto getPais() {
        return pais;
    }

    public void setPais(PaisDto pais) {
        this.pais = pais;
    }

    public CargoDto getCargo() {
        return cargo;
    }

    public void setCargo(CargoDto cargo) {
        this.cargo = cargo;
    }

    public FuenteDto getFuente() {
        return fuente;
    }

    public void setFuente(FuenteDto fuente) {
        this.fuente = fuente;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Instant getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(Instant fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public String getUsuarioRegistro() {
        return usuarioRegistro;
    }

    public void setUsuarioRegistro(String usuarioRegistro) {
        this.usuarioRegistro = usuarioRegistro;
    }

    public Instant getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Instant fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public String getUsuarioModificacion() {
        return usuarioModificacion;
    }

    public void setUsuarioModificacion(String usuarioModificacion) {
        this.usuarioModificacion = usuarioModificacion;
    }

    public String getQrCodeBase64() {
        return qrCodeBase64;
    }

    public void setQrCodeBase64(String qrCodeBase64) {
        this.qrCodeBase64 = qrCodeBase64;
    }

    @Override
    public String toString() {
        return "RegistroConferenciaDto{" +
                "id=" + id +
                ", nombres='" + nombres + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", correo='" + correo + '\'' +
                ", celular=" + celular +
                ", edad=" + edad +
                ", iglesia='" + iglesia + '\'' +
                ", conferencia=" + conferencia +
                ", pais=" + pais +
                ", cargo=" + cargo +
                ", fuente=" + fuente +
                ", estado='" + estado + '\'' +
                ", fechaRegistro=" + fechaRegistro +
                ", usuarioRegistro='" + usuarioRegistro + '\'' +
                ", fechaModificacion=" + fechaModificacion +
                ", usuarioModificacion='" + usuarioModificacion + '\'' +
                ", qrCodeBase64='" + qrCodeBase64 + '\'' +
                '}';
    }
}
