package com.cdweb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cdweb.model.Vehicle;
import com.cdweb.service.impl.VehicleService;

@Controller
public class HomeController {
	
	@Autowired
	VehicleService vehicleService;
	
	@RequestMapping(value = "/trang-chu")
	public String Home(Model model) {
		model.addAttribute("page", "home");
//		List<Vehicle> list = vehicleService.findAll();
//		for(Vehicle vehicle : list) {
//			System.out.println(vehicle.toString());
//		}
		return "home";
	}
}
