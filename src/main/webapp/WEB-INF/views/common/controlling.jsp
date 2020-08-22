<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kiểm soát xe ra vào</title>
</head>
<body>
	<video id="video" width="640" height="480" autoplay></video>
	<button id="snap">Snap Photo</button>
	<canvas id="can" width="640" height="480"></canvas>
	<img id="image" width="640" height="480" />
	<a href="" id="link">alo</a>
	<script>
		// Put event listeners into place
		window
				.addEventListener(
						"DOMContentLoaded",
						function() {
							// Grab elements, create settings, etc.
							var canvas = document.getElementById('can');
							var context = canvas.getContext('2d');
							var video = document.getElementById('video');
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
													video.play();
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
														640, 480);
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
						}, false);
	</script>
</body>
</html>