package com.cdweb.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.cdweb.model.MyUserModel;

public class SecurityUtils {

	public static MyUserModel getPrincipal() {
		MyUserModel userModel = (MyUserModel) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
		return userModel;
	}

	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() {
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>) (SecurityContextHolder.getContext()
				.getAuthentication().getAuthorities());
		for (GrantedAuthority authority : authorities) {
			results.add(authority.getAuthority());
		}
		return results;
	}

	public static String roleToString() {
		if (getAuthorities().contains("MANAGER")) {
			return "Quản lý";
		} else {
			return "Nhân viên";
		}
	}
	
	public static String roleToUrl() {
		if (getAuthorities().contains("MANAGER")) {
			return "quan-ly";
		} else {
			return "nhan-vien";
		}
	}
}