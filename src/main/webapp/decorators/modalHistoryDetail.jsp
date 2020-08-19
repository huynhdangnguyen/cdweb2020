<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="history-detail-modal" class="modal fade bd-example-modal-lg"
	id="history-detail-modal" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">Chi tiết
					lịch sử</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="card-body">
					<form name="historyDetailForm" class="">
						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label class="">Mã lịch sử</label><input type="text"
										class="form-control" placeholder="Mã lịch sử" name="id" />
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label class="">Biển số xe</label><input type="text"
										class="form-control" placeholder="Họ tên" name="plateNo" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-4">
								<div class="position-relative form-group">
									<label class="">Mã khách hàng</label><input name="customerId"
										placeholder="Mã khách hàng" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-8">
								<div class="position-relative form-group">
									<label class="">Tên khách hàng</label><input type="text"
										class="form-control" placeholder="Tên khách hàng"
										name="customerName" />
								</div>
							</div>
							<div class="col-md-12">
								<div class="position-relative form-group">
									<label class="">Loại thẻ</label><input type="text"
										class="form-control" placeholder="Tên khách hàng"
										name="cardType" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label class="">Thời gian vào</label><input name="inDate"
										placeholder="Thời gian vào" type="text" class="form-control">
								</div>
							</div>
							<div class="col-md-6">
								<div class="position-relative form-group">
									<label class="">Thời gian ra</label><input type="text"
										class="form-control" placeholder="Thời gian ra"
										name="outDate" />
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<img style="width: 100%; height: 100%" alt="Hình biển số xe vào" src="" name="plateInImage">
							</div>
							<div class="col-md-6">
								<img style="width: 100%; height: 100%" alt="Hình biển số xe ra" src="" name="plateOutImage">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Đóng</button>
				</div>

				</form>
			</div>

		</div>

	</div>
</div>
</div>