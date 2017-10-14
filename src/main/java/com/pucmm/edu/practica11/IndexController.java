package com.pucmm.edu.practica11;


import com.pucmm.edu.practica11.entidades.Alquiler;
import com.pucmm.edu.practica11.entidades.Cliente;
import com.pucmm.edu.practica11.entidades.Equipo;
import com.pucmm.edu.practica11.entidades.Factura;
import com.pucmm.edu.practica11.servicios.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

/**
 * Created by Dany 13/10/2017
 */

@Controller()
@RequestMapping("/")
public class IndexController {

    @Autowired
    private EquipoServices equipoServices;

    @Autowired
    private FamiliaServices familiaServices;

    @Autowired
    private SubFamiliaServices subFamiliaServices;

    @Autowired
    private ClienteServices clienteServices;

    @Autowired
    private FacturaServices facturaServices;

    @Autowired
    private AlquilerServices alquilerServices;

    @RequestMapping("/")
    public String getLoginPage(Model model, HttpServletRequest request) {

        return "/indice";
    }

    @RequestMapping("/alquileres/ver_graficos/")
    public String graficos(Model model) {

        return "/ver_graficos";
    }

    @RequestMapping("/alquileres/crear_lista")
    public String getAlquilerLista(Model model, HttpServletRequest request, @RequestParam("cliente") String cedula) {
        request.getSession().setAttribute("papazon","klk");
        List<Equipo> equipoList = equipoServices.todosEquipos();
        model.addAttribute("equipos",equipoList);
        model.addAttribute("cliente",cedula);

        return "/lista_alquiler";
    }

    @RequestMapping("/alquileres/ver_lista")
    public String verListaAlquilerCliente(Model model,  @RequestParam("cliente") String cedula, HttpServletRequest request) {

        ArrayList<Alquiler> lista = (ArrayList<Alquiler>) request.getSession().getAttribute("listaAlquiler");
        if(lista  == null){
            lista = new ArrayList<>();
        }
        model.addAttribute("lista_alquiler",lista);
        model.addAttribute("cliente", cedula);

        return "/crear_factura";
    }

    @RequestMapping("/alquileres/alquilar_equipo")
    public String  alquilarEquipo(Model model, @RequestParam("cliente") String cedula, @RequestParam("id") int id ){

        Equipo equipo1 = equipoServices.getEquipo(id);
        model.addAttribute("equipo",equipo1);
        model.addAttribute("cliente",cedula);
        model.addAttribute("alquiler", new Alquiler());
        return "/crear_alquiler";


    }

    @PostMapping("/alquileres/alquilar/")
    public String editarEquipoPost( HttpServletRequest request,
                                   @RequestParam("equipo") int id, @RequestParam("cliente") String cedula
                                   ){
        Alquiler alquiler = new Alquiler();
        alquiler.setDevuelto(false);
        alquiler.setEquipo(equipoServices.getEquipo(id));
        alquiler.setNombre("alquiler");


        ArrayList<Alquiler> lista = (ArrayList<Alquiler>) request.getSession().getAttribute("listaAlquiler");
        if(lista  == null){
            lista = new ArrayList<>();
        }
        lista.add(alquiler);
        request.getSession().setAttribute("listaAlquiler",lista);

        return "redirect:/alquileres/crear_lista?cliente="+cedula;

    }

    @PostMapping("/alquileres/redirect/")
    public String alquilerRedirect( @RequestParam("clientes") String cedula ){

        return "redirect:/alquileres/crear_lista?cliente="+ cedula;
    }

    @PostMapping("/alquileres/redirect_devolver/")
    public String alquilerDevolver( @RequestParam("clientes") String cedula ){

        return "redirect:/alquileres/devolver_cliente?cliente="+ cedula;
    }

    @PostMapping("/alquileres/redirect_alq_clientes/")
    public String clientesAlquileres( @RequestParam("clientes") String cedula ){

        return "redirect:/alquileres/alq_clientes?cliente="+ cedula;
    }



