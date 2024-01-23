<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- Hero 시작!)-->
	<section class="container mt-4 mb-grid-gutter">
		<div class="bg-faded-info rounded-3 py-4">
			<div class="row align-items-center">
				<div class="col-md-3">
					<div class="px-4 pe-sm-0 ps-sm-5">
						<span class="badge bg-danger">Brandnew</span>
						<h3 class="mt-4 mb-1 text-body"><strong>All new</strong></h3>
						<h2 class="mb-1">덴마크 유산균</h2><br>
						<p class="h5 text-body">
							<b>공유</b>가 선택한 <b style="color:red;">탁! </b><br> 소리나는 유산균<br><br>
							<b style="color:red;">Tak!! 은 덴마크어로 고맙습니다.</b>
						</p>
						<a class="btn btn-accent" href="${path}/shop/product?pno=236">구경하러 가기<i
							class="ci-arrow-right fs-ms ms-1"></i></a>
					</div>
				</div>
				<div class="col-md-9">
					<img src="${path}/resources/imgs/hero/banner1.png" alt="minimax">
				</div>
			</div>
		</div>
	</section>
	<!-- Hero 끝! -->
	<!-- Used for marketplace templates with filters on top-->
	<form name="searchForm" action="${path}/shop/main" method="get">
	<input type="hidden" name="page">
	<section>
		<div class="bg-accent pt-4 pb-5">
			<div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
				<div class="d-lg-flex justify-content-between pb-3">
					<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
						<nav aria-label="breadcrumb">
							<ol
								class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
								<li class="breadcrumb-item"><a class="text-nowrap"
									href="${path}"><i class="ci-home"></i>Home</a></li>
								<li class="breadcrumb-item text-nowrap"><a
									href="${path}/shop/main">Market</a></li>
							</ol>
						</nav>
					</div>
					<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
						<h1 class="h3 text-light mb-0">DRUG24 Health Food Market</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="container pb-5 mb-2 mb-md-4">
			<!-- Toolbar-->
			<div class="bg-light shadow-lg rounded-3 mt-n5 mb-4">
				<div class="d-flex align-items-center ps-2">
					<!-- Search-->
					<div class="input-group">
						<i class="ci-search position-absolute top-50 start-0 translate-middle-y fs-md ms-3"></i>
						<input class="form-control border-0 shadow-none" id="title" name="title" type="text"
							value="${paramMap.title}" placeholder="제품 검색">
					</div>
					<!-- Sort-->
					<div class="d-flex align-items-center">
						<div class="dropdown py-4 border-start">
							<select id="sort" name="sort" class="form-select" onchange="document.searchForm.submit();">
								<option value="normal" ${paramMap.sort == 'normal' ? 'selected' : '' }>추천</option>
								<option value="low" ${paramMap.sort == 'low' ? 'selected' : '' }>낮은 가격</option>
								<option value="high" ${paramMap.sort == 'high' ? 'selected' : '' }>높은 가격</option>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="row pt-3 mx-n2">
				<!-- Products grid-->
				<c:forEach var="item" items="${list}">
					<!-- Product-->
					<div class="col-md-4 col-sm-6 px-2 mb-4">
						<div class="card product-card">
							<button class="btn-wishlist btn-sm" type="button"
								data-bs-toggle="tooltip" data-bs-placement="left"
								title="Add to wishlist">
								<i class="ci-heart"></i>
							</button>
							<a class="card-img-top d-block overflow-hidden"
								style="height: 250px;"
								href="${path}/shop/product?pno=${item.pno}"> <img
								src="${item.image }" alt="Product">
							</a>
							<div class="card-body py-2">
								<a class="product-meta d-block fs-xs pb-1"
									href="${path}/shop/product?pno=${item.pno}">${item.brand }</a>
								<h3 class="product-title fs-sm">
									<a href="${path}/shop/product?pno=${item.pno}">${item.title }</a>
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
										onclick="location.href='${path}/shop/addCart?pno=${item.pno}'">
										<i class="ci-cart fs-sm me-1"></i>Add to Cart
									</button>
								</div>
							</c:if>
						</div>
						<hr class="d-sm-none">
					</div>
				</c:forEach>
			</div>

			<hr class="my-3">
			<!-- Pagination-->
			<nav class="d-flex justify-content-between pt-2"
				aria-label="Page navigation">
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						onclick="movePage(${pageInfo.prevPage});"><i
							class="ci-arrow-left me-2"></i>Prev</a></li>
				</ul>
				<ul class="pagination">

					<!-- 10개 페이지 -->
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
						step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active d-none d-sm-block"
								aria-current="page"><span class="page-link">${status.current}<span
									class="visually-hidden">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item d-none d-sm-block"><a class="page-link"
								onclick="movePage(${status.current});">${status.current}</a></li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						onclick="movePage(${pageInfo.nextPage});" aria-label="Next">Next<i
							class="ci-arrow-right ms-2"></i></a></li>
				</ul>
			</nav>
		</div>
	</section>
	</form>


<script type="text/javascript">
		function movePage(page){
			searchForm.page.value = page;
			searchForm.submit();
		}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />