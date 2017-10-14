package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Cliente;
import com.pucmm.edu.practica11.entidades.Factura;
import com.pucmm.edu.practica11.repositorio.FacturaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class FacturaServices {

    //Inyectando el repositorio
    @Autowired
    private FacturaRepository facturaRepository;

    public long cantidadUsuario(){
        return facturaRepository.count();
    }


    @Transactional
    public Factura creacionFactura(Factura factura){
        facturaRepository.save(factura);
        return factura;
    }



    public List<Factura> todasFacturas(){
        return facturaRepository.findAll();
    }
    public List<Factura> facturasActivas(Boolean activo){
        return facturaRepository.findByActiva(activo);
    }

    public Factura getFactura(int id){
        return facturaRepository.findById(id);
    }

    public List<Factura> getFacturasCliente(Cliente c){return facturaRepository.encontrarFacturaCliente(c);}


}
