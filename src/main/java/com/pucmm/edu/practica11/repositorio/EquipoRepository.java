package com.pucmm.edu.practica11.repositorio;


import com.pucmm.edu.practica11.entidades.Equipo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
public interface EquipoRepository extends JpaRepository<Equipo, Long> {



    List<Equipo> findAll();

    Equipo findById(int id);



}
