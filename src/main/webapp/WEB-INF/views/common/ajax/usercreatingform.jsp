<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form modelAttribute="userModel" name="userForm" id="userForm">
	<div class="form-row">
		<div class="col-md-4">
			<div class="position-relative form-group">
				<label class="">CMND (Tên đăng nhập)</label>
				<form:input path="id" type="text" class="form-control"
					placeholder="Chứng minh nhân dân" name="id" />
				<small><form:errors path="id" /></small>
			</div>
		</div>
		<div class="col-md-8">
			<div class="position-relative form-group">
				<label class="">Họ tên</label>
				<form:input path="name" type="text" class="form-control"
					placeholder="Họ tên" name="name" />
				<small><form:errors path="name" /></small>
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="col-md-6">
			<div class="position-relative form-group">
				<label class="">Mật khẩu</label>
				<form:input path="password" type="password" class="form-control"
					placeholder="Mật khẩu" name="password" />
				<small><form:errors path="password" /></small>
			</div>
		</div>
		<div class="col-md-6">
			<div class="position-relative form-group">
				<label class="">Nhập lại mật khẩu</label>
				<form:input path="retypePassword" type="password"
					class="form-control" placeholder="Nhập lại mật khẩu"
					name="retypePassword" />
				<small><form:errors path="retypePassword" /></small>
			</div>
		</div>
	</div>
	<div class="form-row">
		<div class="col-md-6">
			<div class="position-relative form-group">
				<label class="">Số điện thoại</label>
				<form:input path="phoneNo" name="phoneNo"
					placeholder="Số điện thoại" type="text" class="form-control" />
				<small><form:errors path="phoneNo" /></small>
			</div>
		</div>
		<div class="col-md-6">
			<div class="position-relative form-group">
				<label class="">Giới tính</label>
				<div class="position-relative form-check">
					<label class="form-check-label"><form:radiobutton
							path="gender" name="gender" class="form-check-input" value="1"
							checked="true" />Nam</label>
				</div>
				<div class="position-relative form-check">
					<label class="form-check-label"><form:radiobutton
							path="gender" name="gender" class="form-check-input" value="0" />Nữ</label>
				</div>
				<small><form:errors path="gender" /></small>
			</div>
		</div>
	</div>
	<div class="position-relative form-group">
		<label class="">Địa chỉ</label>
		<form:input path="addr" name="addr" placeholder="123 Đường số 1"
			type="text" class="form-control" />
		<small><form:errors path="addr" /></small>
	</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal"
			onclick="resetData()">Đóng</button>
		<button type="button" class="btn btn-primary" onclick="createUser()">Lưu</button>
	</div>

</form:form>