<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cdweb.util.SecurityUtils"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>
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

	<%-- table --------------------------%>
	<div class="main-card mb-3 card">
		<div class="card-body">
			<h5 class="card-title">Danh sách khách hàng</h5>
			<div class="table-responsive">
				<table id="customerTable" class="mb-0 table table-hover">
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
							<tr ondblclick="customerDetail(this)">
								<td>${i}</td>
								<td id="tdID">${cus.id}</td>
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
	<%--end table --------------------------%>
	<nav class="" aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
		<li class="page-item <c:if test="${offset==0}">disabled</c:if>"><a
			href="<c:url value='/quan-ly/khach-hang/${offset -1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
			class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
				class="sr-only">Previous</span></a></li>

		<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
			<li class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
				href="<c:url value='/quan-ly/khach-hang/${loop.index}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link">${loop.index+1}</a></li>
		</c:forEach>

		<li
			class="page-item <c:if test="${offset==pageNumber-1}">disabled</c:if>"><a
			href="<c:url value='/quan-ly/khach-hang/${offset +1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
			class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
				class="sr-only">Next</span></a></li>
	</ul>
	</nav>
	<script type="text/javascript">
		
	</script>
	<script type="text/javascript">
		function customerDetail(x) {
			var id = x.cells.namedItem("tdID").innerHTML;
			var url = window.location.origin
					+ "/parkinglotmanagement/api/khach-hang/chi-tiet/" + id;
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {

					var cusObj = JSON.parse(this.responseText);
					alert(cusObj.listRentDetail);
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
	</script>
</body>
</html>