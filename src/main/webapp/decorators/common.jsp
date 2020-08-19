<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
<body>
	<%@ include file="/decorators/modalAddCustomer.jsp"%>
	<%@ include file="/decorators/modalCustomerDetail.jsp"%>

	<div
		class="app-container app-theme-white body-tabs-shadow fixed-sidebar fixed-header">
		<%@ include file="/decorators/header.jsp"%>
		<div class="app-main">
			<%@ include file="/decorators/sidebar.jsp"%>
			<div class="app-main__outer">
				<div class="app-main__inner">
					<decorator:body />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
