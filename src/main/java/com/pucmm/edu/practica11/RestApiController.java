package com.pucmm.edu.practica11;


import com.google.gson.Gson;
import com.pucmm.edu.practica11.entidades.Familia;
import com.pucmm.edu.practica11.servicios.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 *
 * Created by Dany 13/10/2017
 */


@RestController
public class RestApiController {

    //Inyección de dependecia.
    @Autowired
    private SubFamiliaServices subFamiliaServices;

    @Autowired
    private FamiliaServices familiaServices;

    @Autowired
    private ClienteServices clienteServices;

    @Autowired
    private EquipoServices equipoService;

    @Autowired
    private AlquilerServices alquilerServices;



    @RequestMapping(value ="/subfamilias",method = RequestMethod.GET, produces = "application/json")
    public String listaDeSubfamilias(@RequestParam("id") int familia_id){
        Familia familia = familiaServices.getFamilia(familia_id);
        Gson gson = new Gson();
        String result = gson.toJson(subFamiliaServices.subFamiliasFamilia(familia));
        return result;
    }
//
//    @RequestMapping(value ="/listado_clientes/",method = RequestMethod.GET, produces = "application/json")
//    public String getClientes(){
//        List<Cliente> clientes = clienteServices.todosClientes();
//        Gson gson = new Gson();
//        String result = gson.toJson(clientes);
//        return result;
//    }
//
//    @RequestMapping(value ="/sub_familias/",method = RequestMethod.GET, produces = "application/json")
//    public String getSubfamilias(){
//        List<Object> objetos = alquilerServices.subFamiliasDias();
//        Gson gson = new Gson();
//        String result = gson.toJson(objetos);
//        return result;
//    }
//
//    @RequestMapping(value ="/familias/",method = RequestMethod.GET, produces = "application/json")
//    public String getFamilias(){
//        List<Object> objetos = alquilerServices.familiasDias();
//        Gson gson = new Gson();
//        String result = gson.toJson(objetos);
//        return result;
//    }
//
//    @RequestMapping(value ="/validar_existencia",method = RequestMethod.GET, produces = "application/json")
//    public String validarExistencia(@RequestParam("id") int equipo_id){
//        Equipo equipo = equipoService.getEquipo(equipo_id);
//        MensajeValidador mensajeValidador = new MensajeValidador();
//        if(equipo.getCantidad() <= 0){
//            mensajeValidador.setValido(false);
//            mensajeValidador.setMensaje("Este equipo no esta disponible.");
//        }
//        else {
//            mensajeValidador.setValido(true);
//            mensajeValidador.setMensaje("exito");
//        }
//        Gson gson = new Gson();
//        String result = gson.toJson(mensajeValidador);
//        return result;
//    }
//
//    private class MensajeValidador{
//        private String mensaje;
//        private boolean valido;
//
//        public MensajeValidador(String mensaje, boolean valido) {
//            this.mensaje = mensaje;
//            this.valido = valido;
//        }
//
//        public MensajeValidador() {
//        }
//
//        public String getMensaje() {
//            return mensaje;
//        }
//
//        public void setMensaje(String mensaje) {
//            this.mensaje = mensaje;
//        }
//
//        public boolean isValido() {
//            return valido;
//        }
//
//        public void setValido(boolean valido) {
//            this.valido = valido;
//        }
//    }




}
