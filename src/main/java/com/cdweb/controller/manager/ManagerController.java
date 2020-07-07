package com.cdweb.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ManagerController {
	
	@RequestMapping("/quan-ly/trang-chu")
	public ModelAndView Home(ModelAndView modelAndView) {
		modelAndView.setViewName("/manager/home");
		return modelAndView;
	}
}
