package com.pucmm.edu.practica11.repositorio;


import com.pucmm.edu.practica11.entidades.Rol;
import com.pucmm.edu.practica11.entidades.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
public interface RolRepository extends JpaRepository<Rol, Long> {



    List<Rol> findAll();

    List<Rol> findAllByUsuario(String usuario);


}
