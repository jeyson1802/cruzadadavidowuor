package com.profetadavidowuor.cruzada.dto;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;

public class PaisDto implements Serializable {
    private Integer id;
    private String code;
    private String descripcion;
    private String estado;
    private Instant fechaRegistro;
    private String usuarioRegistro;
    private Instant fechaModificacion;
    private String usuarioModificacion;

    public PaisDto() {
    }

    public PaisDto(Integer id, String code, String descripcion, String estado, Instant fechaRegistro, String usuarioRegistro, Instant fechaModificacion, String usuarioModificacion) {
        this.id = id;
        this.code = code;
        this.descripcion = descripcion;
        this.estado = estado;
        this.fechaRegistro = fechaRegistro;
        this.usuarioRegistro = usuarioRegistro;
        this.fechaModificacion = fechaModificacion;
        this.usuarioModificacion = usuarioModificacion;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public void setFechaRegistro(Instant fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public void setUsuarioRegistro(String usuarioRegistro) {
        this.usuarioRegistro = usuarioRegistro;
    }

    public void setFechaModificacion(Instant fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public void setUsuarioModificacion(String usuarioModificacion) {
        this.usuarioModificacion = usuarioModificacion;
    }

    public Integer getId() {
        return id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public String getEstado() {
        return estado;
    }

    public Instant getFechaRegistro() {
        return fechaRegistro;
    }

    public String getUsuarioRegistro() {
        return usuarioRegistro;
    }

    public Instant getFechaModificacion() {
        return fechaModificacion;
    }

    public String getUsuarioModificacion() {
        return usuarioModificacion;
    }

    @Override
    public String toString() {
        return "PaisDto{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", estado='" + estado + '\'' +
                ", fechaRegistro=" + fechaRegistro +
                ", usuarioRegistro='" + usuarioRegistro + '\'' +
                ", fechaModificacion=" + fechaModificacion +
                ", usuarioModificacion='" + usuarioModificacion + '\'' +
                '}';
    }
}
