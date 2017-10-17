package com.pucmm.edu.practica11;

import com.pucmm.edu.practica11.entidades.Alquiler;
import com.pucmm.edu.practica11.entidades.Cliente;
import com.pucmm.edu.practica11.entidades.Equipo;
import com.pucmm.edu.practica11.entidades.Factura;
import com.pucmm.edu.practica11.servicios.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

/**
 * Created by Dany on 15/10/2017.
 */
@Controller()
@RequestMapping("/alquileres")
public class AlquilerController {
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

    @RequestMapping(value ={"", "/", "/home"})
    public String getLoginPage(Model model, HttpServletRequest request) {

        return "/indice";
    }

    @RequestMapping("/ver_graficos/")
    public String graficos(Model model,HttpServletRequest request) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        return "/ver_graficos";
    }

    @RequestMapping("/crear_lista")
    public String getAlquilerLista(Model model, HttpServletRequest request, @RequestParam("cliente") String cedula) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        List<Equipo> equipoList = equipoServices.todosEquiposMayorQueCero();

        model.addAttribute("equipos",equipoList);
        model.addAttribute("cliente",cedula);

        return "/lista_alquiler";
    }

    @RequestMapping("/ver_lista")
    public String verListaAlquilerCliente(Model model,  @RequestParam("cliente") String cedula, HttpServletRequest request) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
//        }
        System.out.println(alquilerServices.buscarPorCliente(cedula).size()+"=================================");
        model.addAttribute("lista",alquilerServices.buscarPorCliente(cedula));
        model.addAttribute("cliente", cedula);

        return "/crear_factura";
    }

    @RequestMapping("/alquilar_equipo")
    public String  alquilarEquipo(Model model,HttpServletRequest request, @RequestParam("cliente") String cedula, @RequestParam("id") int id ){
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        Equipo equipo1 = equipoServices.getEquipo(id);
        model.addAttribute("equipo",equipo1);
        model.addAttribute("cliente",cedula);
        model.addAttribute("alquiler", new Alquiler());
        return "/crear_alquiler";

    }

    @PostMapping("/alquilar/")
    public String editarEquipoPost( HttpServletRequest request,
                                    @RequestParam("equipo") int id,@RequestParam("nombre")String nombre,
                                    @RequestParam("cliente") String cedula, @RequestParam("fecha")String fecha
//                                    @RequestParam("cantidad")int Cantidad
) throws ParseException {


        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = formatter.parse(fecha);

//        equipoServices.getEquipo(id).setCantidad(equipoServices.getEquipo(id).getCantidad()-Cantidad);
        Alquiler alquiler = new Alquiler();
//        alquiler.setDiasAlquilado((int)TimeUnit.DAYS.toDays(getDateDiff(new Date(), date, TimeUnit.MILLISECONDS)));
        alquiler.setDevuelto(false);
        alquiler.setEquipo(equipoServices.getEquipo(id));
        alquiler.setNombre(nombre);
        alquiler.setFecha(new Date().getTime());
        alquiler.setFechaPromesa(date.getTime());
        alquiler.setCedula(cedula);
        alquilerServices.creacionAlquiler(alquiler);

        return "redirect:/alquileres/crear_lista?cliente="+cedula;

    }
    public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
        long diffInMillies = date2.getTime() - date1.getTime();
        return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
    }

    @RequestMapping("/redirect/")
    public String alquilerRedirect(Model model, HttpServletRequest request) {
        model.addAttribute("Clientes", clienteServices.todosClientes());
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        return "buscar_cliente";
    }
    @PostMapping("/redirect/")
    public String alquilerRedirectPost( @RequestParam("clientes") String cedula ){

        return "redirect:/alquileres/crear_lista?cliente="+ cedula;
    }

    @RequestMapping("/devolver/")
    public String alquiler_devolver(Model model, HttpServletRequest request) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        model.addAttribute("Clientes", clienteServices.todosClientes());
        return "cliente_devolver";
    }
    @PostMapping("/redirect_devolver/")
    public String alquilerDevolver( @RequestParam("clientes") String cedula ){

        return "redirect:/alquileres/devolver_cliente?cliente="+ cedula;
    }

    @RequestMapping("/redirect_alq_clientes/")
    public String alquilerClienteVer(Model model, HttpServletRequest request) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        model.addAttribute("Clientes", clienteServices.todosClientes());
        return "alquiler_cliente";
    }
    @PostMapping("/redirect_alq_clientes/")
    public String clientesAlquileres( @RequestParam("clientes") String cedula ){

        return "redirect:/alquileres/alq_clientes?cliente="+ cedula;
    }

    @Transactional
    @PostMapping("/facturar/")
    public String alquilerFacturar( @RequestParam("cliente") String cedula ){
        ArrayList<Alquiler> lista = (ArrayList<Alquiler>) alquilerServices.buscarPorCliente(cedula);
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
        return "redirect:/";
    }

    @RequestMapping("/devolver_cliente")
    public String getAlquilerDevolver(Model model, HttpServletRequest request,  @RequestParam("cliente") String cedula) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
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

    @PostMapping("/devolver_equipo/")
    public String alquilerDevolver( @RequestParam("alquiler") int id_alquiler, @RequestParam("cedula") String cedula  ){

        Alquiler alquiler1 = alquilerServices.getAlquiler(id_alquiler);
        alquiler1.setDevuelto(true);
        long diff = new Date().getTime()- alquiler1.getFactura().getFecha().getTime();
        System.out.println("+========================================fecha factra" +""+alquiler1.getFactura().getFecha().getTime());

        alquiler1.setDiasAlquilado((int) TimeUnit.MILLISECONDS.toDays(diff));
        System.out.println("+========================================dias "+(int) TimeUnit.MILLISECONDS.toDays(diff));

        alquilerServices.creacionAlquiler(alquiler1);
        if(alquilerServices.facturaEntregada(alquiler1.getFactura().getId())){
            Factura f = alquiler1.getFactura();
            int total = 0 ;
            for(Alquiler a: alquilerServices.alquileresFactura(f)){
                total+= (a.getSubtotal());
            }
            f.setTotal(total);
            facturaServices.creacionFactura(f);
            return "redirect:/alquileres/ver_factura?factura="+ alquiler1.getFactura().getId();
        }

        return "redirect:/alquileres/devolver_cliente?cliente="+ cedula;
    }

    @RequestMapping("/ver_factura")
    public String showFactura(Model model, HttpServletRequest request, @RequestParam("factura") int  id) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        Factura factura = facturaServices.getFactura(id);
        List<Alquiler> alquileres = alquilerServices.alquileresFactura(factura);
        model.addAttribute("lista_alquileres",alquileres);

        return "/ver_factura";
    }

    @RequestMapping("/no_devueltos/")
    public String getAlquileresNoDevueltos(Model model, HttpServletRequest request) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        List<Alquiler> alquileres = alquilerServices.alquileresNoDevueltos(false);
        model.addAttribute("alquileres", alquileres);
        return "/ver_no_devuelto";
    }

    @RequestMapping("/alq_clientes")
    public String getAlquileresCliente(Model model, @RequestParam("cliente") String cedula, HttpServletRequest request) {
        String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin= (Boolean) request.getSession().getAttribute("isAdmin");
        model.addAttribute("username", username);
        model.addAttribute("usuario", isAdmin);
        Cliente c = clienteServices.getCliente(cedula);
        List<Alquiler> alquileres = alquilerServices.buscarPorCliente(cedula);
        model.addAttribute("alquileres",alquileres);
        model.addAttribute("cliente",c.getNombre() + " " + c.getApellido());

        return "/alquileres_por_cliente";
    }



}
