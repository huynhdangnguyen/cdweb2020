package com.cdweb.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.service.intf.UserService;

@Controller
@RequestMapping("/quan-ly/tai-khoan")
public class UserControllerMan {
	
	@Autowired
	UserService userService;
	
	@GetMapping("/{offset}/{numItem}")
	public ModelAndView rentPrice(@PathVariable("offset") int offset, @PathVariable("numItem") int numItem, ModelAndView mav){
		mav.addObject("userModels", userService.findAllSortedByModifiedDate(offset, numItem));
		mav.addObject("pageNumber", SystemConstant.pageNumber);
		mav.addObject("offset", offset);
		mav.setViewName("manager/user");
		return mav;
	}
}
