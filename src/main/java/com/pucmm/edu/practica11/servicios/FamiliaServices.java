package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Familia;
import com.pucmm.edu.practica11.repositorio.FamiliaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class FamiliaServices {

    //Inyectando el repositorio
    @Autowired
    private FamiliaRepository familiaRepository;

    public long cantidadUsuario(){
        return familiaRepository.count();
    }


    @Transactional
    public Familia creacionFamilia(Familia familia){
        familiaRepository.save(familia);
        return familia;
    }

    public Familia getFamilia(int id){return familiaRepository.findById(id);}



    public List<Familia> todasFamilias(){
        return familiaRepository.findAll();
    }


}
