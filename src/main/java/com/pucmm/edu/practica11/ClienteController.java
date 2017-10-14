package com.pucmm.edu.practica11;


import com.pucmm.edu.practica11.entidades.Cliente;
import com.pucmm.edu.practica11.servicios.ClienteServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.List;

/**
 *  Created by Dany 13/10/2017
 */
@Controller()
@RequestMapping("/clientes")
public class ClienteController {
    @Autowired
    private ClienteServices clienteServices;


    @RequestMapping("/")
    public String verClientes (Model model){

        List<Cliente> clientes = clienteServices.todosClientes();
        model.addAttribute("clientes",clientes);
        return "ver_clientes";
    }

    @RequestMapping("/editar_cliente")
    public String editarCliente(Model model,@RequestParam("cedula") String cedula){
        Cliente cliente = clienteServices.getCliente(cedula);
        model.addAttribute("cliente",cliente);
        return "/editar_cliente";
    }

    @PostMapping("/editar_cliente")
    public String editarClientePost(@ModelAttribute Cliente cliente){
        clienteServices.creacionCliente(cliente);
        return "redirect:/clientes/";

    }

    @RequestMapping("/crear_cliente/")
    public String crearCliente(Model model){
        model.addAttribute("cliente", new Cliente());
        return "/crear_cliente";
    }

    @PostMapping("/crear_cliente/")
    @Transactional
    public String crearUsuarioPost(@ModelAttribute Cliente cliente,
            @RequestParam("uploadfile") MultipartFile uploadfile
            ){
        try {

            String filename = cliente.getCedula() + "_" + uploadfile.getOriginalFilename();
            String directory;
            directory ="C:\\var\\clientes";
            String filepath = Paths.get(directory, filename).toString();

            BufferedOutputStream stream =
                    new BufferedOutputStream(new FileOutputStream(new File(filepath)));
            stream.write(uploadfile.getBytes());
            stream.close();
            cliente.setRuta_imagen(filename);
            clienteServices.creacionCliente(cliente);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());

        }

        return "redirect:/clientes/";
    }








}
