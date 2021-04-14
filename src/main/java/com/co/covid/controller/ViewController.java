package com.co.covid.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
	
	@GetMapping("/")
	public String Index() {
		return "index";
	}
	
	@GetMapping("/contacto")
	public String Contacto() {	
		return "contacto";
	}
	
}
