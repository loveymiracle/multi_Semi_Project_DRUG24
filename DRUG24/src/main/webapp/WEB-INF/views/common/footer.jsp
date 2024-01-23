<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
		<!-- 푸터 시작-->
		<footer class="footer bg-dark pt-5">
			<div class="container pt-2 pb-3">
				<div class="row">
					<div class="col-md-6 text-center text-md-start mb-4">
						<div class="text-nowrap mb-3">
							<a class="d-inline-block align-middle mt-n2 me-2" href="${path}"><img
								src="${path}/resources/imgs/home/Logo.png" width="100" alt="DRUG24"></a><span
								class="d-inline-block align-middle h5 fw-bold text-white mb-0">DRUG24</span>
						</div>
						<span class="d-inline-block align-middle h5 fw-bold text-white mb-0">About
							us</span><br>
						<p class="fs-sm text-white opacity-70 pb-1">
							DRUG24는 약 24,000개의 의약품 정보를 제공합니다.<br>오남용 없이 안전하게 복용하세요
						</p>
						<h6 class="d-inline-block pe-3 me-3 border-end border-light">
							<span class="text-primary">5,478 </span><span
								class="fw-normal text-white">Products</span>
						</h6>
						<h6 class="d-inline-block pe-3 me-3 border-end border-light">
							<span class="text-primary">521 </span><span
								class="fw-normal text-white">Pharmacy</span>
						</h6>
						<h6 class="d-inline-block me-3">
							<span class="text-primary">17 </span><span
								class="fw-normal text-white">Pharmacist</span>
						</h6>
						<div class="widget mt-4 text-md-nowrap text-center text-md-start">
							<a class="btn-social bs-light bs-twitter me-2 mb-2" href="#"><i
								class="ci-twitter"></i></a><a
								class="btn-social bs-light bs-facebook me-2 mb-2" href="#"><i
								class="ci-facebook"></i></a><a
								class="btn-social bs-light bs-dribbble me-2 mb-2" href="#"><i
								class="ci-dribbble"></i></a><a
								class="btn-social bs-light bs-behance me-2 mb-2" href="#"><i
								class="ci-behance"></i></a><a
								class="btn-social bs-light bs-pinterest me-2 mb-2" href="#"><i
								class="ci-pinterest"></i></a>
						</div>
					</div>
					<div
						class="col-md-3 d-none d-md-block text-center text-md-start mb-4">
						<div class="widget widget-links widget-light pb-2">
							<h3 class="widget-title text-light">Categories</h3>
							<ul class="widget-list">
								<li class="widget-list-item"><a class="widget-list-link"
									href="#">Drug Search</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="${path}/pharmacy/search">Pharmacy Search</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="${path}/shop/main">Shopping Mall</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="${path}/board/list">Community</a></li>
							</ul>
						</div>
					</div>
					<div
						class="col-md-3 d-none d-md-block text-center text-md-start mb-4">
						<div class="widget widget-links widget-light pb-2">
							<h3 class="widget-title text-light">For members</h3>
							<ul class="widget-list">
								<li class="widget-list-item"><a class="widget-list-link"
									href="#">My First Aid Kit</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="#">My Page</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="#">Pharmacy Reviews</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="#">Medicine Reviews</a></li>
								<li class="widget-list-item"><a class="widget-list-link"
									href="#">Notice</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</footer>
		<!-- 푸터 끝 -->
		<!-- Back To Top Button-->
		
		<!-- Back To Top Button-->
		<a class="btn-scroll-top" href="#top" data-scroll><span
      	class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon ci-arrow-up">
    	</i></a>
	  	<!-- Vendor scrits: js libraries and plugins-->
	  	<script src="${path}/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	  	<script src="${path}/resources/vendor/simplebar/dist/simplebar.min.js"></script>
	  	<script src="${path}/resources/vendor/tiny-slider/dist/min/tiny-slider.js"></script>
	  	<script src="${path}/resources/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js"></script>
	  	<script src="${path}/resources/vendor/drift-zoom/dist/Drift.min.js"></script>
	  	<script src="${path}/resources/vendor/lightgallery.js/lightgallery.min.js"></script>
  		<script src="${path}/resources/vendor/lightgallery.js/plugins/video/lg-video.min.js"></script>
	  	<!-- Main theme script-->
	  	<script src="${path}/resources/vendor/nouislider/dist/nouislider.min.js"></script>
	  	<script src="${path}/resources/vendor/drift-zoom/dist/Drift.min.js"></script>
	  	<script src="${path}/resources/js/theme.min.js"></script>
	</body>
</html>