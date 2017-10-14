package com.pucmm.edu.practica11.servicios;



import com.pucmm.edu.practica11.entidades.Rol;
import com.pucmm.edu.practica11.entidades.Usuario;
import com.pucmm.edu.practica11.repositorio.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vacax on 20/09/16.
 */
@Service
public class UsuarioServices {
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    //Inyectando el repositorio
    @Autowired
    private UsuarioRepository usuarioRepository;

    @Autowired
    private UsuarioServices usuarioServices;
    @Autowired
    private RolServices rolServices;

    public long cantidadUsuario(){
        return usuarioRepository.count();
    }


    @Transactional
    public Usuario crearUsuario(Usuario usuario){
        usuarioRepository.save(usuario);
        return usuario;
    }

    @Transactional
    public void crearAdmin(){
        List<Usuario> usuarios = usuarioRepository.findAllByUsername("admin");
        if(usuarios.size()<1){
            Usuario usuario =  new Usuario();
            usuario.setApellido("Admin");
            usuario.setNombre("Administrador");
            usuario.setUsername("admin");
            usuario.setPassword(bCryptPasswordEncoder.encode("admin"));
            Rol rol = new Rol();
            rol.setRol("ROLE_ADMIN");
//            List<Rol> roles = new ArrayList<>();
//            roles.add(rol);
//            usuario.setRoles(roles);
//            crearUsuario(usuario);
            rol.setUsuario(usuario);
            rolServices.creacionRol(rol);
        }
    }
    public List<Usuario> profesoresConApellidos(){

        return usuarioRepository.findAllByApellidoNotNull();
    }



    public List<Usuario> todosUsuarios(){
        return usuarioRepository.findAll();
    }

   /* public Usuario profesorPorCedula(String cedula) {
        return usuarioRepository.consultaProfesor(cedula);
    }*/
}
