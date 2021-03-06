<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kiểm soát xe ra vào</title>
	
</head>
<body >

	<div id="main-body">
		<div class="row">
			<div class="col-6">
				<div class="card" style="border: 1px solid grey;">
					<div style="padding-top: 10px">
						<h5 class="card-title" style="text-align: center">Xe vào</h5>
						<div style="border: 1px; margin: 0px 10px 0px 10px; display: flex; justify-content: center; align-items: center; height: 187px;">
								<div style="border: 1px solid black; width: 50%">
									<video id="video1" autoplay="" width="100%" height="187px"></video>
								</div>
								<div style="border: 1px solid black; width:50%">
									<canvas id="can1" height="187px" width="auto"></canvas>
								</div>
							</div>
					</div>

					<div style="padding: 0px 10px 5px 10px">
						<div class="form-row ">
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">Mã thẻ</label><input
										class="form-control" type="text" name="cardID1" id="cardID1"
										placeholder="Mã thẻ">
								</div>
							</div>

							<div class="col-md-6" style="float: right">
								<div class="">
									<label class="mr-sm-2">Tên KH</label><input
										class="form-control" type="text" name="cusName1" id="cusName1"
										placeholder="Tên KH">
								</div>
							</div>
						</div>
						<div class="form-row ">
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">CMND</label><input class="form-control"
										type="text" name="cusID1" id="cusID1" placeholder="CMND">
								</div>
							</div>
							<div class="col-md-6" style="float: right">
								<div class="">
									<label class="mr-sm-2">Loại thẻ</label><input
										class="form-control" type="text" name="cardType1"
										id="cardType1" placeholder="Loại thẻ">
								</div>
							</div>
						</div>
						<div class="form-row form-group">
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">Biển số</label><input
										class="form-control" type="text" name="plateNo1" id="plateNo1"
										placeholder="Biển số">
								</div>
							</div>
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">Trạng thái</label><input
										class="form-control" type="text" name="status1" id="status1"
										placeholder="Trạng thái">
								</div>
							</div>
						</div>

						<div class="form-row form-group">
							<div class="col-md-6">
								<label class="mr-sm-2">Thời gian vào</label><input
									class="form-control" type="text" name="time1" id="time1"
									placeholder="Thời gian">
							</div>
							<div class="col-md-6">
								<label class="mr-sm-2">Lịch sử</label><input
									class="form-control" type="text" name="time2" id="time2"
									placeholder="Lịch sử">
							</div>
						</div>

						<div class="form-row form-group">
							<div class="col-md-4">
								<img id="image1" width="166" height="124" />
							</div>
						</div>

					</div>
				</div>
			</div>

			<!----------------------------------------------------------------------------------------------------------------------------------------->
			<div class="col-6">
				<div class="card" style="border: 1px solid grey;">
					<div style="padding-top: 10px">
						<h5 class="card-title" style="text-align: center">Xe ra</h5>
						<div style="border: 1px; margin: 0px 10px 0px 10px; display: flex; justify-content: center; align-items: center; height: 187px;">
								<div style="border: 1px solid grey; width: 50%">
									<video id="video2" autoplay="" height="187" width="100%"></video>
								</div>
								<div style="border: 1px solid grey; width:50%">
									<canvas id="can2" style=" width:100%; height:187px"></canvas>
								</div>
							</div>
					</div>
					<div style="padding: 0px 10px 5px 10px">

						<div class="form-row ">
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">Mã thẻ</label><input
										class="form-control" type="text" name="cardID2" id="cardID2"
										placeholder="Mã thẻ">
								</div>
							</div>

							<div class="col-md-6" style="float: right">
								<div class="">
									<label class="mr-sm-2">Tên KH</label><input
										class="form-control" type="text" name="cusName2" id="cusName2"
										placeholder="Tên KH">
								</div>
							</div>
						</div>
						<div class="form-row ">
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">CMND</label><input class="form-control"
										type="text" name="cusID2" id="cusID2" placeholder="CMND">
								</div>
							</div>
							<div class="col-md-6" style="float: right">
								<div class="">
									<label class="mr-sm-2">Loại thẻ</label><input
										class="form-control" type="text" name="cardType2"
										id="cardType2" placeholder="Loại thẻ">
								</div>
							</div>
						</div>
						<div class="form-row form-group">
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">Biển số</label><input
										class="form-control" type="text" name="plateNo2" id="plateNo2"
										placeholder="Biển số">
								</div>
							</div>
							<div class="col-md-6">
								<div class="">
									<label class="mr-sm-2">Trạng thái</label><input
										class="form-control" type="text" name="status2" id="status2"
										placeholder="Trạng thái">
								</div>
							</div>
						</div>

						<div class="form-row form-group">
							<div class="col-md-6">
								<label class="mr-sm-2">Thời gian ra</label><input
									class="form-control" type="text" name="time3" id="time3"
									placeholder="Thời gian">
							</div>
							<div class="col-md-6">
								<label class="mr-sm-2">Lịch sử</label><input
									class="form-control" type="text" name="time4" id="time4"
									placeholder="Lịch sử">
							</div>
						</div>

						<div class="form-row form-group">
							<div class="col-md-4">
								<img id="image2" width="166" height="124" />
							</div>
							<div class="col-md-8">
								<label class="mr-sm-2">Giá tiền</label><input
									class="form-control" type="text" name="price" id="price"
									placeholder="Giá tiền" style="color: red;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		// Put event listeners into place
		window
				.addEventListener(
						"DOMContentLoaded",
						function() {
							var canvas1 = document.getElementById('can1');
							var canvas2 = document.getElementById('can2');
							var video1 = document.getElementById('video1');
							var video2 = document.getElementById('video2');
							var context1 = canvas1.getContext('2d');
							var context2 = canvas2.getContext('2d');
							var image1 = document.getElementById('image1');
							var image2 = document.getElementById('image2');

							var mediaConfig = {
								video : true
							};
							var errBack = function(e) {
								console.log('An error has occurred!', e)
							};

							// Put video listeners into place
							if (navigator.mediaDevices
									&& navigator.mediaDevices.getUserMedia) {
								navigator.mediaDevices
										.getUserMedia(mediaConfig).then(
												function(stream) {
													video1.srcObject = stream;
													video2.srcObject = stream;
													video1.play();
													video2.play();
												});
							}

							/* Legacy code below! */
//							else if (navigator.getUserMedia) { // Standard
//								navigator.getUserMedia(mediaConfig, function(
//										stream) {
//									video1.src = stream;
//									video1.play();
//								}, errBack);
//							} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
//								navigator.webkitGetUserMedia(mediaConfig,
//										function(stream) {
//											video1.src = window.webkitURL
//													.createObjectURL(stream);
//											video1.play();
//										}, errBack);
//							} else if (navigator.mozGetUserMedia) { // Mozilla-prefixed
//								navigator.mozGetUserMedia(mediaConfig,
//										function(stream) {
//											video1.src = window.URL
//													.createObjectURL(stream);
//											video1.play();
//										}, errBack);
//							}

							$("#cardID1")
									.on(
											'keyup',
											function(e) {
												if (e.key === 'Enter'
														|| e.keyCode === 13) {

													context1.drawImage(video1,
															0, 0, video1.clientWidth, video1.clientHeight);
													var dataURL = canvas1
															.toDataURL();
													var blobBin = atob(dataURL
															.split(',')[1]);
													var arr = [];
													for (var i = 0; i < blobBin.length; i++) {
														arr.push(blobBin
																.charCodeAt(i));
													}

													var xhr = new XMLHttpRequest();

													xhr
															.addEventListener(
																	"readystatechange",
																	function() {
																		if (this.readyState === 4) {
																			var historyModel = JSON
																					.parse(this.responseText);
																			var rentDetailModel = historyModel.rentDetailModel;
																			clearInforCustomerIn();
																			if (rentDetailModel.customerModel != null) {

																				cusName1.value = rentDetailModel.customerModel.name;
																				cusID1.value = rentDetailModel.customerModel.id;
																				time2.value = new Date(
																						historyModel.outDate)
																						.toLocaleString(
																								'en-GB',
																								{
																									timeZone : 'UTC'
																								});
																				image1.src = window.location.origin
																						+ "/parkinglotmanagement/api/kiem-soat/hinh-anh/plateOutImage";
																			}
																			if (cusID1.value != null)
																				cardType1.value = "Thẻ tháng";
																			else
																				cardType1.value = "Thẻ ngày";
																			plateNo1.value = rentDetailModel.plateNo;
																			if (rentDetailModel.endDate > new Date()
																					.getTime())
																				status1.value = "Còn thời hạn";
																			else
																				status1.value = "Hết thời hạn";
																			time1.value = new Date()
																					.toLocaleString(
																							'en-GB',
																							{
																								timeZone : 'UTC'
																							});
																		}
																	});

													xhr
															.open(
																	"Post",
																	window.location.origin
																			+ "/parkinglotmanagement/api/kiem-soat/kiem-soat-xe-vao/"
																			+ cardID1.value);
													xhr.setRequestHeader(
															"Content-Type",
															"application/json");
													xhr
															.send(new Blob(
																	[ new Uint8Array(
																			arr) ],
																	{
																		type : 'image/png'
																	}));
												}
											});

							$("#cardID2")
									.on(
											'keyup',
											function(e) {
												if (e.key === 'Enter'
														|| e.keyCode === 13) {
													context2.drawImage(video2,
															0, 0, document.getElementById('video2').clientWidth, document.getElementById('video2').clientHeight);
													var dataURL = canvas2
															.toDataURL();
													var blobBin = atob(dataURL
															.split(',')[1]);
													var arr = [];
													for (var i = 0; i < blobBin.length; i++) {
														arr.push(blobBin
																.charCodeAt(i));
													}

													var xhr = new XMLHttpRequest();

													xhr
															.addEventListener(
																	"readystatechange",
																	function() {
																		if (this.readyState === 4) {
																			clearInforCustomerOut();
																			var historyModel = JSON
																					.parse(this.responseText);
																			var rentDetailModel = historyModel.rentDetailModel;
																			if (historyModel.customerModel != null) {

																				cusName2.value = historyModel.customerModel.name;
																				cusID2.value = historyModel.customerModel.id;
																				if (cusID2.value != null)
																					cardType2.value = "Thẻ tháng";
																				else
																					cardType2.value = "Thẻ ngày";
																			}
																			plateNo2.value = rentDetailModel.plateNo;
																			if (rentDetailModel.endDate > new Date()
																					.getTime())
																				status2.value = "Còn thời hạn";
																			else
																				status2.value = "Hết thời hạn";
																			time3.value = new Date()
																					.toLocaleString(
																							'en-GB',
																							{
																								timeZone : 'UTC'
																							})
																			time4.value = new Date(
																					historyModel.inDate)
																					.toLocaleString(
																							'en-GB',
																							{
																								timeZone : 'UTC'
																							});
																			image2.src = window.location.origin
																					+ "/parkinglotmanagement/api/kiem-soat/hinh-anh/plateInImage";
																			price.value = historyModel.price + " VNĐ";

																		}
																	});

													xhr
															.open(
																	"Post",
																	window.location.origin
																			+ "/parkinglotmanagement/api/kiem-soat/kiem-soat-xe-ra/"
																			+ cardID2.value);
													xhr.setRequestHeader(
															"Content-Type",
															"application/json");
													xhr
															.send(new Blob(
																	[ new Uint8Array(
																			arr) ],
																	{
																		type : 'image/png'
																	}));
												}
											});
							function clearInforCustomerIn() {
								image1.src = "";
								cusID1.value = null;
								cusName1.value = null;
								plateNo1.value = null;
								cardType1.value = null;
								status1.value = null;
								time1.value = null;
								time2.value = null;
							}
							function clearInforCustomerOut() {
								image2.src = "";
								cusID2.value = null;
								cusName2.value = null;
								cusID2.value = null;
								plateNo2.value = null;
								cardType2.value = null;
								status2.value = null;
								time4.value = null;
								time3.value = null;
								price.value = null;
							}
						}, false);
	</script>
</body>
</html>