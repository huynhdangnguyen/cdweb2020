<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<input id="idCardIn" type="text" />
	<input id="plateInImage" type="hidden">
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
							var plateInImage = document.getElementById('plateInImage');
							var idCardIn = document.getElementById('idCardIn');
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

							$("#idCardIn").on(
											'keyup',
											function(e) {
												if (e.key === 'Enter'
														|| e.keyCode === 13) {

													context.drawImage(video, 0,
															0, 640, 480);
													var dataURL = canvas
															.toDataURL();
													var blobBin = atob(dataURL
															.split(',')[1]);
													var arr = [];
													for (var i = 0; i < blobBin.length; i++) {
														arr.push(blobBin
																.charCodeAt(i));
													}
													

													var xhr = new XMLHttpRequest();

													xhr.addEventListener("readystatechange", function() {
													  if(this.readyState === 4) {
													    console.log(this.responseText);
													  }
													});

													xhr.open("Post", "http://localhost:8080/parkinglotmanagement/api/kiem-soat/kiem-soat-xe-vao/" + idCardIn.value);
													xhr.setRequestHeader("Content-Type", "application/json");
													xhr.send(arr);
												}
											});
						}, false);
	</script>
</body>
</html>