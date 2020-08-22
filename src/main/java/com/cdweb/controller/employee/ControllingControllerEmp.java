package com.cdweb.controller.employee;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/nhan-vien")
public class ControllingControllerEmp {
	@GetMapping("/kiem-soat")
	public ModelAndView Controlling(ModelAndView mav) {
		mav.setViewName("common/controlling");
		return mav;
	}
}
