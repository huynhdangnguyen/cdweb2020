package com.cdweb.controller.employee;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.service.intf.RentDetailService;

@Controller
@RequestMapping("/nhan-vien/chi-tiet-thue")
public class RentDetailControllerEmp{

	@Autowired
	RentDetailService rentDetailService;
	
	@GetMapping("/{offset}/{numItem}")
	public ModelAndView rentDetail(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, ModelAndView mav){
		mav.addObject("rentDetailModels", rentDetailService.findAllSortedByPlateNo(offset, numItem));
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.setViewName("common/rentdetail");
		return mav;
	}
}
