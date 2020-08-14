package com.cdweb.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.service.intf.PriceService;

@Controller
@RequestMapping("/quan-ly/gia")
public class PriceControllerMan {
	
	@Autowired
	PriceService priceService;
	
	@GetMapping("/{offset}/{numItem}")
	public ModelAndView rentDetail(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, ModelAndView mav){
		mav.addObject("RentDetailModels", priceService.findAllSortedByStartDate(offset, numItem));
		mav.setViewName("manager/price");
		return mav;
	}
}
