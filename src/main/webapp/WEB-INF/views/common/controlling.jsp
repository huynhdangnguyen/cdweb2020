<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kiểm soát xe ra vào</title>
</head>
<body>
	<div id="main-body">
		<div class="row">
			<div class="col-6">
				<div class="card">
					<div style="padding-top: 10px">
						<h5 class="card-title" style="text-align: center">Xe vào</h5>
						<div class="main-container">
							<div class="fixer-container" style="">
								<video id="video" width="250" height="187" autoplay></video>
								<canvas id="can" width="250" height="187"></canvas>
							</div>
						</div>
					</div>
					<div style="padding: 0px 10px 5px 10px">
						<form name="inForm">
							<div class="form-row ">
								<div class="col-md-6">
									<div class="">
										<label class="mr-sm-2">Mã thẻ</label><input
											class="form-control" type="text" name="cardID" id="cardID"
											placeholder="Mã thẻ">
									</div>
								</div>

								<div class="col-md-6" style="float: right">
									<div class="">
										<label class="mr-sm-2">Tên KH</label><input
											class="form-control" type="text" name="cusName" id="cusName"
											placeholder="Tên KH">
									</div>
								</div>
							</div>
							<div class="form-row ">
								<div class="col-md-6">
									<div class="">
										<label class="mr-sm-2">CMND</label><input class="form-control"
											type="text" name="cusID" id="cusID" placeholder="CMND">
									</div>
								</div>
								<div class="col-md-6" style="float: right">
									<div class="">
										<label class="mr-sm-2">Loại thẻ</label><input
											class="form-control" type="text" name="cardType"
											id="cardType" placeholder="Loại thẻ">
									</div>
								</div>
							</div>
							<div class="form-row form-group">
								<div class="col-md-6">
									<div class="">
										<label class="mr-sm-2">Biển số</label><input
											class="form-control" type="text" name="plateNo" id="plateNo"
											placeholder="Trạng thái">
									</div>
								</div>
								<div class="col-md-6">
									<div class="">
										<label class="mr-sm-2">Trạng thái</label><input
											class="form-control" type="text" name="status" id="status"
											placeholder="Trạng thái">
									</div>
								</div>
							</div>
							<div class="">
								<button class="btn btn-primary"
									style="display: block; width: 100%" type="button" id="snap">Vào</button>
							</div>
						</form>

						<div class="form-row" style="padding: 5px">
							<div class="col-md-4">
								<img id="image" width="166" height="124" />
							</div>
							<div class="col-md-4">
								<img id="image" width="166" height="124" />
							</div>
							<div class="col-md-4" style="padding: 15px">
								<label class="mr-sm-2">Thời gian</label><input
									class="form-control" type="text" name="time" id="time"
									placeholder="Thời gian">
							</div>
						</div>



					</div>
				</div>
			</div>

			<!----------------------------------------------------------------------------------------------------------------------------------------->
			<div class="col-6">
				<div class="card">
					<div style="padding-top: 10px">
						<h5 class="card-title" style="text-align: center">Xe ra</h5>
						<div class="main-container">
							<div class="fixer-container" style="">
								<video id="video2" width="250" height="187" autoplay></video>
								<canvas id="can2" width="250" height="187"></canvas>
							</div>
						</div>
					</div>
					<div style="padding: 0px 10px 5px 10px">
						<form name="outForm">
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
											class="form-control" type="text" name="cusName2"
											id="cusName2" placeholder="Tên KH">
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
											class="form-control" type="text" name="plateNo2"
											id="plateNo2" placeholder="Trạng thái">
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
							<div class="">
								<button class="btn btn-primary"
									style="display: block; width: 100%" type="button" id="snap2">Ra</button>
							</div>
						</form>

						<div class="form-row" style="padding: 5px">
							<div class="col-md-4">
								<img id="image" width="166" height="124" />
							</div>
							<div class="col-md-4">
								<img id="image" width="166" height="124" />
							</div>
							<div class="col-md-4" style="padding: 15px">
								<label class="mr-sm-2">Thời gian</label><input
									class="form-control" type="text" name="time2" id="time2"
									placeholder="Thời gian">
							</div>
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
							// Grab elements, create settings, etc.
							var canvas = document.getElementById('can');
							var canvas2 = document.getElementById('can2');
							var context = canvas.getContext('2d');
							var context2 = canvas2.getContext('2d');
							var video = document.getElementById('video');
							var video2 = document.getElementById('video2');
							var image = document.getElementById('image');
							var link = document.getElementById('link');
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
													//video.src = window.URL.createObjectURL(stream);
													video.srcObject = stream;
													video2.srcObject = stream;
													video.play();
													video2.play();
												});
							}

							/* Legacy code below! */
							else if (navigator.getUserMedia) { // Standard
								navigator.getUserMedia(mediaConfig, function(
										stream) {
									video.src = stream;
									video.play();
								}, errBack);
							} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
								navigator.webkitGetUserMedia(mediaConfig,
										function(stream) {
											video.src = window.webkitURL
													.createObjectURL(stream);
											video.play();
										}, errBack);
							} else if (navigator.mozGetUserMedia) { // Mozilla-prefixed
								navigator.mozGetUserMedia(mediaConfig,
										function(stream) {
											video.src = window.URL
													.createObjectURL(stream);
											video.play();
										}, errBack);
							}

							// Trigger photo take
							document
									.getElementById('snap')
									.addEventListener(
											'click',
											function() {
												context.drawImage(video, 0, 0,
														250, 187);
												var dataURL = canvas
														.toDataURL();
												var blobBin = atob(dataURL
														.split(',')[1]);
												var array = [];
												for (var i = 0; i < blobBin.length; i++) {
													array.push(blobBin
															.charCodeAt(i));
												}

												var file = new Blob(
														[ new Uint8Array(array) ],
														{
															type : 'image/png'
														});

												var url = window.location.origin
														+ "/parkinglotmanagement/api/kiem-soat/kiem-soat-xe-vao";
												var xhttp;
												if (window.XMLHttpRequest) {
													xhttp = new XMLHttpRequest();
												} else {
													xhttp = new ActiveXObject(
															"Microsoft.XMLHTTP");
												}
												xhttp.onreadystatechange = function() {
													if (xhttp.readyState == 4) {
														image.src = window.location.origin
																+ "/parkinglotmanagement/api/kiem-soat/hinh-anh";
													}
												}
												xhttp.open("GET", url, true);
												xhttp.setRequestHeader(
														"Content-Type",
														"application/json");
												const obj = {
													plateInImage : array,
													rentDetailModel : {
														id : 123
													}
												}
												xhttp.send(JSON.stringify({
													plateInImage : array,
													rentDetailModel : {
														id : 123
													}
												}));
											});
							document.getElementById('snap2').addEventListener(
									'click',
									function() {
										context2.drawImage(video, 0, 0, 250,
												187);
									})
						}, false);
	</script>
</body>
</html>