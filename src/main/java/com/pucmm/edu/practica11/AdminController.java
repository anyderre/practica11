package com.pucmm.edu.practica11;

import com.pucmm.edu.practica11.entidades.Familia;
import com.pucmm.edu.practica11.entidades.SubFamilia;
import com.pucmm.edu.practica11.servicios.FamiliaServices;
import com.pucmm.edu.practica11.servicios.RolServices;
import com.pucmm.edu.practica11.servicios.SubFamiliaServices;
import com.pucmm.edu.practica11.servicios.UsuarioServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Locale;

/**
 *  Created by Dany 13/10/2017
 */
@Controller()
@RequestMapping("/zona_admin")
public class AdminController {
    @Autowired
    private UsuarioServices usuarioService;

    @Autowired
    private MessageSource messageSources;


    @Autowired
    private FamiliaServices familiaServices;
    @Autowired
    private SubFamiliaServices subFamiliaServices;

    @Autowired
    private RolServices rolServices;

    @RequestMapping("/")
    public String verUsuarios(Model model){
        model.addAttribute("usuarios",usuarioService.todosUsuarios());
        return "/administracion";
    }

    @RequestMapping("/familias/")
    public String verFamilias(Model model){
        model.addAttribute("familias", familiaServices.todasFamilias());
        return "/ver_familias";
    }

     @RequestMapping("/familias/crear_familia/")
    public String crearFamilia(Model model){
        model.addAttribute("familia",new Familia());
        return "/crear_familia";
    }


    @PostMapping("/familias/crear_familia/")
    public String crearFamiliaPost(@ModelAttribute Familia familia){
        familiaServices.creacionFamilia(familia);
        return "redirect:/zona_admin/familias/";
    }

    @RequestMapping("/familias/editar_familia")
    public String editarFamilia(Model model,@RequestParam("id") int id){
        Familia familia = familiaServices.getFamilia(id);
        model.addAttribute("familia",familia);
        model.addAttribute("sub_familias",subFamiliaServices.subFamiliasFamilia(familia));
        return "/editar_familia";
    }

    @PostMapping("/familias/editar_familia")
    public String guardarFamiliaEditada(@RequestParam("familia_id") int id, @RequestParam("nombre") String subFamilia){
        Familia familia = familiaServices.getFamilia(id);
        SubFamilia sub = new SubFamilia();
        sub.setNombre(subFamilia);
        sub.setFamilia(familia);
        subFamiliaServices.cracionSubFamilia(sub);
        return "redirect:/zona_admin/familias/editar_familia?id="+ familia.getId();
    }


//
//    @RequestMapping("/crear_usuario/")
//    public String crearUsuario(Model model){
//        model.addAttribute("usuario", new Usuario());
//        model.addAttribute("allRoles", rolServices.todosRoles());
//        return "/crear_usuario";
//    }
//
//    @PostMapping("/crear_usuario/")
//    @Transactional
//    public String crearUsuarioPost(
//            @RequestParam("roles") String[] roles, @RequestParam("username") String usuario,
//            @RequestParam("password") String password, @RequestParam("nombre") String nombre,
//            @RequestParam("apellido") String apellido
//            ){
//        Usuario u = new Usuario();
//        u.setUsername(usuario);
//        u.setNombre(nombre);
//        u.setApellido(apellido);
//         usuario.setPassword(bCryptPasswordEncoder.encode(password));
//
//        u = usuarioServices.creacionUsuario(u);
//
//        for(String rol: roles){
//            Rol r = new Rol();
//            r.setUsuario(u);
//            r.setRol(rol);
//            rolServices.creacionRol(r);
//        }
//
//        return "redirect:/zona_admin/";
//    }
//
//    @RequestMapping("/crear_rol/")
//    public String crearRol(Model model){
//        model.addAttribute("rol", new Rol());
//        return "crear_rol";
//    }
//
//    @PostMapping("/crear_rol/")
//    public String crearRolPost(@ModelAttribute Rol rol){
//
//        return "lol";
//
//    }





}
