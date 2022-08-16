package com.profetadavidowuor.cruzada.model;

import javax.persistence.*;
import java.time.Instant;

@Entity
@Table(name = "registro_conferencia")
public class RegistroConferencia {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "idregistro", nullable = false)
    private Integer id;

    @Column(name = "nombres", nullable = false, length = 200)
    private String nombres;

    @Column(name = "apellidos", nullable = false, length = 200)
    private String apellidos;

    @Column(name = "correo", nullable = false, length = 200)
    private String correo;

    @Column(name = "celular", nullable = false)
    private String celular;

    @Column(name = "edad")
    private Integer edad;

    @Column(name = "iglesia", length = 200)
    private String iglesia;

    @Column(name = "ind_newsletter", nullable = false, length = 1)
    private String indicadorNewsletter;

    @Column(name = "ind_constancia", nullable = false, length = 1)
    private String indicadorConstancia;

    @Column(name = "ind_correo", nullable = false, length = 1)
    private String indicadorCorreo;

    @Column(name = "ind_email_marketing", nullable = false, length = 1)
    private String indicadorEmailMarketing;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idconferencia", nullable = false)
    private Conferencia conferencia;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idpais", nullable = false)
    private Pais pais;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "idcargo", nullable = false)
    private Cargo cargo;

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

    public String getIndicadorNewsletter() {
        return indicadorNewsletter;
    }

    public void setIndicadorNewsletter(String indicadorNewsletter) {
        this.indicadorNewsletter = indicadorNewsletter;
    }

    public String getIndicadorConstancia() {
        return indicadorConstancia;
    }

    public void setIndicadorConstancia(String indicadorConstancia) {
        this.indicadorConstancia = indicadorConstancia;
    }

    public String getIndicadorCorreo() {
        return indicadorCorreo;
    }

    public void setIndicadorCorreo(String indicadorCorreo) {
        this.indicadorCorreo = indicadorCorreo;
    }

    public String getIndicadorEmailMarketing() {
        return indicadorEmailMarketing;
    }

    public void setIndicadorEmailMarketing(String indicadorEmailMarketing) {
        this.indicadorEmailMarketing = indicadorEmailMarketing;
    }

    public Conferencia getConferencia() {
        return conferencia;
    }

    public void setConferencia(Conferencia conferencia) {
        this.conferencia = conferencia;
    }

    public Pais getPais() {
        return pais;
    }

    public void setPais(Pais pais) {
        this.pais = pais;
    }

    public Cargo getCargo() {
        return cargo;
    }

    public void setCargo(Cargo cargo) {
        this.cargo = cargo;
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

    @Override
    public String toString() {
        return "RegistroConferencia{" +
                "id=" + id +
                ", nombres='" + nombres + '\'' +
                ", apellidos='" + apellidos + '\'' +
                ", correo='" + correo + '\'' +
                ", celular='" + celular + '\'' +
                ", edad=" + edad +
                ", iglesia='" + iglesia + '\'' +
                ", indicadorNewsletter='" + indicadorNewsletter + '\'' +
                ", indicadorConstancia='" + indicadorConstancia + '\'' +
                ", indicadorCorreo='" + indicadorCorreo + '\'' +
                ", indicadorEmailMarketing='" + indicadorEmailMarketing + '\'' +
                ", conferencia=" + conferencia +
                ", pais=" + pais +
                ", cargo=" + cargo +
                ", fuente=" + fuente +
                ", estado='" + estado + '\'' +
                ", fechaRegistro=" + fechaRegistro +
                ", usuarioRegistro='" + usuarioRegistro + '\'' +
                ", fechaModificacion=" + fechaModificacion +
                ", usuarioModificacion='" + usuarioModificacion + '\'' +
                '}';
    }
}