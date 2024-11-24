package com.arun.demo.registrationaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.arun.demo.beans.Registrationdetails;

@Controller
public class RegistrationController {
	@Autowired
	private RegistrationService service;
	
	 @PostMapping("/save")
	    public String saveUser(@ModelAttribute("user") Registrationdetails user, Model model) {
	        service.saveUser(user);
	        model.addAttribute("message", "Registration successful!");
	        return "redirect:/loginForm"; 
	    }
	
	

}
