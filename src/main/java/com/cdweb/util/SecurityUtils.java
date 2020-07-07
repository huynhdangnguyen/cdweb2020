package com.cdweb.util;
import java.util.ArrayList;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import com.cdweb.model.UserModel;

public class SecurityUtils {
	
	public static UserModel getPrincipal() {
		UserModel userModel = (UserModel) (SecurityContextHolder.getContext()).getAuthentication().getPrincipal();
        return userModel;
    }
	
	@SuppressWarnings("unchecked")
	public static List<String> getAuthorities() {
		List<String> results = new ArrayList<>();
		List<GrantedAuthority> authorities = (List<GrantedAuthority>)(SecurityContextHolder.getContext().getAuthentication().getAuthorities());
        for (GrantedAuthority authority : authorities) {
            results.add(authority.getAuthority());
        }
		return results;
	}
}