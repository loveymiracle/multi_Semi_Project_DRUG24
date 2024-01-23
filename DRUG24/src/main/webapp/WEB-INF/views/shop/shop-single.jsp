<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

		<!-- Page Title-->
		<div class="page-title-overlap bg-accent pt-4">
			<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
				<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
					<nav aria-label="breadcrumb">
						<ol
							class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
							<li class="breadcrumb-item"><a class="text-nowrap"
								href="${path}"><i class="ci-home"></i>Home</a></li>
							<li class="breadcrumb-item text-nowrap"><a
								href="${path}/shop/main">Market</a></li>
							<li class="breadcrumb-item text-nowrap active" aria-current="page">제품페이지</li>
						</ol>
					</nav>
				</div>
				<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
					<h1 class="h3 text-light mb-0">${product.title}</h1>
				</div>
			</div>
		</div>
		<!-- Shadow box-->
		<section class="container mb-3 pb-3">
			<div class="bg-light shadow-lg rounded-3 overflow-hidden">
				<div class="row">
					<!-- Content-->
					<section class="col-lg-8 pt-2 pt-lg-4 pb-4 mb-lg-3">
						<div class="pt-3 px-4 pe-lg-0 ps-xl-5">
							<!-- Product gallery-->
							<div class="gallery">
								<img src="${product.image}" alt="product">
							</div>
							<!-- Wishlist + Sharing-->
							<div
								class="d-flex flex-wrap justify-content-between align-items-center border-top pt-3">
								<div class="py-2">
									<i class="ci-share-alt fs-lg align-middle text-muted me-2"></i><a
										class="btn-social bs-outline bs-facebook bs-sm ms-2"
										href="https://www.facebook.com/"><i class="ci-facebook"></i></a><a
										class="btn-social bs-outline bs-twitter bs-sm ms-2"
										href="https://twitter.com/?lang=ko"><i class="ci-twitter"></i></a><a
										class="btn-social bs-outline bs-pinterest bs-sm ms-2"
										href="https://www.pinterest.co.kr/"><i class="ci-pinterest"></i></a><a
										class="btn-social bs-outline bs-instagram bs-sm ms-2"
										href="https://www.instagram.com/"><i class="ci-instagram"></i></a>
								</div>
								<h6 class="fs-sm mb-2"><a href="${product.link}">제품 상세 검색하기</a></h6>
							</div>
						</div>
					</section>
					<!-- Sidebar-->
					<aside class="col-lg-4 ps-xl-2">
						<hr class="d-lg-none">
						<div class="bg-white h-100 p-4 ms-auto border-start">
						<h3 class="border-bottom mb-3 mt-1">DRUG 24 쇼핑몰</h3>
							<div class="px-lg-2">
							
								<!--  -->
								
								<div class="mb-3 text-center">
									<span class="h3 fw-normal text-accent me-1"> <fmt:formatNumber
											value="${product.lprice}" pattern="#,###" />원</span>
								</div>
								<form class="mb-grid-gutter" action="${path}/shop/addCart" method="post">
								<input type="hidden" name="pno" value="${product.pno}">
								<div class="mb-3 d-flex align-items-center">
									<button class="btn btn-primary btn-shadow d-block w-100"
											type="submit">
												<i class="ci-cart fs-lg me-2"></i>장바구니 추가
									</button>
								</div>
								</form>
								
								<!--  -->
								<hr><br>
								<!--  -->
								<div>
									<h4>
										<i class="ci-announcement text-muted fs-lg align-middle mt-n1 me-3"></i>Product
											info
									</h4>
									<h2 class="fs-sm mb-2">${product.brand}</h2>
									<ul class="fs-sm ps-4">
										<li>메이커 : ${product.maker}</li>
										<li>판매점 : ${product.mallName}</li>
										<li>카테고리1 : ${product.category1}</li>
										<li>카테고리2 : ${product.category2}</li>
										<li>카테고리3 : ${product.category3}</li>
										<li>카테고리4 : ${product.category4}</li>
									</ul>
									<h4>
										<i class="ci-delivery text-muted lead align-middle mt-n1 me-2"></i>Shipping
											options
									</h4>
									<h2 class="fs-sm mb-2">택배 배송</h2>
									<ul class="fs-sm ps-4">
										<li>무료 배송 | CJ 대한통운 (오네)</li>
									</ul>
									<h4>
										<i class="ci-idea text-muted lead align-middle mt-n1 me-2"></i>shopping
											info
									</h4>
									<h2 class="fs-sm mb-2">구매 안내</h2>
									<ul class="fs-sm ps-4">
										<li>카카오 페이 결제만 가능</li>
										<li>최대구매 5개(1인)</li>
									</ul>
								</div>
								<form class="mb-grid-gutter" action="${path}/shop/pay" method="post" id="purchaseForm">
								<input type="hidden" name="pno" value="${product.pno}">
								<div class="mb-3 d-flex align-items-center">
									<select class="form-select me-3" style="width: 5rem;" id="quantitySelect" onchange="updateTotal()">
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
									</select>
									<button class="btn btn-primary btn-shadow d-block w-100"
											type="submit">
												<i class="ci-card fs-lg me-2"></i>구매 하기
									</button>
								</div>
								<div class="mb-3 text-center">
									<span class="mb-6 mt-6">총 구매 개수 : <span id="totalQuantity">개</span></span><br><br>
									<span class="mb-5 mt-5">총 상품 금액 : </span>
									<span id="totalPriceSpan" class="h3 fw-normal text-accent me-1 mt-5 ms-3"> <fmt:formatNumber
											value="${product.lprice}" pattern="#,###" />원</span>
										﻿
								</div>
								</form>
								<input type="hidden" id="totalPrice" value="${product.lprice}">
							</div>
						</div>
					</aside>
				</div>
			</div>
		</section>
		
		<!-- Reviews-->
		<section>
			<div class="border-top border-bottom my-lg-3 py-5">
				<div class="container pt-md-2" id="reviews">
					<div class="row pb-3">
						<div class="col-lg-4 col-md-5">
							<h2 class="h3 mb-4">74 Reviews</h2>
							<div class="star-rating me-2">
								<i class="ci-star-filled fs-sm text-accent me-1"></i><i
									class="ci-star-filled fs-sm text-accent me-1"></i><i
									class="ci-star-filled fs-sm text-accent me-1"></i><i
									class="ci-star-filled fs-sm text-accent me-1"></i><i
									class="ci-star fs-sm text-muted me-1"></i>
							</div>
							<span class="d-inline-block align-middle">4.1 Overall rating</span>
							<p class="pt-3 fs-sm text-muted">
								58 out of 74 (77%)<br>Customers recommended this product
							</p>
						</div>
						<div class="col-lg-8 col-md-7">
							<div class="d-flex align-items-center mb-2">
								<div class="text-nowrap me-3">
									<span class="d-inline-block align-middle text-muted">5</span><i
										class="ci-star-filled fs-xs ms-1"></i>
								</div>
								<div class="w-100">
									<div class="progress" style="height: 4px;">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: 60%;" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100">
										</div>
									</div>
								</div>
								<span class="text-muted ms-3">43</span>
							</div>
							<div class="d-flex align-items-center mb-2">
								<div class="text-nowrap me-3">
									<span class="d-inline-block align-middle text-muted">4</span><i
										class="ci-star-filled fs-xs ms-1"></i>
								</div>
								<div class="w-100">
									<div class="progress" style="height: 4px;">
										<div class="progress-bar" role="progressbar"
											style="width: 27%; background-color: #a7e453;"
											aria-valuenow="27" aria-valuemin="0" aria-valuemax="100">
										</div>
									</div>
								</div>
								<span class="text-muted ms-3">16</span>
							</div>
							<div class="d-flex align-items-center mb-2">
								<div class="text-nowrap me-3">
									<span class="d-inline-block align-middle text-muted">3</span><i
										class="ci-star-filled fs-xs ms-1"></i>
								</div>
								<div class="w-100">
									<div class="progress" style="height: 4px;">
										<div class="progress-bar" role="progressbar"
											style="width: 17%; background-color: #ffda75;"
											aria-valuenow="17" aria-valuemin="0" aria-valuemax="100">
										</div>
									</div>
								</div>
								<span class="text-muted ms-3">9</span>
							</div>
							<div class="d-flex align-items-center mb-2">
								<div class="text-nowrap me-3">
									<span class="d-inline-block align-middle text-muted">2</span><i
										class="ci-star-filled fs-xs ms-1"></i>
								</div>
								<div class="w-100">
									<div class="progress" style="height: 4px;">
										<div class="progress-bar" role="progressbar"
											style="width: 9%; background-color: #fea569;" aria-valuenow="9"
											aria-valuemin="0" aria-valuemax="100">
										</div>
									</div>
								</div>
								<span class="text-muted ms-3">4</span>
							</div>
							<div class="d-flex align-items-center">
								<div class="text-nowrap me-3">
									<span class="d-inline-block align-middle text-muted">1</span><i
										class="ci-star-filled fs-xs ms-1"></i>
								</div>
								<div class="w-100">
									<div class="progress" style="height: 4px;">
										<div class="progress-bar bg-danger" role="progressbar"
											style="width: 4%;" aria-valuenow="4" aria-valuemin="0"
											aria-valuemax="100">
										</div>
									</div>
								</div>
								<span class="text-muted ms-3">2</span>
							</div>
						</div>
					</div>
					<hr class="mt-4 mb-3">
					<div class="row pt-4">
						<!-- Reviews list-->
						<div class="col-md-7">
							<div class="d-flex justify-content-end pb-4"></div>
			
							<c:forEach var="item" items="${replyList}">
								<!-- Review-->
								<div class="product-review pb-4 mb-4 border-bottom">
									<div class="d-flex mb-3">
										<div class="d-flex align-items-center me-4 pe-2">
											<img class="rounded-circle"
												src="${path}/resources/imgs/review/0${loginMember.mno}.jpg"
												width="50" alt="Rafael Marquez">
											<div class="ps-3">
												<h6 class="fs-sm mb-0">${item.name}</h6>
												<span class="fs-ms text-muted"> <fmt:formatDate
														type="both" value="${item.createDate}" />
												</span>
											</div>
										</div>
										<div>
											<div class="star-rating">
												<c:forEach begin="1" end="${item.rating}">
													<i class="star-rating-icon ci-star-filled active"></i>
												</c:forEach>
												<c:forEach begin="1" end="${5 - item.rating}">
													<i class="star-rating-icon ci-star"></i>
												</c:forEach>
											</div>
										</div>
									</div>
									<p class="fs-md mb-2">${item.content}</p>
									<c:if test="${loginMember != null && loginMember.mno == item.mno}">
										<form class="text-end" action="${path}/shop/deleteReply"
											method="post">
											<input type="hidden" name="rno" value="${item.rno}"> <input
												type="hidden" name="pno" value="${item.pno}">
											<button class="btn">삭제</button>
										</form>
									</c:if>
								</div>
							</c:forEach>
						</div>
						<!--  -->
	
						<!-- Leave review form-->
						<div class="col-md-5 mt-2 pt-4 mt-md-0 pt-md-0">
							<div class="bg-secondary py-grid-gutter px-grid-gutter rounded-3">
								<h3 class="h4 pb-2">리뷰 쓰기</h3>
								<form class="needs-validation" action="${path}/shop/writeReply"
									method="post" novalidate>
									<input type="hidden" name="pno" value="${product.pno}">
									<div class="mb-3">
										<label class="form-label" for="review-rating">Rating<span
											class="text-danger">*</span></label> <select name="score"
											class="form-select" required id="review-rating">
											<option value="">Choose rating</option>
											<option value="5">5 stars</option>
											<option value="4">4 stars</option>
											<option value="3">3 stars</option>
											<option value="2">2 stars</option>
											<option value="1">1 star</option>
										</select>
										<div class="invalid-feedback">Please choose rating!</div>
									</div>
									<div class="mb-3">
										<label class="form-label" for="review-text">Review<span
											class="text-danger">*</span></label>
										<textarea name="content" class="form-control" rows="6" required
											id="review-text"></textarea>
										<div class="invalid-feedback">Please write a review!</div>
										<small class="form-text text-muted">Your review must be
											at least 50 characters.</small>
									</div>
									<c:if test="${loginMember == null}">
										<button class="btn btn-primary btn-shadow d-block w-100" disabled
											type="submit">Submit a Review</button>
									</c:if>
									<c:if test="${loginMember != null}">
										<button class="btn btn-primary btn-shadow d-block w-100"
											type="submit">Submit a Review</button>
									</c:if>
			
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- Product carousel (Style with)-->
		<section>
			<div class="container pt-5">
				<h2 class="h3 text-center pb-4">다른 영양제 보러 가기</h2>
				<div class="tns-carousel tns-controls-static tns-controls-outside">
					<div class="tns-carousel-inner"
						data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: true, &quot;nav&quot;: false, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 18},&quot;768&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;items&quot;:4, &quot;gutter&quot;: 30}}}">

						<c:forEach var="item" items="${plist1}">
							<!-- Product-->
							<div>
								<div class="card product-card card-static">
									<button class="btn-wishlist btn-sm" type="button"
										data-bs-toggle="tooltip" data-bs-placement="left"
										title="Add to wishlist">
										<i class="ci-heart"></i>
									</button>
									<a class="card-img-top d-block overflow-hidden"
										style="width: 200px"
										href="${path}/shop/product?pno=${item.pno}"><img
										src="${item.image}" alt="Product"></a>
									<div class="card-body py-2">
										<a class="product-meta d-block fs-xs pb-1"
											href="${path}/shop/product?pno=${item.pno}">${item.brand}</a>
										<h3 class="product-title fs-sm">
											<a href="${path}/shop/product?pno=${item.pno}">${item.title}</a>
										</h3>
										<div class="d-flex justify-content-between">
											<div class="product-price">
												<span class="text-accent"> <fmt:formatNumber
														value="${item.lprice}" pattern="#,###" />원
												</span>
											</div>
											<div class="star-rating">
												<i class="star-rating-icon ci-star-filled active"></i><i
													class="star-rating-icon ci-star-filled active"></i><i
													class="star-rating-icon ci-star-filled active"></i><i
													class="star-rating-icon ci-star-filled active"></i><i
													class="star-rating-icon ci-star"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>


					</div>
				</div>
			</div>
		</section>
		
		<script type="text/javascript">
			function updateTotal() {
				var quantitySelect = document.getElementById("quantitySelect");
				var totalQuantitySpan = document.getElementById("totalQuantity");
				var totalPrice = document.getElementById("totalPrice");
				var totalPriceSpan = document.getElementById("totalPriceSpan");
				result = quantitySelect.options[quantitySelect.selectedIndex].value;
				result = result * totalPrice.value;
				result = result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + '﻿원';
				totalPriceSpan.innerText = result;
				
				var result1 = quantitySelect.options[quantitySelect.selectedIndex].value;
				totalQuantitySpan.textContent = result1 + "개";
			}
		</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />