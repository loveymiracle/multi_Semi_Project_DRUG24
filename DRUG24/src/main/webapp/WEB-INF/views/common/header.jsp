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
    <link rel="stylesheet" media="screen" href="${path}/vendor/simplebar/dist/simplebar.min.css"/>
    <link rel="stylesheet" media="screen" href="${path}/vendor/tiny-slider/dist/tiny-slider.css"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="${path}/css/theme.min.css">
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
						href="${path}"> <img src="${path}/resources/imgs/LogoE_r.png"
						width="55" alt="DRUG24"></a>
					<!-- Toolbar-->
					<div class="navbar-toolbar d-flex align-items-center order-lg-3">
						<a class="navbar-tool d-none d-lg-flex"
							href="dashboard-favorites.html"><span
							class="navbar-tool-tooltip">나의 구급함</span>
							<div class="navbar-tool-icon-box">
								<i class="navbar-tool-icon ci-basket-alt"></i>
							</div></a> <a class="navbar-tool d-none d-lg-flex"
							href="dashboard-favorites.html"><span
							class="navbar-tool-tooltip">즐겨찾기</span>
							<div class="navbar-tool-icon-box">
								<i class="navbar-tool-icon ci-heart"></i>
							</div></a>

						<c:if test="${loginMember == null}">
							<a class="navbar-tool ms-1 ms-lg-0 me-n1 me-lg-2"
								href="#signin-modal" data-bs-toggle="modal">
								<div class="navbar-tool-icon-box">
									<i class="navbar-tool-icon ci-user"></i>
								</div>
								<div class="navbar-tool-text ms-n3">
									<small>Hello, Sign in</small>My Account
								</div>
							</a>
						</c:if>

						<c:if test="${loginMember != null}">
							<div class="navbar-tool ms-1 ms-lg-0 me-n1 me-lg-2"
								data-bs-toggle="modal">
								<div class="navbar-tool-icon-box">
									<i class="navbar-tool-icon ci-user"></i>
								</div>
								<div class="navbar-tool-text ms-n3">
									${loginMember.name}님
									<div>
										<a href="${path}/logout">logout</a>
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<div class="collapse navbar-collapse me-auto order-lg-2 ms-3"
						id="navbarCollapse">
						<!-- Primary menu-->
						<ul class="navbar-nav">
							<li class="nav-item"><a
								class="nav-link blodFont h4 text-white " href="${path}">Home</a></li>
							<li class="nav-item dropdown h4 text-white"><a
								class="nav-link dropdown-toggle" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">의약품
									정보</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">약 상세검색</a></li>
									<li><a class="dropdown-item" href="#">복약 정보</a></li>
									<li><a class="dropdown-item" href="#">안전성 서한</a></li>
									<li class="dropdown-item" href="#">안전 사용</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">약국 찾기</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">의약품
									쇼핑몰</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">증상별 추천 아이템</a></li>
									<li><a class="dropdown-item" href="#">테마별 추천 아이템</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Community</a>
								<ul class="dropdown-menu">
									<li class="dropdown"><a
										class="dropdown-item dropdown-toggle h4 text-white" href="#"
										data-bs-toggle="dropdown">후기</a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="404-simple.html">의약품
													후기</a></li>
											<li><a class="dropdown-item"
												href="404-illustration.html">약국 후기</a></li>
										</ul></li>
									<li><a class="dropdown-item" href="#">질문과 답변</a></li>
									<li><a class="dropdown-item" href="#">공지사항</a></li>
								</ul></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle blodFont h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Newsroom</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="#">뉴스 게시판</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</div>
		</header>