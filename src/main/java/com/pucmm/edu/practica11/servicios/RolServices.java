package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Rol;
import com.pucmm.edu.practica11.entidades.Usuario;
import com.pucmm.edu.practica11.repositorio.RolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class RolServices {

    //Inyectando el repositorio
    @Autowired
    private RolRepository rolRepository;

    public long cantidadUsuario(){
        return rolRepository.count();
    }


    @Transactional
    public Rol creacionRol(Rol rol){
        rolRepository.save(rol);
        return rol;
    }


    public List<Rol> todosRoles(){
        return rolRepository.findAll();
    }
    public List<Rol> rolesUsuario(String usuario){
        return rolRepository.findAllByUsuario(usuario);
    }


}
