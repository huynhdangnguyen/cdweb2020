<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="rent-detail-modal" class="modal fade bd-example-modal-lg"
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
					<form name="rentDetailForm" id="rentDetailForm" class="">
						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label>Mã thẻ</label><input type="text" class="form-control"
										placeholder="Mã thẻ" name="id" disabled />
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label>Biển số</label><input type="text" class="form-control"
										placeholder="Biển số" name="plateNo" />
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
									<label>Loại xe</label><input name="vehicleName"
										placeholder="Mã khách hàng" type="text" class="form-control"
										disabled>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Số khung</label><input name="frameNumber"
										placeholder="Số khung" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Số máy</label><input name="machineNumber"
										placeholder="số máy" type="text" class="form-control">
								</div>
							</div>
						</div>

						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Mã khách hàng</label><input name="customerId"
										placeholder="Mã khách hàng" type="text" class="form-control"
										disabled>
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label>Tên khách hàng</label><input name="customerName"
										placeholder="Tên khách hàng" type="text" class="form-control"
										disabled>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Đóng</button>
							<button type="button" class="btn btn-primary" onclick="modifyRentDetail()">Lưu</button>
						</div>

					</form>
				</div>

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
				if (data.result === "true"){
					alert("Chỉnh sửa thành công");
				window.location.reload();
				}
				else
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
</script>
