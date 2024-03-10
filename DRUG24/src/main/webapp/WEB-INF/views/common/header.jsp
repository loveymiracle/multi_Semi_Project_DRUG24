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
    <link rel="stylesheet" media="screen" href="${path}/resources/vendor/simplebar/dist/simplebar.min.css" />
  	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/tiny-slider/dist/tiny-slider.css" />
  	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/drift-zoom/dist/drift-basic.min.css" />
  	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/lightgallery.js/dist/css/lightgallery-bundle.min.css" />
    <!-- Main Theme Styles + Bootstrap-->
  	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/nouislider/dist/nouislider.min.css"/>
  	<link rel="stylesheet" media="screen" href="${path}/resources/vendor/drift-zoom/dist/drift-basic.min.css"/>
  	<link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="${path}/resources/css/theme.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
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
					</ul>
					<button class="btn-close" type="button" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body tab-content py-4">
				
				<!--  로그인 -->
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
						<button class="btn btn-primary btn-shadow d-block w-100 mb-4"
							type="submit">Sign in</button>
					</form>
					<button class="btn btn-primary btn-shadow d-block w-100"
						 onclick="location.href='${path}/member/enroll';">Sign up</button>
						
				</div>
			</div>
		</div>
	</div>
	<main class="page-wrapper">
		<!-- 헤더 시작 -->
		<header class="bg-dark shadow-sm navbar-sticky container-fluid">
			<div class="navbar navbar-expand-lg navbar-dark">
				<div class="container">
					<a
						class="navbar-brand d-none d-sm-block flex-shrink-0 order-lg-1 m-0 p-0"
						href="${path}"> <img src="${path}/resources/imgs/LogoE_r.png"
						width="55" alt="">
					</a>
					<div class="collapse navbar-collapse me-auto order-lg-2 ms-3"
						id="navbarCollapse">
						<!-- Primary menu-->
						<ul class="navbar-nav">
							<li class="nav-item"><a
								class="nav-link blodFont h4 text-white " href="${path}">Home</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Medicine
									Info</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="${path}/medicine/search">약 상세검색</a></li>
									<li><a class="dropdown-item" href="${path}/drug/safetyletter">안전성 서한</a></li>
									<li><a class="dropdown-item" href="${path}/drug/instruction">안전 사용</a></li>
								</ul>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" 
								href="${path}/pharmacy/search">Pharmacy</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white"
								href="${path}/shop/main">Shop</a></li>
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle h4 text-white" href="#"
								data-bs-toggle="dropdown" data-bs-auto-close="outside">Community</a>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="${path}/board/list">Community Board</a></li>
									<li><a class="dropdown-item" href="${path}/board/list?types=QUESTION">질문과 답변</a></li>
									<li><a class="dropdown-item" href="${path}/board/list?types=NBOARD">공지사항</a></li>
									<li><a class="dropdown-item" href="${path}/board/list?types=NEWS">Newsroom</a></li>
								</ul>
							</li>
						</ul>
						<div class="navbar-tool">
							<a class="navbar-tool-icon-box bg-secondary"
								href="${path}/shop/cart"><span class="navbar-tool-label">${cartSize}</span><i
								class="navbar-tool-icon ci-cart"></i></a><a class="navbar-tool-text"
								href="shop-cart.html"></a>
							<!-- Cart dropdown-->
							<div class="dropdown-menu dropdown-menu-end">
								<div class="widget widget-cart px-3 pt-2 pb-3"
									style="width: 20rem;">
									<div style="height: 15rem;" data-simplebar
										data-simplebar-auto-hide="false">

										<c:forEach var="item" items="${cartList }">
											<div class="widget-cart-item pb-2 border-bottom">
												<button class="btn-close text-danger" type="button"
													aria-label="Remove"
													onclick="cartDelete('${item.pno}', '/');">
													<span aria-hidden="true">&times;</span>
												</button>
												<div class="d-flex align-items-center">
													<a class="d-block flex-shrink-0" href="shop-single-v2.html"><img
														src="${item.image }" width="64" alt="Product"></a>
													<div class="ps-2">
														<h6 class="widget-product-title">
															<a href="${path}/shop/product?pno=${item.pno}">${item.title }</a>
														</h6>
														<div class="widget-product-meta">
															<span class="text-accent me-2"><fmt:formatNumber
																	value="${item.lprice }" pattern="#,###" />원 </span><span
																class="text-muted">x ${item.amount }</span>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>

										<script type="text/javascript">
											function cartDelete(pno, url) {
												location.href = '${path}/shop/deleteCart?pno='
														+ pno + '&url=' + url;
											}
										</script>
									</div>
								</div>
							</div>
							<!-- Toolbar-->
							<div
								class="navbar-toolbar d-flex flex-shrink-0 align-items-center">
								<button class="navbar-toggler" type="button"
									data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
									<span class="navbar-toggler-icon"> </span>
								</button>
								<a class="navbar-tool navbar-stuck-toggler" href="#"><span
									class="navbar-tool-tooltip">Toggle menu</span>
									<div class="navbar-tool-icon-box">
										<i class="navbar-tool-icon ci-menu"></i>
									</div> </a>

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
										<div class="navbar-tool dropdown">
							              <div class="navbar-tool dropdown"><a class="" href="#"></a><a class="navbar-tool-text ms-n1" href="#">${loginMember.name}님</a>
							                <div class="dropdown-menu dropdown-menu-end">
							                  <div style="min-width: 14rem;">
							                    <h6 class="dropdown-header">계정 정보</h6><a class="dropdown-item d-flex align-items-center" href="${path}/member/view"><i class="ci-settings opacity-60 me-2"></i>마이 페이지</a>
							                    <div class="dropdown-divider"></div>
							                    <a class="dropdown-item d-flex align-items-center" href="${path}/logout"><i class="ci-sign-out opacity-60 me-2"></i>Sign Out</a>
							                  </div>
							                </div>
							              </div>				
										</div>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>