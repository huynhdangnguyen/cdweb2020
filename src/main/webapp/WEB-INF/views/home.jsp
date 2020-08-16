<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
	<div>
		<h1>Trang chủ</h1>
		<h1>Menu</h1>
		<a href="<c:url value="/login"></c:url>"> login page</a>
		<h1>${hello}</h1>
		<button id="cus-details" class="cus-detail">Chi tiết nhân
			viên</button>


		<ul>
			<li data-toggle="modal" data-target="#myModal"
				data-content="Content of Text1">Text1</li>
			<li data-toggle="modal" data-target="#myModal"
				data-content="Content of Text2">Text2</li>
			<li data-toggle="modal" data-target="#myModal"
				data-content="Content of Text3">Text3</li>
		</ul>

	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>