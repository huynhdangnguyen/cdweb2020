<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style=" height: 100%;">
<head>
<title>Đăng nhập</title>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title><decorator:extractProperty property="title"></decorator:extractProperty></title>
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
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header"
		style="height: 100%; background-image: url(<c:url value ='/ui-assets/images/bg.jpg' />); background-position: center; background-repeat: no-repeat; background-size: cover;">
		<div class="app-main">
			<div class="app-main__outer">
				<div class="app-main__inner">
					<div class="row">
						<div class="col-7">
							<div class="animated fadeInLeftBig">
								<div class="row">
									<div class="col-4">
										<div>
											<img src="<c:url value ='/ui-assets/images/logo.png' />"
												alt="Paris" style="width: 100%">

										</div>
									</div>
								</div>
								<div class="col-4"></div>
								<div class="col-4"></div>
								<br> <br> <br>
								<h4 style="color: white;">BÁO CÁO CUỐI KỲ - CHUYÊN ĐỀ WEB
									2020</h4>
								<h2 style="color: white;">WEBSITE QUẢN LÝ CHI NHÁNH BÃI GỬI
									XE</h2>
								<br> <br>
								<h4 style="color: white;">Thực hiện:</h4>
								<h4 style="color: white;">- 16130418 – Đỗ Duy Khang</h4>
								<h4 style="color: white;">- 16130494 – Huỳnh Đăng Nguyện</h4>
							</div>
						</div>
						<div class="col-5">
							<div class="animated fadeInRightBig">
								<div class="main-card mb-3 card">
									<div class="card-body" style="padding: 80px 50px 80px 50px;">
										<div>
											<h1 style="text-align: center;">Đăng nhập</h1>
										</div>

										<br> <br>
										<form action="j_spring_security_check" id="formLogin"
											method="post">
											<div class="position-relative form-group">
												<label class="">Chứng minh nhân dân</label> <input
													class="form-control" type="text" name="id" value=""
													placeholder="" />
											</div>
											<div class="position-relative form-group">
												<label class="">Mật khẩu</label> <input class="form-control"
													type="password" name="password" value="" placeholder="" />
											</div>
											<br> <br>
											<div class="position-relative form-group"
												style="display: flex; justify-content: center; align-items: center;">
												<button class="btn btn-primary" type="submit" name="login">Đăng
													nhập</button>
											</div>
											<c:if test="${param.incorrectAccount != null}">
												<small>Tài khoản hoặc mật khẩu không đúng</small>
											</c:if>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
