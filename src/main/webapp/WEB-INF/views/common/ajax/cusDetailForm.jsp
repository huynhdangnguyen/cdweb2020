<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Quản lý khách hàng</title>
</head>
<body>
	<div class="modal fade" id="modifyConfrim" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xác nhận sửa
						đổi</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5>Thông tin sửa đổi:</h5>
					<p class="mb-0" id="newName"></p>
					<p class="mb-0" id="newPhoneNo"></p>
					<p class="mb-0" id="newGender"></p>
					<p class="mb-0" id="newAddr"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-primary" onclick="modifyCustomer()">Xác
						nhận</button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="deleteConfrim" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Xác nhận xóa</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<h5>Chắc chắn xóa:</h5>
					<p class="mb-0">Khách hàng: ${customerModel.name }</p>
					<p class="mb-0">CMND: ${customerModel.id }</p>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
					<button type="button" class="btn btn-danger"
						onclick="deleteCustomer(${customerModel.id})">Xác nhận</button>
				</div>
			</div>
		</div>
	</div>
	<form name="customerDetailForm" id="customerDetailForm" class="">
		<div class="form-row">
			<div class="col-md-4">
				<div class="position-relative form-group">
					<label class="">CMND</label><input type="text" class="form-control"
						placeholder="Chứng minh nhân dân" name="id"
						value="${customerModel.id }" disabled />
				</div>
			</div>
			<div class="col-md-8">
				<div class="position-relative form-group">
					<label class="">Họ tên</label><input type="text"
						class="form-control" placeholder="Họ tên" name="name"
						value="${customerModel.name }" />
				</div>
			</div>
		</div>
		<div class="form-row">
			<div class="col-md-6">
				<div class="position-relative form-group">
					<label class="">Số điện thoại</label><input name="phoneNo"
						placeholder="Số điện thoại" type="text" class="form-control"
						value="${customerModel.phoneNo }">
				</div>
			</div>
			<div class="col-md-6">
				<div class="position-relative form-group">
					<label class="">Giới tính</label>

					<div class="position-relative form-check">
						<label class="form-check-label"><input name="gender"
							type="radio" class="form-check-input" value="1"
							<c:if test="${customerModel.gender==1}"> checked = "true"</c:if>>Nam</label>
					</div>
					<div class="position-relative form-check">
						<label class="form-check-label"><input name="gender"
							type="radio" class="form-check-input" value="0"
							<c:if test="${customerModel.gender==0}"> checked = "true"</c:if>>Nữ</label>
					</div>

				</div>
			</div>
		</div>
		<div class="position-relative form-group">
			<label class="">Địa chỉ</label><input name="addr"
				placeholder="123 Đường số 1" type="text" class="form-control"
				value="${customerModel.addr }">
		</div>
		<div class="form-row">
			<div class="col-md-4">
				<div class="position-relative form-group">
					<label class="">Tạo bởi</label><input type="text"
						class="form-control" value="${customerModel.createdBy}" disabled />
				</div>
			</div>
			<div class="col-md-8">
				<div class="position-relative form-group">
					<label class="">Ngày tạo</label><input type="text"
						class="form-control" value="${customerModel.createdDate}" disabled />
				</div>
			</div>
		</div>

		<div class="form-row">
			<div class="col-md-4">
				<div class="position-relative form-group">
					<label class="">Sửa bởi</label><input type="text"
						class="form-control" value="${customerModel.modifiedBy }" disabled />
				</div>
			</div>
			<div class="col-md-8">
				<div class="position-relative form-group">
					<label class="">Ngày sửa</label><input type="text"
						class="form-control" value="${customerModel.modifiedDate }"
						disabled />
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#modifyConfrim"
				onclick="loadNewValueModalModifyConfirm()">Lưu</button>
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#deleteConfrim">Xóa</button>
		</div>

	</form>
	<div class="main-card mb-3 card">
		<div class="card-body">
			<h5 class="card-title">Danh sách xe gửi</h5>
			<div class="table-responsive">
				<table id="customerDetailTable" class="mb-0 table table-hover">
					<thead>
						<tr>
							<th>#</th>
							<th>Biển số xe</th>
							<th>Số khung</th>
							<th>Số máy</th>
							<th>Ngày hết hạn</th>
							<th>Tạo bởi</th>
							<th>Ngày tạo</th>
							<th>Sửa bởi</th>
							<th>Ngày sửa</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="j" scope="page" value="0" />
						<c:forEach items="${listRentDetail}" var="rentDt">
							<c:set var="j" value="${j + 1}" scope="page" />
							<tr>
								<td>${j}</td>
								<td>${rentDt.plateNo}</td>
								<td>${rentDt.frameNumber}</td>
								<td>${rentDt.machineNumber}</td>
								<td>${rentDt.endDate}</td>
								<td>${rentDt.createdBy}</td>
								<td>${rentDt.createdDate}</td>
								<td>${rentDt.modifiedBy}</td>
								<td>${rentDt.modifiedDate}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>