package com.cdweb.security;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.cdweb.constant.SystemConstant;
import com.cdweb.util.SecurityUtils;

@Component
public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

	@Override
	protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		String targetUrl = determineTargetUrl(authentication);
		redirectStrategy.sendRedirect(request, response, targetUrl);
	}

	private String determineTargetUrl(Authentication authentication) {
		List<String> roles = SecurityUtils.getAuthorities();
		if (isManager(roles)) {
//			return "/quan-ly/khach-hang/" + SystemConstant.DEFAULT_OFFSET + "/" + SystemConstant.DEFAULT_NUM_ITEM;
			return "/quan-ly/kiem-soat";
		}
//			return "/nhan-vien/khach-hang/" + SystemConstant.DEFAULT_OFFSET + "/" + SystemConstant.DEFAULT_NUM_ITEM;
		return "/nhan-vien/kiem-soat";
	}

	private boolean isManager(List<String> roles) {
		if (roles.contains("MANAGER")) {
			return true;
		}
		return false;
	}

}
