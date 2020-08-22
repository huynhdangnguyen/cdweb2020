<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
<meta charset="UTF-8">
<title>404</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Language" content="en" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, shrink-to-fit=no" />
<meta name="msapplication-tap-highlight" content="no" />
<link href="<c:url value='/ui-assets/main.css'/>" rel="stylesheet" />
<link href="<c:url value='/ui-assets/substyle.css'/>" rel="stylesheet" />
<script type="text/javascript"
	src="<c:url value='/ui-assets/scripts/main.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/ui-assets/scripts/subscript.js'/>"></script>
</head>
<body style="height: 100%;">
	<div
		style="height: 100%; background-image: url(<c:url value ='/ui-assets/images/bg.jpg' />); background-position: center; background-repeat: no-repeat; background-size: cover;">
		<div class="app-main">
			<div class="app-main__outer">
				<div class="app-main__inner">
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<div class="animated bounce" style="text-align: center">
								<img src="<c:url value ='/ui-assets/images/logo.png' />"
									alt="Paris" style="width: 100%"> <br>
								<br>
								<br>
								<h1 style="color: white">404</h1>
								<h1 style="color: white">Không tìm thấy trang</h1>
							</div>

						</div>
						<div class="col-4"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>