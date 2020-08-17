package com.cdweb.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.model.HistoryModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.service.impl.CustomerServiceImpl;
import com.cdweb.service.impl.HistoryServiceImpl;
import com.cdweb.service.impl.VehicleServiceImpl;
import com.cdweb.service.intf.CustomerService;
import com.cdweb.service.intf.HistoryService;

@Controller
@RequestMapping("/nhan-vien/khach-hang")
public class CustomerControllerEmp {

	@Autowired
	CustomerService customerService;

	@GetMapping("/{offset}/{numItem}")
	public ModelAndView customer(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem,
			ModelAndView mav) {
		mav.addObject("customerModels", customerService.findAll(offset, numItem));
		mav.addObject("pageNumber", CustomerServiceImpl.pageNumber);
		mav.addObject("offset", offset);
		mav.setViewName("common/customer");
		return mav;
	}
}
