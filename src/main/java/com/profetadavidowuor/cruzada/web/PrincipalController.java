package com.profetadavidowuor.cruzada.web;

import com.profetadavidowuor.cruzada.service.CargoService;
import com.profetadavidowuor.cruzada.service.ConferenciaService;
import com.profetadavidowuor.cruzada.service.FuenteService;
import com.profetadavidowuor.cruzada.service.PaisService;
import com.profetadavidowuor.cruzada.util.Constante;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PrincipalController {

    @Autowired
    private PaisService paisService;

    @Autowired
    private CargoService cargoService;

    @Autowired
    private FuenteService fuenteService;

    @Autowired
    private ConferenciaService conferenciaService;

    @GetMapping("/")
    public String inicioPage(Model model) {
        //model.addAttribute("appName", appName);
        return "home";
    }

    @GetMapping("/registroconferencia")
    public String registroConferenciaPage(Model model) throws Exception {

        model.addAttribute("conferencia", conferenciaService.obtenerConferenciaPorPais(Constante.COD_PAIS_REPUBLICA_DOMINICANA));
        model.addAttribute("paises", paisService.listarPaises());
        model.addAttribute("cargos", cargoService.listarCargos());
        model.addAttribute("fuentes", fuenteService.listarFuentes());

        return "registroconferencia";
    }
}
