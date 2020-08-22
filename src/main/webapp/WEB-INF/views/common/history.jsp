<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cdweb.util.SecurityUtils"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quản lý lịch sử</title>
</head>
<body>
	<div id="main-body">
		<div class="form-row">
			<div class="col-md-8"></div>
			<div class="col-md-4">
				<div class="position-relative form-group" style="float: right;">
					<form class="form-inline" name="searchHistoryForm">
						<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
							<label class="mr-sm-2">Tìm kiếm</label><input
								class="form-control" type="text" name="searchedString"
								placeholder="Biển số, CMND">
						</div>
						<button class="btn btn-primary" type="button"
							onclick="searchHistory(${SystemConstant.DEFAULT_OFFSET},${SystemConstant.DEFAULT_NUM_ITEM})">Tìm
							kiếm</button>
					</form>
				</div>
			</div>
		</div>
		<div class="main-card mb-3 card">
			<div class="card-body">
				<h5 class="card-title">Danh sách lịch sử</h5>

				<div class="table-responsive">
					<table class="mb-0 table table-hover">
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
								<tr onclick="historyDetail(this)" title="${his.id}"
									data-toggle="modal" data-target="#history-detail-modal">
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
		<nav class="" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item <c:if test="${offset==0}">disabled</c:if>"><a
				href="<c:url value='/${SecurityUtils.roleToUrl()}/lich-su/${offset -1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
					class="sr-only">Previous</span></a></li>

			<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
				<li
					class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
					href="<c:url value='/${SecurityUtils.roleToUrl()}/lich-su/${loop.index}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
					class="page-link">${loop.index+1}</a></li>
			</c:forEach>

			<li
				class="page-item <c:if test="${offset==pageNumber-1}">disabled</c:if>"><a
				href="<c:url value='/${SecurityUtils.roleToUrl()}/lich-su/${offset + 1}/${SystemConstant.DEFAULT_NUM_ITEM}'/>"
				class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
					class="sr-only">Next</span></a></li>
		</ul>
		</nav>
	</div>

	<script type="text/javascript">
		function historyDetail(x) {
			var id = x.title;
			var url = window.location.origin
					+ "/parkinglotmanagement/api/lich-su/chi-tiet/" + id;
			var xhttp;
			if (window.XMLHttpRequest) {
				xhttp = new XMLHttpRequest();
			} else {
				xhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4) {
					var historyModel = JSON.parse(this.responseText);
					document.historyDetailForm.id.value = historyModel.id;
					document.historyDetailForm.plateNo.value = historyModel.plateNo;
					document.historyDetailForm.customerId.value = historyModel.customerModel.id;
					document.historyDetailForm.customerName.value = historyModel.customerModel.name;
					if(historyModel.customerModel.id != null){
						document.historyDetailForm.cardType.value = "Thẻ tháng";
					}else{
						document.historyDetailForm.cardType.value = "Thẻ ngày";
					}
					document.historyDetailForm.inDate.value = new Date(historyModel.inDate).toLocaleString('en-GB', { timeZone: 'UTC' });
					document.historyDetailForm.outDate.value = new Date(historyModel.outDate).toLocaleString('en-GB', { timeZone: 'UTC' });
					document.historyDetailForm.plateInImage.src = window.location.origin + "/parkinglotmanagement/api/lich-su/hinh-anh/" + id+"/plateInImage";
					document.historyDetailForm.plateOutImage.src = window.location.origin + "/parkinglotmanagement/api/lich-su/hinh-anh/" + id+"/plateOutImage";
				}
			}
			xhttp.open("GET", url, true);
			xhttp.send();
		}
		
		function searchHistory(offset, numItem) {
			var searchedString = document.searchHistoryForm.searchedString.value;
			if(searchedString == ""){				
				window.location.reload();
				return;
			}
			var url = window.location.origin
					+ "/parkinglotmanagement/api/lich-su/tim-kiem/" + offset + "/" + numItem + "/" + document.searchHistoryForm.searchedString.value;
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