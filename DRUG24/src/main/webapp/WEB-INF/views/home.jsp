<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="DRUG24 홈페이지" name="title"/>
</jsp:include>

	<section id="content">
		<!-- Hero section-->
		<section class="bg-position-center mt-n5 mb-5"
			style="background-image: url(${path}/resources/imgs/marketplace-hero.png);">
			<div class="pb-lg-1 mb-lg-3">
				<div class="container py-lg-5 my-lg-5">
					<div class="row mb-4 mb-sm-5">
						<div class="col-lg-7 col-md-9 text-center text-sm-start">
							<h1 class="text-heading lh-base">
								<span class='fw-light blodFont'>약 24,000 개의 의약품을</span> 안전하게 확인하고
								복용하세요! 의약품은 DRUG24
							</h1>
							<h2 class="h5 text-heading fw-light blodFont">Check and take
								your medicine safely on this site. DRUG24 for you!</h2>
						</div>
					</div>
					<div class="row pb-lg-5  mb-sm-5">
						<div class="col-lg-6 col-md-8">
							<div class="input-group input-group-lg flex-nowrap">
								<i
									class="ci-search position-absolute top-50 translate-middle-y ms-3"></i>
								<input class="form-control rounded-start" type="text"
									placeholder="Start your search">
								<button class="btn btn-primary btn-lg fs-base" type="button">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 배너 끝 Hero selction -->
	</section>
	
	<!-- 추천 아이템 시작 (Carousel)-->
	<section class="container position-relative pt-3 pt-lg-0 pb-5 mt-n3">
		<div class="card px-lg-2 border-0 shadow-lg">
			<div class="card-body px-5 pt-4 pb-3">
				<h2 class="h3 text-center">매일 매일 잊지 말고 장 관리!</h2>
				<p class="text-muted text-center">장까지 살아가는 프로바이오틱스</p>
				<!-- Carousel-->
				${plist2}
				<c:forEach var="item" items="${plist2}">
				<div class="tns-carousel pt-1 px-5">
					<div class="tns-carousel-inner"
						data-carousel-options="{&quot;items&quot;: 2, &quot;gutter&quot;: 50, &quot;controls&quot;: false, &quot;nav&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3}, &quot;992&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 50}}}">
						<!-- 상품1 -->
						<div>
							<div class="card product-card-alt">
								<div class="product-thumb">
									<button class="btn-wishlist btn-sm" type="button">
										<i class="ci-heart"></i>
									</button>
									<div class="product-card-actions">
										<a class="btn btn-light btn-icon btn-shadow fs-base mx-2"
											href="marketplace-single.html"><i class="ci-eye"></i></a>
										<button class="btn btn-light btn-icon btn-shadow fs-base mx-2"
											type="button">
											<i class="ci-cart"></i>
										</button>
									</div>
									<a class="product-thumb-overlay" href="${path}/shop/product?pno=${item.pno}"></a>
									<img src="${item.image}" alt="toothpaste">
								</div>
								<div class="card-body">
									<div
										class="d-flex flex-wrap justify-content-between align-items-start pb-2">
										<div class="text-muted fs-xs me-1"><a class="product-meta d-block fs-xs pb-1"
								href="${path}/shop/product?pno=${item.pno}">${item.brand}</a></div>
										<div class="star-rating">
											<c:forEach begin="1" end="${item.rating}">
												<i class="star-rating-icon ci-star-filled active"></i>
											</c:forEach>
										<c:forEach begin="1" end="${5 - item.rating}">
											<i class="star-rating-icon ci-star"></i>
										</c:forEach>
										</div>
									</div>
									<h3 class="product-title fs-sm mb-2">
										<a href="${path}/shop/product?pno=${item.pno}">${item.title}</a>
									</h3>
									<div class="d-flex justify-content-between">
										<div class="product-price">
											<span class="text-accent"> <fmt:formatNumber
											value="${item.lprice }" pattern="#,###" />원
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- 상품1 끝 -->
						<c:if test="${loginMember != null }">
							<div class="card-body card-body-hidden">
								<button class="btn btn-primary btn-sm d-block w-100 mb-2"
									type="button"
									onclick="location.href='${path}/addCart?pno=${item.pno}'">
									<i class="ci-cart fs-sm me-1"></i>Add to Cart
								</button>
							</div>
						</c:if>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<!-- 추천 아이템 끝 -->
	<!-- 증상별 추천 아이템 시작-->
	<section class="container position-relative pb-5 mb-lg-3">
		<!-- Heading-->
		<div
			class="d-flex flex-wrap justify-content-between align-items-center pt-1 border-bottom pb-4 mb-4">
			<h2 class="h3 mb-0 pt-3 me-2">활력 증진 추천 아이템</h2>
			<div class="pt-3"><a class="btn btn-outline-accent btn-sm" href="${path}/shop/main">구경하러 가기<i
              class="ci-arrow-right ms-1 me-n1"></i></a></div>
      		</div>
		</div>
		<!-- Grid-->
		<div class="row pt-2 mx-n2">
			<c:forEach var="item" items="${plist1}">
				<!-- Product-->
				<div class="col-lg-3 col-md-4 col-sm-6 px-2 mb-2">
					<div class="card product-card">
						<div class="product-card-actions d-flex align-items-center">
							<button class="btn-wishlist btn-sm" type="button"
								data-bs-toggle="tooltip" data-bs-placement="left"
								title="Add to wishlist">
								<i class="ci-heart"></i>
							</button>
						</div>
						<a style="height: 250px"
							class="card-img-top d-block overflow-hidden"
							href="${path}/shop/product?pno=${item.pno}"> <img
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
											value="${item.lprice }" pattern="#,###" />원
									</span>
								</div>
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
	
						<c:if test="${loginMember != null }">
							<div class="card-body card-body-hidden">
								<button class="btn btn-primary btn-sm d-block w-100 mb-2"
									type="button"
									onclick="location.href='${path}/addCart?pno=${item.pno}'">
									<i class="ci-cart fs-sm me-1"></i>Add to Cart
								</button>
							</div>
						</c:if>
					</div>
					<hr class="d-sm-none">
				</div>
			</c:forEach>
		</div>
	</section>
	<!--추천 아이템 끝-->
</main>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

