<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <title>DRUG24</title>
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Vendor Styles including: Font Icons, Plugins, etc.-->
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
  </head>
  <!-- Body-->
  <body>
	<!-- Sign in / sign up modal-->
	<div class="modal fade" id="signin-modal" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-secondary">
					<ul class="nav nav-tabs card-header-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link fw-medium active"
							href="#signin-tab" data-bs-toggle="tab" role="tab"
							aria-selected="true"><i class="ci-unlocked me-2 mt-n1"></i>Sign
								in</a></li>
						<li class="nav-item"><a class="nav-link fw-medium"
							href="#signup-tab" data-bs-toggle="tab" role="tab"
							aria-selected="false"><i class="ci-user me-2 mt-n1"></i>Sign
								up</a></li>
					</ul>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body tab-content py-4">
					<form action="${path}/login" method="post"
						class="needs-validation tab-pane fade show active"
						autocomplete="off" novalidate id="signin-tab">
						<div class="mb-3">
							<label class="form-label" for="si-email">Account</label> <input
								class="form-control" type="text" name="memberId" id="si-email"
								placeholder="user id" required>
							<div class="invalid-feedback">Please provide a valid
								account.</div>
						</div>
						<div class="mb-3">
							<label class="form-label" for="si-password">Password</label>
							<div class="password-toggle">
								<input class="form-control" name="memberPwd" type="password"
									id="si-password" required> <label
									class="password-toggle-btn" aria-label="Show/hide password">
									<input class="password-toggle-check" type="checkbox"><span
									class="password-toggle-indicator"></span>
								</label>
							</div>
						</div>
						<div class="mb-3 d-flex flex-wrap justify-content-between">
							<div class="form-check mb-2">
								<input class="form-check-input" type="checkbox" id="si-remember">
								<label class="form-check-label" for="si-remember">Remember
									me</label>
							</div>
							<a class="fs-sm" href="#">Forgot password?</a>
						</div>
						<button class="btn btn-primary btn-shadow d-block w-100"
							type="submit">Sign in</button>
					</form>
					<form action="${path}/member/enroll" method="post"
						class="needs-validation tab-pane fade" autocomplete="off"
						novalidate id="signup-tab">
						<div class="mb-3">
							<label class="form-label" for="Account">Account</label> <input
								class="form-control" type="text" name="id" id="Account"
								placeholder="user id" required>
							<div class="invalid-feedback">Please fill in your name.</div>
						</div>
						<div class="mb-3">
							<label class="form-label" for="su-name">Full name</label> <input
								class="form-control" type="text" name="name" id="su-name"
								placeholder="full name" required>
							<div class="invalid-feedback">Please fill in your name.</div>
						</div>
						<div class="mb-3">
							<label for="su-email">Email address</label> <input
								class="form-control" type="email" name="email" id="su-email"
								placeholder="johndoe@example.com" required>
							<div class="invalid-feedback">Please provide a valid email
								address.</div>
						</div>
						<div class="mb-3">
							<label class="form-label" for="su-password">Password</label>
							<div class="password-toggle">
								<input class="form-control" type="password" name="password"
									id="su-password" required> <label
									class="password-toggle-btn" aria-label="Show/hide password">
									<input class="password-toggle-check" type="checkbox"><span
									class="password-toggle-indicator"></span>
								</label>
							</div>
						</div>
						<div class="mb-3">
							<label class="form-label" for="su-password-confirm">Confirm
								password</label>
							<div class="password-toggle">
								<input class="form-control" type="password"
									id="su-password-confirm" required> <label
									class="password-toggle-btn" aria-label="Show/hide password">
									<input class="password-toggle-check" type="checkbox"><span
									class="password-toggle-indicator"></span>
								</label>
							</div>
						</div>
						<button class="btn btn-primary btn-shadow d-block w-100"
							type="submit">Sign up</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<main class="page-wrapper">
		<!-- 헤더 시작 -->
		<header class="bg-dark shadow-sm navbar-sticky container-fluid">
			<div class="navbar navbar-expand-lg navbar-dark">
				<div class="container-fluid">
					<a
						class="navbar-brand d-none d-sm-block flex-shrink-0 order-lg-1 m-0 p-0"
						href="main.html"> <img src="imgs/LogoE_r.png" width="55"
						alt=""></a>
					<!-- Toolbar-->
					<div class="navbar-toolbar d-flex align-items-center order-lg-3">
						<div class="navbar-tool d-none d-lg-flex"
							href="dashboard-favorites.html">
							<span class="navbar-tool-tooltip">나의 구급함</span><span
								class="navbar-tool-icon-box"><i
								class="navbar-tool-icon ci-basket-alt"></i></span>
						</div>
						<div class="navbar-tool d-none d-lg-flex">
							<a class="navbar-tool-icon-box bg-secondary dropdown-toggle"
								href="marketplace-cart.html"><span class="navbar-tool-label">3</span><i
								class="navbar-tool-icon ci-cart"></i></a>
						</div>
						<div class="navbar-tool dropdown ms-2">
							<a class="" href="dashboard-sales.html"></a><a
								class="navbar-tool-text ms-n1" href="dashboard-sales.html"><small>nickname</small>일반
								회원</a>
							<div class="dropdown-menu dropdown-menu-end">
								<div style="min-width: 14rem;">
									<h6 class="dropdown-header">계정 정보</h6>
									<a class="dropdown-item d-flex align-items-center"
										href="dashboard-settings.html"><i
										class="ci-settings opacity-60 me-2"></i>마이 페이지</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item d-flex align-items-center"
										href="account-signin.html"><i
										class="ci-sign-out opacity-60 me-2"></i>Sign Out</a>
								</div>
							</div>
						</div>
					</div>
					<div class="collapse navbar-collapse me-auto order-lg-2 ms-3"
						id="navbarCollapse">
						<!-- Primary menu-->
						<ul class="navbar-nav">
							<li class="nav-item"><a
								class="nav-link blodFont h4 text-white " href="Main.html">Home</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Medicine
									Info</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">약 상세검색</a></li>
									<li><a class="dropdown-item" href="#">복약 정보</a></li>
									<li><a class="dropdown-item" href="#">안전성 서한</a></li>
									<li class="dropdown-item" href="#">안전 사용</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Pharmacy</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Shop</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Community</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">질문과 답변</a></li>
									<li><a class="dropdown-item" href="#">공지사항</a></li>
									<li><a class="dropdown-item" href="#">Newsroom</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</header>