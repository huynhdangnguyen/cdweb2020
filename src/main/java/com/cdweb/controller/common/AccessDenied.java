package com.cdweb.controller.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccessDenied {

	@RequestMapping(value = "/access-denied")
	public ModelAndView accessDenied(ModelAndView modelAndView) {
		modelAndView.setViewName("accessdenied");
		return modelAndView;
	}
}

