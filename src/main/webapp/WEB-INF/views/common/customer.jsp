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
	<div id="main-body">
		<div class="form-row">
			<div class="col-md-2">
				<button type="button" class="btn mr-2 mb-2 btn-success"
					data-toggle="modal" data-target=".bd-example-modal-lg">Thêm
					khách hàng</button>
			</div>
			<div class="col-md-6"></div>
			<div class="col-md-4">
				<div class="position-relative form-group">
					<form class="form-inline" name="searchRentDetailForm">
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<label class="mr-sm-2">Tìm kiếm</label><input
								class="form-control" type="text" name="searchedString"
								id="searchedString" placeholder="CMND">
						</div>
						<button class="btn btn-primary" type="button"
							id="searchRentDetailBtn"
							onclick="searchCustomer(${SystemConstant.DEFAULT_OFFSET},${SystemConstant.DEFAULT_NUM_ITEM})">Tìm
							kiếm</button>
					</form>
				</div>
			</div>
		</div>

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
								<tr onclick="customerDetail(this)" data-toggle="modal"
									data-target="#customerDetailModal">
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
				href="<c:url value='/${SecurityUtils.roleToUrl()}/khach-hang/${offset -1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
					class="sr-only">Previous</span></a></li>

			<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
				<li
					class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
					href="<c:url value='/${SecurityUtils.roleToUrl()}/khach-hang/${loop.index}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
					class="page-link">${loop.index+1}</a></li>
			</c:forEach>

			<li
				class="page-item <c:if test="${offset==pageNumber-1}">disabled</c:if>"><a
				href="<c:url value='/${SecurityUtils.roleToUrl()}/khach-hang/${offset +1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
					class="sr-only">Next</span></a></li>
		</ul>
		</nav>
	</div>
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
					var data = this.responseText;
					document.getElementById("customerDetailCard").innerHTML = data;
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
	</script>
	<script type="text/javascript">
		function deleteCustomer(x) {
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
	</script>

	<script type="text/javascript">
		function loadNewValueModalModifyConfirm() {
			document.getElementById("newName").innerHTML = "Tên: "
					+ document.customerDetailForm.name.value;
			document.getElementById("newPhoneNo").innerHTML = "Số điện thoại: "
					+ document.customerDetailForm.phoneNo.value;
			if (document.customerDetailForm.gender.value == 1) {
				document.getElementById("newGender").innerHTML = "Giới tính: Nam"
			} else {
				document.getElementById("newGender").innerHTML = "Giới tính: Nữ"
			}

			document.getElementById("newAddr").innerHTML = "Địa chỉ: "
					+ document.customerDetailForm.addr.value;
		}
	</script>
	<script type="text/javascript">
		function modifyCustomer() {
			//	var id = document.customerForm.id.value;
			var url = window.location.origin
					+ "/parkinglotmanagement/api/khach-hang/chinh-sua";
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (xhttp.readyState == 4) {
					var data = xhttp.responseText;

					if (data.indexOf("form") == -1) {
						window.location.reload();
						alert(data);
					} else {
						document.getElementById("customerDetailForm").innerHTML = data;
					}
				}
			}
			xhttp.open("POST", url, true);
			xhttp.setRequestHeader("Content-Type", "application/json");
			xhttp.send(JSON.stringify({
				id : document.customerDetailForm.id.value,
				name : document.customerDetailForm.name.value,
				addr : document.customerDetailForm.addr.value,
				gender : document.customerDetailForm.gender.value,
				phoneNo : document.customerDetailForm.phoneNo.value
			}));
		}
	</script>
	<script type="text/javascript">
	function searchCustomer(offset, numItem) {
			var searchedString = document.searchRentDetailForm.searchedString.value;
			if(searchedString == ""){				
				window.location.reload();
				return;
			}
			var url = window.location.origin
					+ "/parkinglotmanagement/api/khach-hang/tim-kiem/" + offset + "/" + numItem + "/" + searchedString;
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