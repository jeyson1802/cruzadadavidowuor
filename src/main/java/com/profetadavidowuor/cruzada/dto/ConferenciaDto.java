package com.profetadavidowuor.cruzada.dto;

import java.io.Serializable;
import java.time.Instant;
import java.time.LocalDate;
import java.util.Objects;

public class ConferenciaDto implements Serializable {
    private Integer id;
    private String descripcion;
    private LocalDate fechaInicial;
    private LocalDate fechaFinal;
    private String lugar;
    private String horario;
    private String correo;
    private Long contacto;
    private PaisDto pais;
    private String estado;
    private Instant fechaRegistro;
    private String usuarioRegistro;
    private Instant fechaModificacion;
    private String usuarioModificacion;

    public ConferenciaDto() {
    }

    public ConferenciaDto(Integer id, String descripcion, LocalDate fechaInicial, LocalDate fechaFinal, String lugar, String horario, String correo, Long contacto, PaisDto pais, String estado, Instant fechaRegistro, String usuarioRegistro, Instant fechaModificacion, String usuarioModificacion) {
        this.id = id;
        this.descripcion = descripcion;
        this.fechaInicial = fechaInicial;
        this.fechaFinal = fechaFinal;
        this.lugar = lugar;
        this.horario = horario;
        this.correo = correo;
        this.contacto = contacto;
        this.pais = pais;
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

    public void setFechaInicial(LocalDate fechaInicial) {
        this.fechaInicial = fechaInicial;
    }

    public void setFechaFinal(LocalDate fechaFinal) {
        this.fechaFinal = fechaFinal;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public void setContacto(Long contacto) {
        this.contacto = contacto;
    }

    public void setPais(PaisDto pais) {
        this.pais = pais;
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

    public LocalDate getFechaInicial() {
        return fechaInicial;
    }

    public LocalDate getFechaFinal() {
        return fechaFinal;
    }

    public String getLugar() {
        return lugar;
    }

    public String getHorario() {
        return horario;
    }

    public String getCorreo() {
        return correo;
    }

    public Long getContacto() {
        return contacto;
    }

    public PaisDto getPais() {
        return pais;
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
        ConferenciaDto entity = (ConferenciaDto) o;
        return Objects.equals(this.id, entity.id) &&
                Objects.equals(this.descripcion, entity.descripcion) &&
                Objects.equals(this.fechaInicial, entity.fechaInicial) &&
                Objects.equals(this.fechaFinal, entity.fechaFinal) &&
                Objects.equals(this.lugar, entity.lugar) &&
                Objects.equals(this.horario, entity.horario) &&
                Objects.equals(this.correo, entity.correo) &&
                Objects.equals(this.contacto, entity.contacto) &&
                Objects.equals(this.pais, entity.pais) &&
                Objects.equals(this.estado, entity.estado) &&
                Objects.equals(this.fechaRegistro, entity.fechaRegistro) &&
                Objects.equals(this.usuarioRegistro, entity.usuarioRegistro) &&
                Objects.equals(this.fechaModificacion, entity.fechaModificacion) &&
                Objects.equals(this.usuarioModificacion, entity.usuarioModificacion);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, descripcion, fechaInicial, fechaFinal, lugar, horario, correo, contacto, pais, estado, fechaRegistro, usuarioRegistro, fechaModificacion, usuarioModificacion);
    }

    @Override
    public String toString() {
        return getClass().getSimpleName() + "(" +
                "id = " + id + ", " +
                "descripcion = " + descripcion + ", " +
                "fechaInicial = " + fechaInicial + ", " +
                "fechaFinal = " + fechaFinal + ", " +
                "lugar = " + lugar + ", " +
                "horario = " + horario + ", " +
                "correo = " + correo + ", " +
                "contacto = " + contacto + ", " +
                "pais = " + pais + ", " +
                "estado = " + estado + ", " +
                "fechaRegistro = " + fechaRegistro + ", " +
                "usuarioRegistro = " + usuarioRegistro + ", " +
                "fechaModificacion = " + fechaModificacion + ", " +
                "usuarioModificacion = " + usuarioModificacion + ")";
    }
}
