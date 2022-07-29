package com.profetadavidowuor.cruzada.dto;

import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;

public class FuenteDto implements Serializable {
    private Integer id;
    private String descripcion;
    private String estado;
    private Instant fechaRegistro;
    private String usuarioRegistro;
    private Instant fechaModificacion;
    private String usuarioModificacion;

    public FuenteDto() {
    }

    public FuenteDto(Integer id, String descripcion, String estado, Instant fechaRegistro, String usuarioRegistro, Instant fechaModificacion, String usuarioModificacion) {
        this.id = id;
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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        FuenteDto entity = (FuenteDto) o;
        return Objects.equals(this.id, entity.id) &&
                Objects.equals(this.descripcion, entity.descripcion) &&
                Objects.equals(this.estado, entity.estado) &&
                Objects.equals(this.fechaRegistro, entity.fechaRegistro) &&
                Objects.equals(this.usuarioRegistro, entity.usuarioRegistro) &&
                Objects.equals(this.fechaModificacion, entity.fechaModificacion) &&
                Objects.equals(this.usuarioModificacion, entity.usuarioModificacion);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, descripcion, estado, fechaRegistro, usuarioRegistro, fechaModificacion, usuarioModificacion);
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + "(" +
                "id = " + id + ", " +
                "descripcion = " + descripcion + ", " +
                "estado = " + estado + ", " +
                "fechaRegistro = " + fechaRegistro + ", " +
                "usuarioRegistro = " + usuarioRegistro + ", " +
                "fechaModificacion = " + fechaModificacion + ", " +
                "usuarioModificacion = " + usuarioModificacion + ")";
    }
}
