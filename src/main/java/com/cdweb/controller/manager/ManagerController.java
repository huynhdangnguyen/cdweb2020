package com.cdweb.controller.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.entity.VehicleEntity;
import com.cdweb.model.MyUserModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.util.SecurityUtils;

@Controller
public class ManagerController {
	
	@RequestMapping("/quan-ly/trang-chu")
	public ModelAndView Home(ModelAndView modelAndView) {
		modelAndView.setViewName("/manager/home");
//		MyUserModel myUserModel = SecurityUtils.getPrincipal();
//		modelAndView.addObject(myUserModel);
		return modelAndView;
	}
	
}
