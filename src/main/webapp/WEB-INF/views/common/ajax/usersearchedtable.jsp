<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>

<div class="form-row">
	<div class="col-md-2">
		<button type="button" class="btn mr-2 mb-2 btn-primary"
			data-toggle="modal" data-target="#user-creating-form">Thêm
			Tài khoản</button>
	</div>
	<div class="col-md-5"></div>
	<div class="col-md-5">
		<div class="position-relative form-group" style="float: right">
			<form class="form-inline" name="searchUserForm">
				<div class="mb-2 mr-sm-2 mb-sm-0 position-relative form-group">
					<label class="mr-sm-2">Tìm kiếm</label><input class="form-control"
						type="text" name="searchedString" id="searchedString"
						placeholder="CMND" value="${searchedString}">
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
							<td id="userID">${user.id}</td>
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
			href="#"
			onclick="searchUser(${offset - 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span
				class="sr-only">Previous</span></a></li>

		<c:forEach begin="0" end="${pageNumber-1}" varStatus="loop">
			<li
				class="page-item <c:if test="${offset==loop.index}">active</c:if>"><a
				href="#"
				onclick="searchUser(${loop.index},${SystemConstant.DEFAULT_NUM_ITEM})"
				class="page-link">${loop.index+1}</a></li>
		</c:forEach>

		<li
			class="page-item <c:if test="${offset == pageNumber-1}">disabled</c:if>"><a
			href="#"
			onclick="searchUser(${offset + 1},${SystemConstant.DEFAULT_NUM_ITEM})"
			class="page-link" aria-label="Next"><span aria-hidden="true">»</span><span
				class="sr-only">Next</span></a></li>
	</ul>
</nav>