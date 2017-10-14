package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Alquiler;
import com.pucmm.edu.practica11.entidades.Cliente;
import com.pucmm.edu.practica11.entidades.Factura;
import com.pucmm.edu.practica11.repositorio.AlquilerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
@Service
public class AlquilerServices {

    //Inyectando el repositorio
    @Autowired
    private AlquilerRepository alquilerRepository;
    @Autowired
    private FacturaServices facturaServices;

    public long cantidadUsuario(){
        return alquilerRepository.count();
    }


    @Transactional
    public Alquiler creacionAlquiler(Alquiler alquiler){
        alquilerRepository.save(alquiler);
        return alquiler;
    }



    public List<Alquiler> todosAlquileres(){
        return alquilerRepository.findAll();
    }

    public List<Alquiler> alquileresFactura(Factura factura){return alquilerRepository.findByFactura(factura);}

    public Alquiler getAlquiler(int id){
        return alquilerRepository.findById(id);
    }

    public boolean facturaEntregada(int id){
        Factura factura = facturaServices.getFactura(id);
        List<Alquiler> alquileres = alquileresFactura(factura);
        for(Alquiler a: alquileres){
            if(!a.getDevuelto())
                return false;
        }
        return true;
    }

    public List<Alquiler> alquileresNoDevueltos(boolean devuelto){return alquilerRepository.findByDevueltoOrderByDiasAlquiladoDesc(devuelto);}

    public List<Alquiler> buscarPorCliente(Cliente c){return alquilerRepository.buscarPorCliente(c);}
    public List<Object> subFamiliasDias(){return alquilerRepository.diasSubfamilias();}
    public List<Object> familiasDias(){return alquilerRepository.diasFamilias();}

}
