<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Đăng nhập</title>
</head>
<body>
	<div>
		<h1>${page}</h1>
		<h1>${login}</h1>
		<c:if test="${param.incorrectAccount != null}">
			<h1>Tài khoản hoặc mật khẩu không đúng</h1>
		</c:if>
		<form action="j_spring_security_check" id="formLogin" method="post">
			<input type="text" name="id" value="" /> <input type="password"
				name="password" value="" />
			<button type="submit" name="login">đăng nhập</button>
		</form>

	</div>
</body>
</html>
