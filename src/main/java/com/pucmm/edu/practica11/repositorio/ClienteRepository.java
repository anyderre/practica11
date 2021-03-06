package com.pucmm.edu.practica11.repositorio;


import com.pucmm.edu.practica11.entidades.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
public interface ClienteRepository extends JpaRepository<Cliente, Long> {



    List<Cliente> findAll();

    Cliente findByCedula(String cedula);


}
