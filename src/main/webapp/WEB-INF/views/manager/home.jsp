<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cdweb.util.SecurityUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quan tri</title>
</head>
<body>
	<h1>Đây là trang quản lý</h1>
	<security:authorize access="isAuthenticated()">
		<h1>xin chào ${SecurityUtils.getPrincipal().getName()}</h1>
	</security:authorize>
	<a href="<c:url value='/thoat'/>">Đăng xuất</a>
</body>
</html>