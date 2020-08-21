<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cdweb.util.SecurityUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý danh sách giá</title>
</head>
<body>
	<div id="main-body">
		<div class="form-row">
			<div class="col-md-2">
				<button type="button" class="btn mr-2 mb-2 btn-success"
					data-toggle="modal" data-target=".bd-example-modal-lg">Thêm
					giá</button>

			</div>
			<div class="col-md-6"></div>
			<div class="col-md-4">
				<div class="position-relative form-group">
					<form class="form-inline" name="searchPriceDetailForm">
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<label class="mr-sm-2">Tìm kiếm</label><input
								class="form-control" type="text" name="searchedString"
								id="searchedString" placeholder="ID">
						</div>
						<button class="btn btn-primary" type="button"
							id="searchRentDetailBtn"
							onclick="searchPrice(${SystemConstant.DEFAULT_OFFSET},${SystemConstant.DEFAULT_NUM_ITEM})">Tìm
							kiếm</button>
					</form>
				</div>
			</div>
		</div>
		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Danh sách Giá</h5>
				<div class="table-responsive">
					<table class="mb-0 table table-hover">
						<thead>
							<tr>
								<th>#</th>
								<th>Mã giá</th>
								<th>Giá Ngày</th>
								<th>Giá tháng</th>
								<th>Ngày bắt đầu</th>
								<th>Ngày kết thúc</th>
							</tr>
						</thead>
						<tbody>
							<c:set var="i" scope="page" value="0" />
							<c:forEach items="${priceModels}" var="price">
								<c:set var="i" value="${i + 1}" scope="page" />
								<tr onclick="priceDetail(this)" title="${price.id}"
									data-toggle="modal" data-target="#price-detail-modal">
									<td>${i}</td>
									<td>${price.id}</td>
									<td>${price.dayPrice}</td>
									<td>${price.monthPrice}</td>
									<td>${price.startDate}</td>
									<td>${price.endDate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<nav class="" aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item <c:if test="${offset==0}">disabled</c:if>"><a
					href="<c:url value='/${SecurityUtils.roleToUrl()}/gia/${offset -1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
					class="page-link" aria-label="Previous"><span
						aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>

				<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
					<li
						class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
						href="<c:url value='/${SecurityUtils.roleToUrl()}/gia/${loop.index}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
						class="page-link">${loop.index+1}</a></li>
				</c:forEach>

				<li
					class="page-item <c:if test="${offset==pageNumber-1}">disabled</c:if>"><a
					href="<c:url value='/${SecurityUtils.roleToUrl()}/gia/${offset + 1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
					class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
						class="sr-only">Next</span></a></li>
			</ul>
		</nav>
	</div>

	<script type="text/javascript">
		function priceDetail(x) {
			var id = x.title;
			var url = window.location.origin
					+ "/parkinglotmanagement/api/gia/chi-tiet/" + id;
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4) {
					var priceModel = JSON.parse(this.responseText);
					document.priceDetailForm.id.value = priceModel.id;
					document.priceDetailForm.vehicleModel.value = priceModel.vehicleModel.name;
					document.priceDetailForm.dayPrice.value = priceModel.dayPrice;
					document.priceDetailForm.monthPrice.value = priceModel.monthPrice;
					document.priceDetailForm.startDate.value = new Date(priceModel.startDate).toLocaleString('en-GB', { timeZone: 'UTC' });
					document.priceDetailForm.endDate.value =new Date(priceModel.endDate).toLocaleString('en-GB', { timeZone: 'UTC' }) ;
					document.priceDetailForm.createdBy.value=priceModel.createdBy;
					document.priceDetailForm.createdDate.value=new Date(priceModel.createdDate).toLocaleString('en-GB', { timeZone: 'UTC' });
					document.priceDetailForm.modifiedBy.value=priceModel.modifiedBy;
					document.priceDetailForm.modifiedDate.value=new Date(priceModel.modifiedDate).toLocaleString('en-GB', { timeZone: 'UTC' });
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
		
		function searchPrice(offset, numItem) {
			var searchedString = document.searchPriceDetailForm.searchedString.value;
			if(searchedString == ""){				
				window.location.reload();
				return;
			}
			if(isNaN(searchedString)){
				alert("Chuỗi tìm kiếm phải là số");
				return;
			}
			var url = window.location.origin
					+ "/parkinglotmanagement/api/gia/tim-kiem/" + offset + "/" + numItem + "/" + searchedString;
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