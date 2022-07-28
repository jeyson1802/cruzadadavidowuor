package com.profetadavidowuor.cruzada.model;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "enfermo")
public class Enfermo {
    @Id
    @Column(name = "idenfermo", nullable = false)
    private Integer id;

    @Column(name = "nombres", nullable = false, length = 200)
    private String nombres;

    @Column(name = "apellidos", nullable = false, length = 200)
    private String apellidos;

    @Column(name = "correo", nullable = false, length = 200)
    private String correo;

    @Column(name = "celular", nullable = false)
    private Integer celular;

    @Column(name = "edad")
    private Integer edad;

    @Column(name = "iglesia", length = 200)
    private String iglesia;

    @Column(name = "enfermedad", nullable = false, length = 200)
    private String enfermedad;

    @Column(name = "anio_enfermedad", nullable = false)
    private Integer anioEnfermedad;

    @Column(name = "foto_diagnostico")
    private byte[] fotoDiagnostico;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idcruzada", nullable = false)
    private Cruzada cruzada;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idpais", nullable = false)
    private Pais pais;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idfuente", nullable = false)
    private Fuente fuente;

    @Column(name = "estado", nullable = false, length = 1)
    private String estado;

    @Column(name = "fecha_registro", nullable = false)
    private Instant fechaRegistro;

    @Column(name = "usuario_registro", nullable = false, length = 45)
    private String usuarioRegistro;

    @Column(name = "fecha_modificacion")
    private Instant fechaModificacion;

    @Column(name = "usuario_modificacion", length = 45)
    private String usuarioModificacion;

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

    public Integer getCelular() {
        return celular;
    }

    public void setCelular(Integer celular) {
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

    public String getEnfermedad() {
        return enfermedad;
    }

    public void setEnfermedad(String enfermedad) {
        this.enfermedad = enfermedad;
    }

    public Integer getAnioEnfermedad() {
        return anioEnfermedad;
    }

    public void setAnioEnfermedad(Integer anioEnfermedad) {
        this.anioEnfermedad = anioEnfermedad;
    }

    public byte[] getFotoDiagnostico() {
        return fotoDiagnostico;
    }

    public void setFotoDiagnostico(byte[] fotoDiagnostico) {
        this.fotoDiagnostico = fotoDiagnostico;
    }

    public Cruzada getCruzada() {
        return cruzada;
    }

    public void setCruzada(Cruzada cruzada) {
        this.cruzada = cruzada;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public Fuente getFuente() {
        return fuente;
    }

    public void setFuente(Fuente fuente) {
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

}