<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<link href="<c:url value='/ui-assets/main.css'/>" rel="stylesheet" />
<script type="text/javascript" src="<c:url value='/ui-assets/scripts/main.js'/>"></script>
</head>
<body>
<%@ include file="header.jsp" %>
	<h1>Trang chủ</h1>
	<h1>Menu</h1>
	<a href="<c:url value="/login"></c:url>"> login page</a>
	<h1>${hello}</h1>
</body>
</html>