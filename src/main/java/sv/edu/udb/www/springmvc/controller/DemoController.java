package sv.edu.udb.www.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api")
public class DemoController {
    @GetMapping("/hola")
    public String saludar(){
        return "hola";
    }
}
