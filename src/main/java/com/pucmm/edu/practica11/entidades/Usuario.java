package com.pucmm.edu.practica11.entidades;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.List;


@Entity
public class Usuario implements Serializable{

    @Id
    @Column(unique=true,columnDefinition="VARCHAR(64)")
    private String username;
    private String nombre;
    private String apellido;
    private String password;
    @OneToMany(mappedBy = "usuario")
    private List<Rol> roles;
    @Column(name = "enabled", nullable = false, columnDefinition = "int default 1")
    private int enabled = 1;

    public Usuario() {
    }

    public int getEnabled() {
        return enabled;
    }

    public List<Rol> getRoles() {
        return roles;
    }

    public void setRoles(List<Rol> roles) {
        this.roles = roles;
    }

    public void setEnabled(int enabled) {
        this.enabled = enabled;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }


}
