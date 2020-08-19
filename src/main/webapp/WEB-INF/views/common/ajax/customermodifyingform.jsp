<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<form:form modelAttribute="customerModel" name="customerDetailForm"
	id="customerDetailForm" class="">
	<div class="form-row">
		<div class="col-md-4">
			<div class="position-relative form-group">
				<label class="">CMND</label><input type="text" class="form-control"
					placeholder="Chứng minh nhân dân" name="id"
					value="${customerModel.id }" disabled /> <small><form:errors
						path="id" /></small>
			</div>
		</div>
		<div class="col-md-8">
			<div class="position-relative form-group">
				<label class="">Họ tên</label>
				<form:input path="name" type="text" class="form-control"
					placeholder="Họ tên" name="name" value="${customerModel.name }" />
				<small><form:errors path="name" /></small>
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="col-md-6">
			<div class="position-relative form-group">
				<label class="">Số điện thoại</label>
				<form:input path="phoneNo" name="phoneNo"
					placeholder="Số điện thoại" type="text" class="form-control"
					value="${customerModel.phoneNo }" />
				<small><form:errors path="phoneNo" /></small>
			</div>
		</div>
		<div class="col-md-6">
			<div class="position-relative form-group">
				<label class="">Giới tính</label>

				<div class="position-relative form-check">
					<label class="form-check-label"><form:radiobutton
							path="gender" name="gender" class="form-check-input"
							value="1" checked = "true"/>Nam</label>
				</div>
				<div class="position-relative form-check">
					<label class="form-check-label"><form:radiobutton
							path="gender" name="gender" class="form-check-input"
							value="0" />Nữ</label>
				</div>
				<small><form:errors path="gender" /></small>
			</div>
		</div>
	</div>
	<div class="position-relative form-group">
		<label class="">Địa chỉ</label>
		<form:input path="addr" name="addr" placeholder="123 Đường số 1"
			type="text" class="form-control" value="${customerModel.addr }" />
		<small><form:errors path="addr" /></small>
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

</form:form>