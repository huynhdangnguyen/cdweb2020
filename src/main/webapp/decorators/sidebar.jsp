<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cdweb.constant.SystemConstant"%>
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

					<c:choose>
						<c:when
							test="${SecurityUtils.getAuthorities().contains('MANAGER')}">
							<li><a
								href="<c:url value="/quan-ly/kiem-soat"></c:url>"
								class="mm-active"> <i
									class="metismenu-icon fa fa-motorcycle"></i> Kiểm soát xe ra
									vào
							</a></li>
							<li><a
								href="<c:url value="/quan-ly/khach-hang/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${customerModels!=null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-user-circle-o"></i> Quản lý
									khách hàng
							</a></li>
							<li><a
								href="<c:url value="/quan-ly/tai-khoan/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${userModels != null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-user"></i> Quản lý tài khoản
							</a></li>
							<li><a
								href="<c:url value="/quan-ly/chi-tiet-thue/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${rentDetailModels!=null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-database"></i> Quản lý gửi xe
									tháng
							</a></li>
							<li><a
								href="<c:url value="/quan-ly/lich-su/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${historyModels!=null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-history"></i> Quản lý lịch sử
							</a></li>
							<li><a
								href="<c:url value="/quan-ly/gia/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${priceModels != null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-money" aria-hidden="true"></i>
									Quản lý giá
							</a></li>

						</c:when>
						<c:otherwise>
							<li><a
								href="<c:url value="/nhan-vien/khach-hang/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"/>"
								<c:if test = "${customerModels!=null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-user-circle-o"></i> Quản lý
									khách hàng
							</a></li>
							<li><a
								href="<c:url value="/nhan-vien/chi-tiet-thue/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${rentDetailModels!=null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-database"></i> Quản lý gửi xe
									tháng
							</a></li>
							<li><a
								href="<c:url value="/nhan-vien/lich-su/${SystemConstant.DEFAULT_OFFSET}/${SystemConstant.DEFAULT_NUM_ITEM}"></c:url>"
								<c:if test = "${historyModels!=null}">class="mm-active"</c:if>>
									<i class="metismenu-icon fa fa-history"></i> Quản lý lịch sử
							</a></li>

						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</div>
</body>
</html>