<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
								<video id="video1" width="250" height="187" autoplay></video>
								<canvas id="can1" width="250" height="187"></canvas>
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

						<div class="form-row" style="padding: 5px">
							<div class="col-md-4">
								<img id="image1" width="166" height="124" />
							</div>
							<div class="col-md-4">
								<img id="image" width="166" height="124" />
							</div>
							<div class="col-md-4" style="padding: 15px">
								<label class="mr-sm-2">Thời gian vào</label><input
									class="form-control" type="text" name="time1" id="time1"
									placeholder="Thời gian">
								<label class="mr-sm-2">Thời gian ra</label><input
									class="form-control" type="text" name="time2" id="time2"
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
											id="plateNo2" placeholder="Biển số">
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

						<div class="form-row" style="padding: 5px">
							<div class="col-md-4">
								<img id="image2" width="166" height="124" />
							</div>
							<div class="col-md-4">
								<img id="image" width="166" height="124" />
							</div>
							<div class="col-md-4" style="padding: 15px">
								<label class="mr-sm-2">Thời gian ra</label><input
									class="form-control" type="text" name="time3" id="time3"
									placeholder="Thời gian">
								<label class="mr-sm-2">Thời gian vào</label><input
									class="form-control" type="text" name="time4" id="time4"
									placeholder="Thời gian">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		// Put event listeners into place
		window.addEventListener("DOMContentLoaded", function() {
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
			if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
				navigator.mediaDevices.getUserMedia(mediaConfig).then(
						function(stream) {
							//video.src = window.URL.createObjectURL(stream);
							video1.srcObject = stream;
							video2.srcObject = stream;
							video1.play();
							video2.play();
						});
			}

			/* Legacy code below! */
			else if (navigator.getUserMedia) { // Standard
				navigator.getUserMedia(mediaConfig, function(stream) {
					video1.src = stream;
					video1.play();
				}, errBack);
			} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
				navigator.webkitGetUserMedia(mediaConfig, function(stream) {
					video1.src = window.webkitURL.createObjectURL(stream);
					video1.play();
				}, errBack);
			} else if (navigator.mozGetUserMedia) { // Mozilla-prefixed
				navigator.mozGetUserMedia(mediaConfig, function(stream) {
					video1.src = window.URL.createObjectURL(stream);
					video1.play();
				}, errBack);
			}

			$("#cardID1").on(
					'keyup',
					function(e) {
						if (e.key === 'Enter' || e.keyCode === 13) {

							context1.drawImage(video1, 0, 0, 250, 187);
							var dataURL = canvas1.toDataURL();
							var blobBin = atob(dataURL.split(',')[1]);
							var arr = [];
							for (var i = 0; i < blobBin.length; i++) {
								arr.push(blobBin.charCodeAt(i));
							}

							var xhr = new XMLHttpRequest();

							xhr.addEventListener("readystatechange",
									function() {
										if (this.readyState === 4) {
											image1.src = window.location.origin +"/parkinglotmanagement/api/kiem-soat/";
											var rentDetailModel = JSON.parse(this.responseText);
											clearInforCustomerIn();
											document.getElementById('cusName1').value = rentDetailModel.customerModel.name;
											cusID1.value = rentDetailModel.customerModel.id;
											if(cusID1.value != null)
											cardType1.value = "Thẻ tháng";
											else
											cardType1.value = "Thẻ ngày";
											plateNo1.value = rentDetailModel.plateNo;
											if(rentDetailModel.endDate > new Date().getTime())
												status1.value = "Còn thời hạn";
											else
												status1.value = "Hết thời hạn";
											time1.value = new Date().toLocaleString('en-GB', { timeZone: 'UTC' })
										}
									});

							xhr.open("Post",
									window.location.origin +"/parkinglotmanagement/api/kiem-soat/kiem-soat-xe-vao/"+ cardID1.value);
							xhr.setRequestHeader("Content-Type",
									"application/json");
							xhr.send(new Blob([new Uint8Array(arr)], {type: 'image/png'}));
						}
					});
			
			$("#cardID2").on(
					'keyup',
					function(e) {
						if (e.key === 'Enter' || e.keyCode === 13) {

							context2.drawImage(video2, 0, 0, 250, 187);
							var dataURL = canvas2.toDataURL();
							var blobBin = atob(dataURL.split(',')[1]);
							var arr = [];
							for (var i = 0; i < blobBin.length; i++) {
								arr.push(blobBin.charCodeAt(i));
							}

							var xhr = new XMLHttpRequest();

							xhr.addEventListener("readystatechange",
									function() {
										if (this.readyState === 4) {
											//image2.src = window.location.origin +"/parkinglotmanagement/api/kiem-soat/";
											var rentDetailModel = JSON.parse(this.responseText);
											clearInforCustomerOut();
											document.getElementById('cusName2').value = rentDetailModel.customerModel.name;
											cusID2.value = rentDetailModel.customerModel.id;
											if(cusID2.value != null)
											cardType2.value = "Thẻ tháng";
											else
											cardType2.value = "Thẻ ngày";
											plateNo2.value = rentDetailModel.plateNo;
											if(rentDetailModel.endDate > new Date().getTime())
												status2.value = "Còn thời hạn";
											else
												status2.value = "Hết thời hạn";
											time2.value = new Date().toLocaleString('en-GB', { timeZone: 'UTC' })
										}
									});

							xhr.open("Post",
									window.location.origin +"/parkinglotmanagement/api/kiem-soat/kiem-soat-xe-ra/"+ cardID2.value);
							xhr.setRequestHeader("Content-Type",
									"application/json");
							xhr.send(new Blob([new Uint8Array(arr)], {type: 'image/png'}));
						}
					});
					function clearInforCustomerIn(){
						image1.value = null;
						cardID1.value = null;
						cusName1.value = null;
						cusID1.value = null;
						plateNo1.value = null;
						cardType1.value = null;
						status1.value = null;
						time1.value = null;
					}
					function clearInforCustomerOut(){
						image1.src = null;
						cardID1.value = null;
						cusName1.value = null;
						cusID1.value = null;
						plateNo1.value = null;
						cardType1.value = null;
						status1.value = null;
						time1.value = null;
					}

		}, false);
	</script>
</body>
</html>