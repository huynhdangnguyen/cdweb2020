package com.cdweb.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdweb.model.UserModel;
import com.cdweb.util.SecurityUtils;

@Controller
public class LoginController {
	
	@RequestMapping(value = "/dang-nhap")
	public ModelAndView Login(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!auth.getName().equals("anonymousUser")) {
			List<String> roles = SecurityUtils.getAuthorities();
			if(roles.contains("MANAGER"))
				return new ModelAndView("redirect:/quan-ly/trang-chu");
			return new ModelAndView("redirect:/nhan-vien/trang-chu");
		}
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/thoat")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserModel userModel = (UserModel) auth.getPrincipal();
		if (userModel != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return new ModelAndView("redirect:/dang-nhap");
	}
}
