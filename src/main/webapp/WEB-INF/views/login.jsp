<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Đăng nhập</title>
</head>
<body>
	<h1>${login}</h1>
	<c:if test="${param.incorrectAccount != null}">
		<h1>Tài khoản hoặc mật khẩu không đúng</h1>
	</c:if>
	<form action="j_spring_security_check" id="formLogin" method="post">
		<input type="text" name="id" /> <input type="password"
			name="password" />
		<button type="submit">đăng nhập</button>
	</form>
	<c:forEach var="customerModel" items="${listCustomerModel}" >
		<h1>${customerModel.toString()}</h1>
	</c:forEach>
</body>
</html>