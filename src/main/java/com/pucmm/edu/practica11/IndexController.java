package com.pucmm.edu.practica11;


import com.pucmm.edu.practica11.entidades.*;
import com.pucmm.edu.practica11.servicios.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.codehaus.groovy.tools.shell.util.MessageSource;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
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
    private UsuarioServices usuarioServices;

    @Autowired
    RolServices rolServices;

    @RequestMapping(value ={"", "/", "/home"})
    public String getLoginPage(Model model, HttpServletRequest request, Principal principal) {
        //String username = request.getSession().getAttribute("username").toString();
        Boolean isAdmin = false;
        HttpSession session = request.getSession();

        List<Rol> rols = rolServices.rolesUsuario(principal.getName());
        for(Rol rol: rols){
            if(rol.getRol().equals("ROLE_ADMIN")){
                isAdmin= true;
            }
        }
        session.setAttribute("isAdmin", isAdmin);
        model.addAttribute("username", principal.getName());
        model.addAttribute("usuario", isAdmin);
        return "/indice";
    }



}
