<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Thêm khách
						hàng</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<div class="card-body">
						<form name="customerForm" id="customerForm" class="">
							<div class="form-row">
								<div class="col-md-4">
									<div class="position-relative form-group">
										<label class="">CMND</label><input type="text"
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
									data-dismiss="modal">Đóng</button>
								<button type="button" class="btn btn-primary"
									onclick="createCustomer()">Lưu</button>
							</div>

						</form>
					</div>

				</div>

			</div>
		</div>
	</div>
	<script type="text/javascript">
		function createCustomer() {
			//	var id = document.customerForm.id.value;
			var url = window.location.origin
					+ "/parkinglotmanagement/api/khach-hang/them";
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
						if (data.indexOf("thành công") != -1) {
							document.customerForm.id.value = "";
							document.customerForm.name.value = "";
							document.customerForm.addr.value = "";
							document.customerForm.gender.value = "";
							document.customerForm.phoneNo.value = "";
						}
						alert(data);
					} else {
						document.getElementById("customerForm").innerHTML = data;
					}
				}
			}
			xhttp.open("POST", url, true);
			xhttp.setRequestHeader("Content-Type", "application/json");
			xhttp.send(JSON.stringify({
				id : document.customerForm.id.value,
				name : document.customerForm.name.value,
				addr : document.customerForm.addr.value,
				gender : document.customerForm.gender.value,
				phoneNo : document.customerForm.phoneNo.value
			}));
		}
	</script>
</body>
</html>