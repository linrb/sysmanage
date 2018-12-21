package com.lin.sysmanage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class MainController {
    @RequestMapping(value = "/index")
    public String index() throws Exception {
       // throw new Exception("发生错误");
        return "index";
    }

    @RequestMapping(value = "/main")
    public String main() {
        return "main";
    }
}
