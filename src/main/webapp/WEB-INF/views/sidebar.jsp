<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div class="app-sidebar sidebar-shadow">
		<div class="app-header__logo">
			<div class="logo-src"></div>
			<div class="header__pane ml-auto">
				<div>
					<button type="button"
						class="hamburger close-sidebar-btn hamburger--elastic"
						data-class="closed-sidebar">
						<span class="hamburger-box"> <span class="hamburger-inner"></span>
						</span>
					</button>
				</div>
			</div>
		</div>
		<div class="app-header__mobile-menu">
			<div>
				<button type="button"
					class="hamburger hamburger--elastic mobile-toggle-nav">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
		<div class="app-header__menu">
			<span>
				<button type="button"
					class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
					<span class="btn-icon-wrapper"> <i
						class="fa fa-ellipsis-v fa-w-6"></i>
					</span>
				</button>
			</span>
		</div>
		<div class="scrollbar-sidebar">
			<div class="app-sidebar__inner">
				<ul class="vertical-nav-menu">
					<li class="app-sidebar__heading">Dashboards</li>

					<li><a href="<c:url value="/trang-chu"></c:url>"
						<c:if test = "${page == 'home'}">class="mm-active"</c:if>> <i
							class="metismenu-icon fa fa-user-circle-o"></i> Quản lý khách hàng
					</a></li>

					<li><a href="<c:url value="/login"></c:url>"
						<c:if test = "${page == 'login'}">class="mm-active"</c:if>> <i
							class="metismenu-icon fa fa-database"></i> Quản lý gửi xe tháng
					</a></li>
					<li><a href="#"> <i class="metismenu-icon fa fa-history"></i>
							Xem lịch sử xe ra vào
					</a></li>

				</ul>
			</div>
		</div>
	</div>
</body>
</html>