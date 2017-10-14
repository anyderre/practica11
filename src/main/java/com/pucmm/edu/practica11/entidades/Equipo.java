package com.pucmm.edu.practica11.entidades;

import javax.persistence.*;
import java.io.Serializable;


@Entity
public class Equipo implements Serializable{

    @Id
    @GeneratedValue
    private int id;
    private String nombre;
    private String ruta_imagen;
    private int costoDia;
    private int cantidad;
    @ManyToOne
    private SubFamilia subFamilia;


    public int getCostoDia() {
        return costoDia;
    }

    public void setCostoDia(int costoDia) {
        this.costoDia = costoDia;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
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

    public String getRuta_imagen() {
        return ruta_imagen;
    }

    public void setRuta_imagen(String ruta_imagen) {
        this.ruta_imagen = ruta_imagen;
    }

    public SubFamilia getSubFamilia() {
        return subFamilia;
    }

    public void setSubFamilia(SubFamilia subFamilia) {
        this.subFamilia = subFamilia;
    }
}
