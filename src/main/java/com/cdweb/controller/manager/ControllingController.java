package com.cdweb.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/quan-ly")
public class ControllingController {

	
	@GetMapping("/kiem-soat")
	public ModelAndView Controlling(ModelAndView mav) {
		mav.setViewName("common/controlling");
		return mav;
	}
}
