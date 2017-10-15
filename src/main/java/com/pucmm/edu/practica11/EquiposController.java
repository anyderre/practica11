package com.pucmm.edu.practica11;

import com.pucmm.edu.practica11.entidades.Equipo;
import com.pucmm.edu.practica11.entidades.SubFamilia;
import com.pucmm.edu.practica11.servicios.EquipoServices;
import com.pucmm.edu.practica11.servicios.FamiliaServices;
import com.pucmm.edu.practica11.servicios.SubFamiliaServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Paths;
import java.util.List;


/**
 *  Created by Dany 13/10/2017
 */
@Controller()
@RequestMapping("/equipos")
public class EquiposController {


    @Autowired
    private EquipoServices equipoServices;
    @Autowired
    private FamiliaServices familiaServices;
    @Autowired
    private SubFamiliaServices subFamiliaServices;


    @RequestMapping("/")
    public String ver_Equipos(Model model){

        List<Equipo> equipos = equipoServices.todosEquipos();
        System.out.println("Hola :"+equipos.size());
        model.addAttribute("equipos",equipos);
        return "ver_equipos";
    }

    @RequestMapping("/editar_equipo")
    public String editarEquipo(Model model,@RequestParam("id") int id){
        Equipo equipo = equipoServices.getEquipo(id);
        model.addAttribute("equipo",equipo);
        model.addAttribute("Familias",familiaServices.todasFamilias());
        return "/editar_equipo";
    }
    @PostMapping("/editar_equipo")
    public String editarEquipoPost(@ModelAttribute Equipo equipo, @RequestParam("sub-familia") int subFamilia ){
        SubFamilia subfamilia = subFamiliaServices.getSubfamilia(subFamilia);
        equipo.setSubFamilia(subfamilia);
        equipoServices.creacionEquipo(equipo);
        return "redirect:/equipos/";

    }
//
//    @RequestMapping(value="/get_sub_familias", method= RequestMethod.GET, produces="application/json")
//    public List<SubFamilia> pay(@RequestParam("id") int familia_id) {
//        Familia familia = familiaServices.getFamilia(familia_id);
//
//        return subFamiliaServices.subFamiliasFamilia(familia);
//    }

    @RequestMapping("/crear_equipo/")
    public String crearEquipo(Model model){
        model.addAttribute("equipo", new Equipo());
        model.addAttribute("familias", familiaServices.todasFamilias());
        return "crear_equipo";
    }

    @PostMapping("/crear_equipo/")
    @Transactional
    public String guardarEquipo(@ModelAttribute Equipo equipo,
                                @RequestParam("uploadfile") MultipartFile uploadfile, @RequestParam("sub-familia") int id_subFamilia){
        try {
            SubFamilia subFamilia = subFamiliaServices.getSubfamilia(id_subFamilia);
            equipo.setSubFamilia(subFamilia);

            String filename = equipo.getId() + "_" + uploadfile.getOriginalFilename();
            String directory;
            directory ="C:\\fotos\\Equipos";
            String filepath = Paths.get(directory, filename).toString();

            BufferedOutputStream stream =
                    new BufferedOutputStream(new FileOutputStream(new File(filepath)));
            stream.write(uploadfile.getBytes());
            stream.close();
            equipo.setRuta_imagen(filename);
            equipoServices.creacionEquipo(equipo);
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return "redirect:/equipos/";
    }

}
