package com.pucmm.edu.practica11.servicios;


import com.pucmm.edu.practica11.entidades.Cliente;
import com.pucmm.edu.practica11.repositorio.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
@Service
public class ClienteServices {

    //Inyectando el repositorio
    @Autowired
    private ClienteRepository clienteRepository;

    public long cantidadUsuario(){
        return clienteRepository.count();
    }


    @Transactional
    public Cliente creacionCliente(Cliente cliente){
        clienteRepository.save(cliente);
        return cliente;
    }


    public List<Cliente> todosClientes(){
        return clienteRepository.findAll();
    }

    public Cliente getCliente(String cedula){
        return clienteRepository.findByCedula(cedula);
    }


}
