package com.lin.sysmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class MainController {
    @RequestMapping(value = "/main")
    public String index() {
        return "main";
    }
}
