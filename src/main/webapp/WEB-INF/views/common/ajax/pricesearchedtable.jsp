<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>

<form name="searchRentDetailForm">
	<input type="text" id="searchedString" value="${searchedString}" />
	<button type="button"
		onclick="searchPrice(${SystemConstant.DEFAULT_OFFSET},${SystemConstant.DEFAULT_NUM_ITEM})">tìm
		kiếm</button>
</form>
<div class="main-card mb-3 card">
	<div class="card-body">
		<h5 class="card-title">Danh sách gửi xe tháng</h5>
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
						<tr onclick="rentDetail(this)" title="${price.id}"
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
			href="#"
			onclick="searchPrice(${offset - 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
				class="sr-only">Previous</span></a></li>

		<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
			<li
				class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
				href="#"
				onclick="searchPrice(${loop.index},${SystemConstant.DEFAULT_NUM_ITEM})"
				class="page-link">${loop.index+1}</a></li>
		</c:forEach>

		<li
			class="page-item <c:if test="${offset == pageNumber-1}">disabled</c:if>"><a
			href="#"
			onclick="searchPrice(${offset + 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
				class="sr-only">Next</span></a></li>
	</ul>
</nav>