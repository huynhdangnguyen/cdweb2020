<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>
<div class="form-row">
	<div class="col-md-2">
		<button type="button" class="btn mr-2 mb-2 btn-success"
			data-toggle="modal" data-target=".bd-example-modal-lg">Thêm
			khách hàng</button>
	</div>
	<div class="col-md-5"></div>
	<div class="col-md-5">
		<div class="position-relative form-group" style="float: right;">
			<form class="form-inline" name="searchRentDetailForm">
				<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
					<label class="mr-sm-2">Tìm kiếm</label><input class="form-control"
						type="text" name="searchedString" id="searchedString"
						placeholder="CMND" value="${searchedString}">
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
			href="#"
			onclick="searchCustomer(${offset - 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
				class="sr-only">Previous</span></a></li>

		<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
			<li
				class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
				href="#"
				onclick="searchCustomer(${loop.index},${SystemConstant.DEFAULT_NUM_ITEM})"
				class="page-link">${loop.index+1}</a></li>
		</c:forEach>

		<li
			class="page-item <c:if test="${offset==pageNumber-1}">disabled</c:if>"><a
			href="#"
			onclick="searchCustomer(${offset + 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
				class="sr-only">Next</span></a></li>
	</ul>
</nav>
