package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Equipo;
import com.pucmm.edu.practica11.repositorio.EquipoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
@Service
public class EquipoServices {

    //Inyectando el repositorio
    @Autowired
    private EquipoRepository equipoRepository;

    public long cantidadUsuario(){
        return equipoRepository.count();
    }


    @Transactional
    public Equipo creacionEquipo(Equipo equipo){
        equipoRepository.save(equipo);
        return equipo;
    }


    public List<Equipo> todosEquipos(){
        return equipoRepository.findAll();
    }

    public List<Equipo> todosEquiposMayorQueCero(){
        return equipoRepository.findAllByCantidadGreaterThan(0);
    }
    public Equipo getEquipo(int id){return  equipoRepository.findById(id);}
}
