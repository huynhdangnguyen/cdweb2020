package com.cdweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/login")
	public ModelAndView Login( ModelAndView modelAndView) {
		modelAndView.addObject("login", "this is login page");
		modelAndView.setViewName("login");
		return modelAndView;
	}
}
