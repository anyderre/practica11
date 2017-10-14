package com.pucmm.edu.practica11.entidades;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;


@Entity
public class SubFamilia implements Serializable{

    @Id
    @GeneratedValue
    private int id;

    @OneToOne
    private Familia familia;

    private String nombre;

    @OneToMany
    private List<Equipo> equipos;

    public List<Equipo> getEquipos() {
        return equipos;
    }

    public void setEquipos(List<Equipo> equipos) {
        this.equipos = equipos;
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

    public Familia getFamilia() {
        return familia;
    }

    public void setFamilia(Familia familia) {
        this.familia = familia;
    }
}
