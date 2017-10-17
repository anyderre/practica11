package com.pucmm.edu.practica11.entidades;

import org.springframework.boot.autoconfigure.domain.EntityScan;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;


@Entity
public class Alquiler implements Serializable{

    @Id
    @GeneratedValue
    private int id;

    @OneToOne
    private Equipo equipo;

    private String nombre;

    private Boolean devuelto;

    private int diasAlquilado;

    private long fecha;

    private long fechaPromesa;
    public String cedula;

    @ManyToOne
    private Factura factura;

    public long getFecha() {
        return fecha;
    }

    public void setFecha(long fecha) {
        this.fecha = fecha;
    }

    public long getFechaPromesa() {
        return fechaPromesa;
    }

    public void setFechaPromesa(long fechaPromesa) {
        this.fechaPromesa = fechaPromesa;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public Alquiler() {
    }

    public Equipo getEquipo() {
        return equipo;
    }

    public void setEquipo(Equipo equipo) {
        this.equipo = equipo;
    }

    public Factura getFactura() {
        return factura;
    }

    public void setFactura(Factura factura) {
        this.factura = factura;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Boolean getDevuelto() {
        return devuelto;
    }

    public void setDevuelto(Boolean devuelto) {
        this.devuelto = devuelto;
    }

    public int getDiasAlquilado() {
        return diasAlquilado;
    }

    public void setDiasAlquilado(int diasAlquilado) {
        this.diasAlquilado = diasAlquilado;
    }

    public int getSubtotal(){return diasAlquilado* equipo.getCostoDia();}

    public int getCalculoDias(){
        long diff = new Date().getTime()- this.getFactura().getFecha().getTime();
        return (int)TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }


}
