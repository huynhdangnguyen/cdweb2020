<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>
<div class="form-row">
	<div class="col-md-8"></div>
	<div class="col-md-4">
		<div class="position-relative form-group" style="float: right;">
			<form class="form-inline" name="searchRentDetailForm">
				<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
					<label class="mr-sm-2">Tìm kiếm</label><input id="searchedString"
						class="form-control" type="text" name="searchedString"
						placeholder="Biển số, CMND" value="${searchedString}">
				</div>
				<button id="searchRentDetailBtn" class="btn btn-primary"
					type="button"
					onclick="searchRentDetail(${SystemConstant.DEFAULT_OFFSET},${SystemConstant.DEFAULT_NUM_ITEM})">Tìm
					kiếm</button>
			</form>
		</div>
	</div>
</div>
<div class="main-card mb-3 card">
	<div class="card-body">
		<h5 class="card-title">Danh sách gửi xe tháng</h5>
		<div class="table-responsive">
			<table class="mb-0 table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>Biển số</th>
						<th>Số khung</th>
						<th>Số máy</th>
						<th>Ngày hết hạn</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="i" scope="page" value="0" />
					<c:forEach items="${rentDetailModels}" var="rent">
						<c:set var="i" value="${i + 1}" scope="page" />
						<tr onclick="rentDetail(this)" title="${rent.id}"
							data-toggle="modal" data-target="#rent-detail-modal">
							<td>${i}</td>
							<td>${rent.plateNo}</td>
							<td>${rent.frameNumber}</td>
							<td>${rent.machineNumber}</td>
							<td>${rent.endDate}</td>
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
			href="#"
			onclick="searchRentDetail(${offset - 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
				class="sr-only">Previous</span></a></li>

		<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
			<li
				class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
				href="#"
				onclick="searchRentDetail(${loop.index},${SystemConstant.DEFAULT_NUM_ITEM})"
				class="page-link">${loop.index+1}</a></li>
		</c:forEach>

		<li
			class="page-item <c:if test="${offset == pageNumber-1}">disabled</c:if>"><a
			href="#"
			onclick="searchRentDetail(${offset + 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
				class="sr-only">Next</span></a></li>
	</ul>
</nav>