package com.arun.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String entry()
	{
		return "Entrypage";
	}
	
	@GetMapping("/register")
	public String register()
	{
		return "Register";
	}
	@GetMapping("/loginForm")
	public String login()
	{
		return "Login";
	}
	@GetMapping("/about")
	public String about()
	{
		return "About";
	}
	@GetMapping("/contact")
	public String contact()
	{
		return "Contact";
	}
	@GetMapping("/admin")
	public String Admin()
	{
		return "Admin";
	}
	@GetMapping("/booking")
	public String Booking()
	{
		return "Booking";
	}
	@GetMapping("/bookinglogin")
	public String Bookinglogin()
	{
		return "Loginconfirm";
	}
	@GetMapping("/forget")
	public String forget()
	{
		return "Forget";
	}
	@GetMapping("/Bookingconfirm")
	public String bookingconfirm()
	{
		return "Bookingconfirm";
	}

	
	

}
