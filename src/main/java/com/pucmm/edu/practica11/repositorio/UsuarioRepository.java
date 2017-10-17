package com.pucmm.edu.practica11.repositorio;


import com.pucmm.edu.practica11.entidades.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
public interface UsuarioRepository extends JpaRepository<Usuario, Long> {

    Usuario findByNombre(String nombre);
    Usuario findUsuarioByUsername(String username);
    List<Usuario> findAllByApellidoNotNull();
    Usuario findByNombreAndApellido(String nombre, String apellido);
    List<Usuario> findAllByUsername(String username);
    List<Usuario> findAll();


    List<Usuario> findAllByNombreStartingWith(String nombre);
    //Indicando que ignore el tamaño de la letra.
    List<Usuario> findAllByNombreStartingWithIgnoreCase(String nombre);

}
