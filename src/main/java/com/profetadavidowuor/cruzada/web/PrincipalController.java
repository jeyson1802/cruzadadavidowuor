package com.profetadavidowuor.cruzada.web;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PrincipalController {

    @Value("${spring.application.name}")
    String appName;

    @GetMapping("/")
    public String inicioPage(Model model) {
        model.addAttribute("appName", appName);
        return "home";
    }

    @GetMapping("/registroconferencia")
    public String registroConferenciaPage(Model model) {
        model.addAttribute("appName", appName);
        return "registroconferencia";
    }
}
