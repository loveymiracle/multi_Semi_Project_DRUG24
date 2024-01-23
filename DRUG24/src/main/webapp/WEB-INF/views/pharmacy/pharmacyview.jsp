<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- j 쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


<style>
      /* 지도 스타일 시작 */
      .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
      .map_wrap {position:relative;width:100%;height:350px;}
      #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
      #category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
      #category li.on {background: #eee;}
      #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
      #category li:last-child{margin-right:0;border-right:0;}
      #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
      #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
      #category li .pharmacy {background-position: -10px -72px;}
      #category li.on .category_bg {background-position-x:-46px;}
      .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
      .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
      .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
      .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
      .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
      .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
      .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
      .placeinfo .tel {color:#0f7833;}
      .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
      h2 {color: white; }
       * {font-family: 'Noto Sans KR', sans-serif;}
      .blodFont {font-family: 'Nanum Gothic', sans-serif;}
      .fs-5 {font-family: 'Noto Sans KR', sans-serif;}
      /* 지도 스타일 끝 */
</style>



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="약국찾기 상세페이지" name="title"/>
</jsp:include>
	     <!-- Hero section  히어로 섹션 =============================================================-->
     <section class="mt-n5 mb-5 bg-dark"
         style="background-color: white; background-image: url(); background-repeat: no-repeat; background-position: 85% center; height: 250px;">
         <div class="pb-lg-1 mb-lg-3">
             <div class="container d-lg-flex justify-content-between py-2 py-lg-5 my-lg-5">
                 <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                     <nav aria-label="breadcrumb">
                         <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-start fs-5">
                             <li class="breadcrumb-item "><a class="text-nowrap text-light" href="main.html"><i
                                         class="ci-home"></i>Home</a></li>
                             <li class="breadcrumb-item text-nowrap"><a class="text-light" href="#"> 약국 찾기 </a>
                             </li>
                             <li class="breadcrumb-item text-nowrap">
                                 <span class=" fs-5 text-danger"> 약국 상세보기 </span>
                             </li>
                         </ol>
                     </nav>
                 </div>
                 <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                     <h1 class="blodFont mb-0 text-light"> 약국 상세보기 </h1>
                     <br>
                     <p class="h5 mb-1 text-light">
                         운영시간이 변동될 수 있으므로 약국에 전화 확인 후 방문해주시기 바랍니다.
                     <p class="h5 mb-0 text-light">약국 운영시간은 대한약사회에서 제공하는 정보입니다.</p>
                 </div>
             </div>
         </div>
     </section>
     <!-- Body-->
     <!--------------------------------------------------------  툴바 -->
     <br>
     <body class="handheld-toolbar-enabled">
         <!-- Shadow box-->
         <section class="container mb-2 pb-3" style="margin-top: 10px;">
             <div class="row">
                 <div class="d-flex justify-content-between">
                     <div class="h1 blodFont mb-5" id="">  <c:out value="${item.phname}"/> </div>
                     <div class="py-2 me-2">
                         <button class="btn btn-outline-accent" type="button"><i class="ci-star fs-lg me-2"></i>약국
                             즐겨찾기</button>
                     </div>
                 </div>
                 <div class="mb-3 pb-4">
                     <span class="h3">
                         <i class="ci-location text-success fw-bold  me-2 h2"></i>
                        	<c:out value="${item.phaddress}"/>
                     </span>
                 </div>
                 <!--========================================================= 지도 ===== 지도를 표시할 div 입니다 -->
                 <div id="map" style="width:100%; height:450px;"></div>
                 <script type="text/javascript"
                     src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adce9c041442fa349eecbf8b8bea554d">
                     </script>
                 <script>
                     var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                         mapOption = {
                             center: new kakao.maps.LatLng(37.5666103, 126.9783882), // 지도의 중심좌표
                             level: 2 // 지도의 확대 레벨
                         };
                     // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                     var map = new kakao.maps.Map(mapContainer, mapOption); 
                 </script>
                 <div class=" row" style="margin-top: 70px;">
                     <h2 class="mb-4 text-muted blodFont h2" id=""> 상세 정보 </h2>
                     <div class="row h3">
                         <div class="mb-2 pb-4">
                             <i class="ci-phone me-2 text-success fw-bold h2"></i> 061 - 277 -2100
                         </div>
                         <div class=" d-flex justify-content-between mb-2">
                             <div class="" style="width: 360px;">
                                 <i class="ci-time me-2 text-success fw-bold  h2"></i> 운영 시간
                             </div>
                         </div>
                         <div class="row d-flex justify-content-between mb-4" style="margin-left: 30px;">
                             <div class="col row mb-1">
                                 <div> 월요일 &nbsp; 09:00 ~ 20:30 </div>
                                 <div> 화요일 &nbsp; 09:00 ~ 20:30 </div>
                                 <div> 수요일 &nbsp; 09:00 ~ 20:30 </div>
                                 <div> 목요일 &nbsp; 09:00 ~ 20:30 </div>
                                 <div> 금요일 &nbsp; 09:00 ~ 20:30 </div>
                             </div>
                             <div class="col mb-1" style="margin-right: 500px;">
                                 <div> 토요일 &nbsp; 09:00 ~ 20:30</div>
                                 <div> 일요일 &nbsp; 09:00 ~ 20:30</div>
                                 <div> &nbsp;</div>
                                 <div> 공휴일 &nbsp; 09:00 ~ 20:30</div>
                             </div>
                         </div>
                         <div class="mb-2 pb-4">
                             <i class="ci-moon me-2 text-success fw-bold  h2"></i> 심야 약국 , 주말약국
                         </div>
                         <div class="mb-2 pb-4">
                             <i class="ci-home me-2 text-success fw-bold  h2"></i> 20년 이상 건강을 책임지고 있는
                             약국입니다. 1년
                             365일 연중무휴, 야간 운영합니다
                         </div>
                     </div>
                 </div>
             </div>
             <hr class="mb-4">
         </section>
         <!---- 이용 후기 ========================================== -->
         <!-- Product description + Reviews + Comments-->
         <section class="container mb-4 mb-lg-5" style="margin-top: 30px;">
             <div class="container d-flex justify-content-between">
                 <div class=" h2 mb-4 blodFont" id=""> 약국 이용후기
                     <div class="d-inline-block h3 text-accent"> (3)
                     </div>
                 </div>
                 <div>
                     <a class="btn btn-accent" type="button" href="BoardReviewWrite.html">
                         <i class="ci-edit-alt me-2"></i> 이용후기 작성
                     </a>
                 </div>
             </div>
             <hr class="mb-4 text-accent">
             <div class="card col mb-4">
                 <div class="card-body">
                     <!-- Product review -->
                     <div class="product-review">
                         <div class="d-flex mb-3">
                             <div class="d-flex align-items-center me-0 pe-0">
                                 <img class="rounded-circle" width="50" src="img/blog/meta/04.jpg"
                                     alt="Rafael Marquez" />
                                 <div class="ps-3">
                                     <h6 class="h5 mb-1"> 나경원</h6>
                                     <span class="h6 text-muted">2022년 8월 20일 </span>
                                 </div>
                             </div>
                             <div style="margin-left: 40px;">
                                 <div class="star-rating">
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star"></i>
                                 </div>
                             </div>
                             <div class="text-nowrap" style="margin-left: 700px;">
                                 <button class="btn-like" type="button">15</button>
                                 <button class="btn-dislike" type="button">3</button>
                             </div>
                         </div>
                         <p class="h3 mb-3">
                             복약지도 친절ㅎ해요
                         </p>
                     </div>
                 </div>
             </div>
             <div class="card col mb-4">
                 <div class="card-body">
                     <!-- Product review -->
                     <div class="product-review">
                         <div class="d-flex mb-3">
                             <div class="d-flex align-items-center me-0 pe-0">
                                 <img class="rounded-circle" width="50" src="img/blog/meta/04.jpg"
                                     alt="Rafael Marquez" />
                                 <div class="ps-3">
                                     <h6 class="h5 mb-1"> 나경원</h6>
                                     <span class="h6 text-muted">2022년 8월 20일 </span>
                                 </div>
                             </div>
                             <div style="margin-left: 40px;">
                                 <div class="star-rating">
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star"></i>
                                 </div>
                             </div>
                             <div class="text-nowrap" style="margin-left: 700px;">
                                 <button class="btn-like" type="button">15</button>
                                 <button class="btn-dislike" type="button">3</button>
                             </div>
                         </div>
                         <p class="h3 mb-3">
                             복약지도 친절ㅎ해요
                         </p>
                     </div>
                 </div>
             </div>
             <div class="card col mb-4">
                 <div class="card-body">
                     <!-- Product review -->
                     <div class="product-review">
                         <div class="d-flex mb-3">
                             <div class="d-flex align-items-center me-0 pe-0">
                                 <img class="rounded-circle" width="50" src="img/blog/meta/04.jpg"
                                     alt="Rafael Marquez" />
                                 <div class="ps-3">
                                     <h6 class="h5 mb-1"> 나경원</h6>
                                     <span class="h6 text-muted">2022년 8월 20일 </span>
                                 </div>
                             </div>
                             <div style="margin-left: 40px;">
                                 <div class="star-rating">
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star-filled active"></i>
                                     <i class="fs-5 star-rating-icon ci-star"></i>
                                 </div>
                             </div>
                             <div class="text-nowrap" style="margin-left: 700px;">
                                 <button class="btn-like" type="button">15</button>
                                 <button class="btn-dislike" type="button">3</button>
                             </div>
                         </div>
                         <p class="h3 mb-3">
                             복약지도 친절ㅎ해요
                         </p>
                     </div>
                 </div>
             </div>
             <div class="d-flex justify-content-between">
                 <div class=""> </div>
                 <a class="btn btn-outline-accent" type="button" href="BoardPharmacyreview.html">
                     <i class="ci-arrow-right me-2"></i> 이용후기 더 보기
                 </a>
             </div>
             </div>
             <br><br><br>
             <!-- Related posts-->
             <div class="bg-secondary py-4">
                 <div class="container py-4 mb-lg-5">
                     <h2 class="h2 text-center pb-4"> 주변 다른 약국 </h2>
                     <div class="tns-carousel">
                         <div class="tns-carousel-inner"
                             data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: false, &quot;autoHeight&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:
{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 20},&quot;900&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 
20}, &quot;1100&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 30}}}">
                             <!-- article-->
                             <div>
                                 <div class="card product-card">
                                     <a class="card-img-top d-block overflow-hidden" href="FindPharmacy.html">
                                         <img src="imgs/pharmacy/phar1.png" style="width: 100%; height: 230px;"
                                             alt="Product"></a>
                                     <!-- ---------- ---------  약국 이미지 -->
                                     <div class="card-body">
                                         <div
                                             class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                             <h3 class="product-title mb-2 blodFont"><a href="FindPharmacy.html">
                                                     논현튼튼 싱싱약국
                                                 </a>
                                             </h3>
                                             <!-- 별 -->
                                             <div class="h5 text-warning"> 이용후기 (3) </div>
                                             <div class="Pharmacy-name">
                                                 <div class="h5 me-1">
                                                     <i class="ci-location me-1"></i> 서울 논현역
                                                 </div>
                                                 <div class="h5 me-1">
                                                     <i class="ci-phone me-1"></i> 054-834-0015
                                                 </div>
                                                 <h1 class="product-title h5 mb-3 me-1">
                                                     <i class="ci-time text-muted me-1"></i> 영업시간
                                                     <span class="h6 ms-2 text-muted">08:00 - 19:00</span>
                                                 </h1>
                                             </div>
                                             <div class="d-flex h5" style="margin-top: 5px;">
                                                 <div class="bg-success text-white rounded-1 py-2 px-3 h5 me-3">
                                                     <i class="ci-moon text-white me-1"></i> 심야 약국
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <!-- article-->
                             <div>
                                 <div class="card product-card">
                                     <a class="card-img-top d-block overflow-hidden" href="FindPharmacy.html">
                                         <img src="imgs/pharmacy/phar1.png" style="width: 100%; height: 230px;"
                                             alt="Product"></a>
                                     <!-- ---------- ---------  약국 이미지 -->
                                     <div class="card-body">
                                         <div
                                             class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                             <h3 class="product-title mb-2 blodFont"><a href="FindPharmacy.html">
                                                     논현튼튼 싱싱약국
                                                 </a>
                                             </h3>
                                             <!-- 별 -->
                                             <div class="h5 text-warning"> 이용후기 (3) </div>
                                             <div class="Pharmacy-name">
                                                 <div class="h5 me-1">
                                                     <i class="ci-location me-1"></i> 서울 논현역
                                                 </div>
                                                 <div class="h5 me-1">
                                                     <i class="ci-phone me-1"></i> 054-834-0015
                                                 </div>
                                                 <h1 class="product-title h5 mb-3 me-1">
                                                     <i class="ci-time text-muted me-1"></i> 영업시간
                                                     <span class="h6 ms-2 text-muted">08:00 - 19:00</span>
                                                 </h1>
                                             </div>
                                             <div class="d-flex h5" style="margin-top: 5px;">
                                                 <div class="bg-success text-white rounded-1 py-2 px-3 h5 me-3">
                                                     <i class="ci-moon text-white me-1"></i> 심야 약국
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <!-- article-->
                             <div>
                                 <div class="card product-card">
                                     <a class="card-img-top d-block overflow-hidden" href="FindPharmacy.html">
                                         <img src="imgs/pharmacy/phar1.png" style="width: 100%; height: 230px;"
                                             alt="Product"></a>
                                     <!-- ---------- ---------  약국 이미지 -->
                                     <div class="card-body">
                                         <div
                                             class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                             <h3 class="product-title mb-2 blodFont"><a href="FindPharmacy.html">
                                                     논현튼튼 싱싱약국
                                                 </a>
                                             </h3>
                                             <!-- 별 -->
                                             <div class="h5 text-warning"> 이용후기 (3) </div>
                                             <div class="Pharmacy-name">
                                                 <div class="h5 me-1">
                                                     <i class="ci-location me-1"></i> 서울 논현역
                                                 </div>
                                                 <div class="h5 me-1">
                                                     <i class="ci-phone me-1"></i> 054-834-0015
                                                 </div>
                                                 <h1 class="product-title h5 mb-3 me-1">
                                                     <i class="ci-time text-muted me-1"></i> 영업시간
                                                     <span class="h6 ms-2 text-muted">08:00 - 19:00</span>
                                                 </h1>
                                             </div>
                                             <div class="d-flex h5" style="margin-top: 5px;">
                                                 <div class="bg-success text-white rounded-1 py-2 px-3 h5 me-3">
                                                     <i class="ci-moon text-white me-1"></i> 심야 약국
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                             <!-- article-->
                             <div>
                                 <div class="card product-card">
                                     <a class="card-img-top d-block overflow-hidden" href="FindPharmacy.html">
                                         <img src="imgs/pharmacy/phar1.png" style="width: 100%; height: 230px;"
                                             alt="Product"></a>
                                     <!-- ---------- ---------  약국 이미지 -->
                                     <div class="card-body">
                                         <div
                                             class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                             <h3 class="product-title mb-2 blodFont"><a href="FindPharmacy.html">
                                                     논현튼튼 싱싱약국
                                                 </a>
                                             </h3>
                                             <!-- 별 -->
                                             <div class="h5 text-warning"> 이용후기 (3) </div>
                                             <div class="Pharmacy-name">
                                                 <div class="h5 me-1">
                                                     <i class="ci-location me-1"></i> 서울 논현역
                                                 </div>
                                                 <div class="h5 me-1">
                                                     <i class="ci-phone me-1"></i> 054-834-0015
                                                 </div>
                                                 <h1 class="product-title h5 mb-3 me-1">
                                                     <i class="ci-time text-muted me-1"></i> 영업시간
                                                     <span class="h6 ms-2 text-muted">08:00 - 19:00</span>
                                                 </h1>
                                             </div>
                                             <div class="d-flex h5" style="margin-top: 5px;">
                                                 <div class="bg-success text-white rounded-1 py-2 px-3 h5 me-3">
                                                     <i class="ci-moon text-white me-1"></i> 심야 약국
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
         </section>
     </body>
     
         <!-- ===================================================================   Pagination-->
            <nav class="d-flex justify-content-between pt-2" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#"><i class="ci-arrow-left me-2"></i></a>
                    </li>
                </ul>
                <ul class="pagination">
                	<!-- 페이지 -->
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
                   <!-- --========================================================== -->       
                </ul>
            </nav>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	function movePage(page){
		searchForm.page.value = page;
		searchForm.submit();
	}
</script>







