package com.cdweb.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cdweb.model.VehicleModel;
import com.cdweb.service.impl.VehicleServiceImpl;

@Controller
public class EmployeeController {
	
	@RequestMapping(value = "/nhan-vien/trang-chu")
	public String Home(Model model) {
		return "/employee/home";
	}
}
