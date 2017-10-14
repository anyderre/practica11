package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Familia;
import com.pucmm.edu.practica11.entidades.SubFamilia;
import com.pucmm.edu.practica11.repositorio.SubFamiliaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
@Service
public class SubFamiliaServices {

    //Inyectando el repositorio
    @Autowired
    private SubFamiliaRepository subFamiliaRepository;

    public long cantidadUsuario(){
        return subFamiliaRepository.count();
    }


    @Transactional
    public SubFamilia cracionSubFamilia(SubFamilia familia){
        subFamiliaRepository.save(familia);
        return familia;
    }



    public List<SubFamilia> todasSubFamilias(){
        return subFamiliaRepository.findAll();
    }
    public List<SubFamilia> subFamiliasFamilia(Familia id){
        return subFamiliaRepository.findAllByFamilia(id);
    }

    public SubFamilia getSubfamilia(int id){ return subFamiliaRepository.findById(id);}


}
