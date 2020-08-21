<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="price-detail-modal" class="modal fade bd-example-modal-lg"
	tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
	aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Chi tiết thẻ</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card-body">
					<form name="priceDetailForm" id="priceDetailForm" class="">
						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label>Mã giá</label><input type="text" class="form-control"
										placeholder="" name="id" disabled />
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label>Loại xe</label><input type="text" class="form-control"
										placeholder="" name="vehicleModel" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Ngày hết hạn</label><input name="endDate"
										placeholder="Ngày hết hạn" type="text" class="form-control"
										disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Ngày bắt đầu</label><input name="startDate"
										placeholder="Ngày bắt đầu" type="text" class="form-control"
										disabled>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Giá ngày</label><input name="dayPrice"
										placeholder="Giá ngày" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Giá tháng</label><input name="monthPrice"
										placeholder="Giá tháng" type="text" class="form-control">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label class="">Tạo bởi</label><input name="createdBy"
										type="text" class="form-control" disabled />
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label class="">Ngày tạo</label><input name="createdDate"
										type="text" class="form-control" disabled />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label class="">Sửa bởi</label><input name="modifiedBy"
										type="text" class="form-control" disabled />
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label class="">Ngày sửa</label><input name="modifiedDate"
										type="text" class="form-control" disabled />
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-toggle="modal"
								data-target="#deleteConfrim">Xóa</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="button" class="btn btn-primary"
								onclick="modifyRentDetail()">Lưu</button>
						</div>

					</form>
				</div>

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
				<h5>Chắc chắn xóa giá:</h5>
				<p class="mb-0" id="modalDeletePlate"></p>
				<p class="mb-0" id="modalDeleteCustomer"></p>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
				<button type="button" class="btn btn-danger"
					onclick="deleteRentDetail()">Xác nhận</button>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function modifyRentDetail() {
		var url = window.location.origin
				+ "/parkinglotmanagement/api/chi-tiet-thue/chinh-sua";
		var xhttp;
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {
				var data = JSON.parse(xhttp.responseText);
				if (data.result === "true") {
					alert("Chỉnh sửa thành công");
					window.location.reload();
				} else
					alert("Chỉnh sửa thất bại");
			}
		}
		xhttp.open("PUT", url, true);
		xhttp.setRequestHeader("Content-Type", "application/json");
		xhttp.send(JSON.stringify({
			id : document.rentDetailForm.id.value,
			plateNo : document.rentDetailForm.plateNo.value,
			frameNumber : document.rentDetailForm.frameNumber.value,
			machineNumber : document.rentDetailForm.machineNumber.value
		}));
	}
	function deleteRentDetail() {
		var url = window.location.origin
				+ "/parkinglotmanagement/api/chi-tiet-thue/xoa";
		var xhttp;
		if (window.XMLHttpRequest) {
			xhttp = new XMLHttpRequest();
		} else {
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		xhttp.onreadystatechange = function() {
			if (xhttp.readyState == 4) {
				var data = JSON.parse(xhttp.responseText);
				if (data.message == true) {
					alert("Xóa chi tiết thuê thành công");
					window.location.reload();
				} else
					alert("Xóa chi tiết thuê thất bại");
			}
		}
		xhttp.open("DELETE", url, true);
		xhttp.setRequestHeader("Content-Type", "application/json");
		xhttp.send(JSON.stringify({
			id : document.rentDetailForm.id.value,
			plateNo : document.rentDetailForm.plateNo.value,
			frameNumber : document.rentDetailForm.frameNumber.value,
			machineNumber : document.rentDetailForm.machineNumber.value
		}));
	}
</script>
