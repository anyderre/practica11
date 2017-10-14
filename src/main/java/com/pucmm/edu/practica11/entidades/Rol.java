package com.pucmm.edu.practica11.entidades;

import javax.persistence.*;
import java.io.Serializable;


@Entity
public class Rol implements Serializable{

    @Id
    @GeneratedValue
    private int id;
    private String rol;
    @ManyToOne(cascade = CascadeType.ALL)
    private Usuario usuario;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }
}
