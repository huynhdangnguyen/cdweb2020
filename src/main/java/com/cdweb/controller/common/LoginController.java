package com.cdweb.controller.common;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.constant.SystemConstant;
import com.cdweb.model.CustomerModel;
import com.cdweb.model.MyUserModel;
import com.cdweb.model.VehicleModel;
import com.cdweb.service.impl.CustomerServiceImpl;
import com.cdweb.service.impl.VehicleServiceImpl;
import com.cdweb.service.intf.CustomerService;
import com.cdweb.service.intf.StatisticService;
import com.cdweb.util.SecurityUtils;

@Controller
public class LoginController {
	
	@Autowired
	CustomerService customerService;
	
	@Autowired
	StatisticService statisticService;
	
	@RequestMapping(value = "/dang-nhap")
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!auth.getName().equals("anonymousUser")) {
			List<String> roles = SecurityUtils.getAuthorities();
			if(roles.contains("MANAGER"))
				return new ModelAndView("redirect:/quan-ly/khach-hang/" + SystemConstant.DEFAULT_OFFSET + "/" + SystemConstant.DEFAULT_NUM_ITEM);
			return new ModelAndView("redirect:/nhan-vien/khach-hang/" + SystemConstant.DEFAULT_OFFSET + "/" + SystemConstant.DEFAULT_NUM_ITEM);
		}
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/thoat")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		MyUserModel userModel = (MyUserModel) auth.getPrincipal();
		if (userModel != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/dang-nhap");
	}
}
