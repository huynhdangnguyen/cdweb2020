<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cdweb.util.SecurityUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quan ly khach hang</title>
</head>
<body>
	<h1>Đây là trang quản lý khách hàng</h1>
	<security:authorize access="isAuthenticated()">
		<h1>xin chào ${SecurityUtils.getPrincipal().getName()}</h1>
	</security:authorize>

	<form name="customerForm" id="customerForm">
			<label>id:</label>
			<input type="text" placeholder="Chứng minh nhân dân" name="id" />
		<button type="button" onclick="createCustomer()">Thêm khách hàng</button>
	</form>
	<a href="<c:url value='/thoat'/>">Đăng xuất</a>


	<script type="text/javascript">
		function createCustomer() {
		//	var id = document.customerForm.id.value;
			var url = window.location.origin + "/parkinglotmanagement/api/khach-hang/them";
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					document.getElementById("customerForm").innerHTML = data;
				}
			}
			xhttp.open("POST", url, true);
			xhttp.setRequestHeader("Content-Type", "application/json");
			xhttp.send(JSON.stringify({ id : document.customerForm.id.value}));
		}
	</script>
</body>
</html>