    @Transactional
    @PostMapping("/alquileres/facturar/")
    public String alquilerFacturar( HttpServletRequest request, @RequestParam("cliente") String cedula ){
        ArrayList<Alquiler> lista = (ArrayList<Alquiler>) request.getSession().getAttribute("listaAlquiler");
        if(lista.size() == 0){
            return "redirect:/alquileres/crear_lista?cliente="+ cedula;
        }
        Factura factura = new Factura();
        factura.setActiva(true);
        factura.setCliente(clienteServices.getCliente(cedula));
        factura.setFecha(new Date());
        facturaServices.creacionFactura(factura);
        for(Alquiler a : lista){
            a.setFactura(factura);
            alquilerServices.creacionAlquiler(a);
            Equipo e = a.getEquipo();
            e.setCantidad(e.getCantidad()-1);
            equipoServices.creacionEquipo(e);

        }

        request.getSession().setAttribute("listaAlquiler",new ArrayList<Alquiler>());
        return "redirect:/";
    }

    @RequestMapping("/alquileres/devolver_cliente")
    public String getAlquilerDevolver(Model model,  @RequestParam("cliente") String cedula, HttpServletRequest request) {

        Cliente cliente = clienteServices.getCliente(cedula);
        List<Factura> facturas = facturaServices.getFacturasCliente(cliente);
        ArrayList<Alquiler> todosAlquileres = new ArrayList<>();
        for(Factura f : facturas){
            List<Alquiler> alquileres = alquilerServices.alquileresFactura(f);
            for(Alquiler a: alquileres){
                if(!a.getDevuelto())
                    todosAlquileres.add(a);
            }
        }

        model.addAttribute("cliente", cedula);
        model.addAttribute("alquileres", todosAlquileres);
        return "/ver_alquileres_cliente";
    }

    @PostMapping("/alquileres/devolver_equipo/")
    public String alquilerDevolver( @RequestParam("alquiler") int alquiler, @RequestParam("cedula") String cedula  ){

        Alquiler alquiler1 = alquilerServices.getAlquiler(alquiler);
        alquiler1.setDevuelto(true);
        long diff = new Date().getTime()- alquiler1.getFactura().getFecha().getTime();
        alquiler1.setDiasAlquilado((int)TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
        alquilerServices.creacionAlquiler(alquiler1);
        if(alquilerServices.facturaEntregada(alquiler1.getFactura().getId())){
            Factura f = alquiler1.getFactura();
            int total = 0 ;
            for(Alquiler a: alquilerServices.alquileresFactura(f)){
                total+= a.getSubtotal();
            }
            f.setTotal(total);
            facturaServices.creacionFactura(f);
            return "redirect:/alquileres/ver_factura?factura="+ alquiler1.getFactura().getId();
        }

        return "redirect:/alquileres/devolver_cliente?cliente="+ cedula;


    }

    @RequestMapping("/alquileres/ver_factura")
    public String showFactura(Model model,  @RequestParam("factura") int  id) {

        Factura factura = facturaServices.getFactura(id);
        List<Alquiler> alquileres = alquilerServices.alquileresFactura(factura);
        model.addAttribute("lista_alquileres",alquileres);

        return "/ver_factura";
    }

    @RequestMapping("/alquileres/no_devueltos/")
    public String getAlquileresNoDevueltos(Model model, HttpServletRequest request) {

        List<Alquiler> alquileres = alquilerServices.alquileresNoDevueltos(false);
        model.addAttribute("alquileres", alquileres);
        return "/ver_no_devuelto";
    }

    @RequestMapping("/alquileres/alq_clientes")
    public String getAlquileresCliente(Model model, HttpServletRequest request, @RequestParam("cliente") String cedula) {
        Cliente c = clienteServices.getCliente(cedula);
        List<Alquiler> alquileres = alquilerServices.buscarPorCliente(c);
        model.addAttribute("alquileres",alquileres);
        model.addAttribute("cliente",c.getNombre() + " " + c.getApellido());

        return "/alquileres_por_cliente";
    }




}
