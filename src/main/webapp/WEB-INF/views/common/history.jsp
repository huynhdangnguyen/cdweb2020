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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý lịch sử</title>
</head>
<body>
	<div class="main-card mb-3 card">
		<div class="card-body">
			<h5 class="card-title">Danh sách lịch sử</h5>
			<div class="table-responsive">
				<table class="mb-0 table">
					<thead>
						<tr>
							<th>#</th>
							<th>Biển số</th>
							<th>Loại thẻ</th>
							<th>Mã khách hàng</th>
							<th>Thời gian vào</th>
							<th>Thời gian ra</th>
							<th>Số tiền</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="i" scope="page" value="0" />
						<c:forEach items="${historyModels}" var="his">
							<c:set var="i" value="${i + 1}" scope="page" />
							<tr>
								<td>${i}</td>
								<td>${his.plateNo}</td>
								<c:choose>
									<c:when test="${his.getCustomerModel().getId() != null}">
										<td>Thẻ tháng</td>
									</c:when>
									<c:otherwise>
										<td>Thẻ ngày</td>
									</c:otherwise>
								</c:choose>
								<td>${his.getCustomerModel().getId()}</td>
								<td>${his.inDate}</td>
								<td>${his.outDate}</td>
								<td>${his.price}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<a href='<c:url value="/login"></c:url>'>hello</a>
</body>
</html>