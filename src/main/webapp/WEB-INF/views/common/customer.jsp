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
<title>Quản lý khách hàng</title>
</head>
<body>

	<button type="button" class="btn mr-2 mb-2 btn-primary"
		data-toggle="modal" data-target=".bd-example-modal-lg">Thêm
		khách hàng</button>

	<div class="main-card mb-3 card">
		<div class="card-body">
			<h5 class="card-title">Danh sách khách hàng</h5>
			<div class="table-responsive">
				<table class="mb-0 table">
					<thead>
						<tr>
							<th>#</th>
							<th>Mã KH</th>
							<th>Họ tên</th>
							<th>Số điện thoại</th>
							<th>Địa chỉ</th>
							<th>Trạng thái</th>
							<th>Ngày tạo</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" scope="page" value="0" />
						<c:forEach items="${customerModels}" var="cus">
							<c:set var="i" value="${i + 1}" scope="page" />
							<tr>
								<td>${i}</td>
								<td>${cus.id}</td>
								<td>${cus.name}</td>
								<td>${cus.phoneNo}</td>
								<td>${cus.addr}</td>
								<td>${cus.status}</td>
								<td>${cus.createdDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>