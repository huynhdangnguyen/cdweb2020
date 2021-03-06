package com.cdweb.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.service.intf.PriceService;

@Controller
@RequestMapping("/quan-ly/gia")
public class PriceControllerMan {
	
	@Autowired
	PriceService priceService;
	
	@GetMapping("/{offset}/{numItem}")
	public ModelAndView rentPrice(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, ModelAndView mav){
		mav.addObject("priceModels", priceService.findAllSortedByStartDate(offset, numItem));
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.setViewName("manager/price");
		return mav;
	}
}
