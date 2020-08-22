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
<title>Quản lý tài khoản nhân viên</title>
</head>
<body>

	<div id="main-body">
		<div class="form-row">
			<div class="col-md-2">
				<button type="button" class="btn mr-2 mb-2 btn-success"
					data-toggle="modal" data-target="#user-creating-form">Thêm
					Tài khoản</button>
			</div>
			<div class="col-md-5"></div>
			<div class="col-md-5">
				<div class="position-relative form-group" style="float: right;">
					<form class="form-inline" name="searchUserForm">
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<label class="mr-sm-2">Tìm kiếm</label><input
								class="form-control" type="text" name="searchedString"
								id="searchedString" placeholder="CMND">
						</div>
						<button class="btn btn-primary" type="button"
							onclick="searchUser(${SystemConstant.DEFAULT_OFFSET},${SystemConstant.DEFAULT_NUM_ITEM})">Tìm
							kiếm</button>
					</form>
				</div>
			</div>
		</div>


		<%-- table --------------------------%>
		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Danh sách tài khoản nhân viên</h5>
				<div class="table-responsive">
					<table id="userTable" class="mb-0 table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>CMND</th>
								<th>Tên</th>
								<th>Giới tính</th>
								<th>Số điện thoại</th>
								<th>Địa chỉ</th>
								<th>Ngày tạo</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" scope="page" value="0" />
							<c:forEach items="${userModels}" var="user">
								<c:set var="i" value="${i + 1}" scope="page" />
								<tr onclick="userDetail(this)" data-toggle="modal"
									data-target="#user-modifying-form">
									<td>${i}</td>
									<td id="userId">${user.id}</td>
									<td>${user.name}</td>
									<c:choose>
										<c:when test="${user.gender ==1 }">
											<td>Nam</td>
										</c:when>
										<c:otherwise>
											<td>Nữ</td>
										</c:otherwise>
									</c:choose>
									<td>${user.phoneNo}</td>
									<td>${user.addr}</td>
									<td>${user.createdDate}</td>
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
				href="<c:url value='/${SecurityUtils.roleToUrl()}/tai-khoan/${offset -1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
					class="sr-only">Previous</span></a></li>

			<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
				<li
					class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
					href="<c:url value='/${SecurityUtils.roleToUrl()}/tai-khoan/${loop.index}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
					class="page-link">${loop.index+1}</a></li>
			</c:forEach>

			<li
				class="page-item <c:if test="${offset==pageNumber-1}">disabled</c:if>"><a
				href="<c:url value='/${SecurityUtils.roleToUrl()}/tai-khoan/${offset +1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
					class="sr-only">Next</span></a></li>
		</ul>
		</nav>
	</div>
	<script type="text/javascript">
		function userDetail(x) {
			var id = x.cells.namedItem("userId").innerHTML;
			var url = window.location.origin
					+ "/parkinglotmanagement/api/tai-khoan/chi-tiet/" + id;
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = JSON.parse(this.responseText);
					document.userModifyingForm.id.value = data.id;
					document.userModifyingForm.name.value = data.name;
					document.userModifyingForm.phoneNo.value = data.phoneNo;
					document.userModifyingForm.gender.value = data.gender;
					document.userModifyingForm.addr.value = data.addr;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
	</script>
	<script type="text/javascript">
		function deleteuser(x) {
			var url = window.location.origin
					+ "/parkinglotmanagement/api/khach-hang/xoa";
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = JSON.parse(this.responseText);
					window.location.reload();
					if (data.message == true) {
						alert("Xóa khách hàng thành công");
					} else {
						alert("Xóa khách hàng thất bại");
					}
				}
			}
			xhttp.open("DELETE", url, true);
			xhttp.setRequestHeader("Content-Type", "application/json");
			xhttp.send(JSON.stringify({
				id : x
			}));
		}

		function loadNewValueModalModifyConfirm() {
			document.getElementById("newName").innerHTML = "Tên: "
					+ document.userDetailForm.name.value;
			document.getElementById("newPhoneNo").innerHTML = "Số điện thoại: "
					+ document.userDetailForm.phoneNo.value;
			if (document.userDetailForm.gender.value == 1) {
				document.getElementById("newGender").innerHTML = "Giới tính: Nam"
			} else {
				document.getElementById("newGender").innerHTML = "Giới tính: Nữ"
			}

			document.getElementById("newAddr").innerHTML = "Địa chỉ: "
					+ document.userDetailForm.addr.value;
		}

		
			
		
		function searchUser(offset, numItem) {
			var searchedString = document.searchUserForm.searchedString.value;
			if(searchedString == ""){				
				window.location.reload();
				return;
			}
			var url = window.location.origin
					+ "/parkinglotmanagement/api/tai-khoan/tim-kiem/" + offset + "/" + numItem + "/" + searchedString;
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;
					if(data.indexOf("table") == -1)
						alert(data);
					else
						document.getElementById("main-body").innerHTML = data;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
		
	</script>
</body>
</html>