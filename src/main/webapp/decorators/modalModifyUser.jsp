<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="user-modifying-form" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Chi tiết tài
					khoản</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form name="userModifyingForm" id="userModifyingForm">
						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label class="">CMND (Tên đăng nhập)</label><input type="text"
										class="form-control" placeholder="Chứng minh nhân dân"
										name="id" />
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label class="">Họ tên</label><input type="text"
										class="form-control" placeholder="Họ tên" name="name" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label class="">Mật khẩu</label><input type="password"
										class="form-control" placeholder="Mật khẩu" name="password" />
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label class="">Nhập lại mật khẩu</label><input type="password"
										class="form-control" placeholder="Nhập lại mật khẩu"
										name="retypePassword" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label class="">Số điện thoại</label><input name="phoneNo"
										placeholder="Số điện thoại" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label class="">Giới tính</label>

									<div class="position-relative form-check">
										<label class="form-check-label"><input name="gender"
											type="radio" class="form-check-input" value="1"
											checked="true">Nam</label>
									</div>
									<div class="position-relative form-check">
										<label class="form-check-label"><input name="gender"
											type="radio" class="form-check-input" value="0">Nữ</label>
									</div>

								</div>
							</div>
						</div>
						<div class="position-relative form-group">
							<label class="">Địa chỉ</label><input name="addr"
								placeholder="123 Đường số 1" type="text" class="form-control">
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" onclick="resetData()">Đóng</button>
							<button type="button" class="btn btn-primary"
								onclick="modifyUser()">Lưu</button>
						</div>

					</form>
				</div>

			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	function modifyUser() {
		if (document.userForm.password.value != document.userForm.retypePassword.value) {
			alert("Mật khẩu phải trùng khớp");
			return;
		}
		var url = window.location.origin
				+ "/parkinglotmanagement/api/tai-khoan/chinh-sua";
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
					alert(data);
					window.location.reload();
				} else {
					document.getElementById("userModifyingForm").innerHTML = data;
				}
			}
		}

		xhttp.open("POST", url, true);
		xhttp.setRequestHeader("Content-Type", "application/json");
		xhttp.send(JSON.stringify({
			id : document.userModifyingForm.id.value,
			name : document.userModifyingForm.name.value,
			password : document.userModifyingForm.password.value,
			retypePassword : document.userModifyingForm.retypePassword.value,
			addr : document.userModifyingForm.addr.value,
			gender : document.userModifyingForm.gender.value,
			phoneNo : document.userModifyingForm.phoneNo.value
		}));
	}
</script>