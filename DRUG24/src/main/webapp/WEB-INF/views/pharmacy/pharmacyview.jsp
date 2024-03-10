<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<script type="text/javascript" src="${path}/resources/js/jquery-3.7.0.js"></script>

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
				<div
					class="container d-lg-flex justify-content-between py-2 py-lg-5 my-lg-5">
					<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
						<nav aria-label="breadcrumb">
							<ol
								class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-start fs-5">
								<li class="breadcrumb-item "><a
									class="text-nowrap text-light" href="main.html"><i
										class="ci-home"></i>Home</a></li>
								<li class="breadcrumb-item text-nowrap"><a class="text-light"
									href="${path}/pharmacy/search"> 약국 찾기 </a></li>
								<li class="breadcrumb-item text-nowrap"><span
									class=" fs-5 text-danger"> 약국 상세보기 </span></li>
							</ol>
						</nav>
					</div>
					<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
						<h1 class="blodFont mb-0 text-light">약국 상세보기</h1>
						<br>
						<p class="h5 mb-1 text-light">운영시간이 변동될 수 있으므로 약국에 확인 후
							방문해주시기 바랍니다.
						<p class="h5 mb-2 text-light">약국 운영시간은 대한약사회에서 제공하는 정보입니다.</p>
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
						<div class="h1 blodFont mb-5" id="">
							<c:out value="${pharmacy.phname}" />
						</div>
					</div>
					<div class="mb-3 pb-4">
						<span class="h3"> <i
							class="ci-location text-success fw-bold  me-2 h2"></i> <c:out
								value="${pharmacy.phaddress}" />
						</span>
					</div>
					<!--========================================================= 지도 ===== 지도를 표시할 div 입니다 -->
					<div id="map" style="width: 100%; height: 450px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee850f3227ff38fdb5e4924011797d01"></script>
					<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									    mapOption = { 
									        center: new kakao.maps.LatLng(value= "${pharmacy.phlati}", "${pharmacy.phlong}"), // 지도의 중심좌표
									        level: 3 // 지도의 확대 레벨
									    };
									
									var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		   						  
									var imageSrc = '${path}/resources/imgs/phmarker.png', // 마커이미지의 주소입니다    
								    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
								    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				                         
								  	 // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
								    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
								  	     markerPosition = new kakao.maps.LatLng("${pharmacy.phlati}", "${pharmacy.phlong}"); // 마커가 표시될 위치입니다
					                         
								  	 // 마커를 생성합니다
								   var marker = new kakao.maps.Marker({
								  	   position: markerPosition,
								  	   image: markerImage // 마커이미지 설정 
								  	 });
					                         
								  	 // 마커가 지도 위에 표시되도록 설정합니다
								  	 marker.setMap(map);  
				              
						    </script>
		
					<div class=" row" style="margin-top: 70px;">
						<h2 class="mb-4 text-muted blodFont h2" id="">상세 정보</h2>
						<div class="row h3">
							<div class="mb-2 pb-4">
								<i class="ci-phone me-2 text-success fw-bold h2"></i>
								<c:out value="${pharmacy.phtel}" />
							</div>
							<div class=" d-flex justify-content-between mb-2">
								<div class="" style="width: 360px;">
									<i class="ci-time me-2 text-success fw-bold  h2"></i> 운영 시간
								</div>
							</div>
		
							<div class="row d-flex justify-content-around mb-4 ms-5"
								>
								<div class="col-6 row mb-1 ms-1">
									<div>
										월요일 &nbsp;
										<c:set var="rawTime" value="${pharmacy.phop1s}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
										~
										<c:set var="rawTime" value="${pharmacy.phop1e}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
									</div>
									<div>
										화요일 &nbsp;
										<c:set var="rawTime" value="${pharmacy.phop2s}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
										~
										<c:set var="rawTime" value="${pharmacy.phop2e}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
									</div>
									<div>
										수요일 &nbsp;
										<c:set var="rawTime" value="${pharmacy.phop3s}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
										~
										<c:set var="rawTime" value="${pharmacy.phop3e}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
									</div>
									<div>
										목요일 &nbsp;
										<c:set var="rawTime" value="${pharmacy.phop4s}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
										~
										<c:set var="rawTime" value="${pharmacy.phop4e}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
									</div>
									<div>
										금요일 &nbsp;
										<c:set var="rawTime" value="${pharmacy.phop5s}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
										~
										<c:set var="rawTime" value="${pharmacy.phop5e}" />
										<c:set var="formattedTime"
											value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
										<c:out value="${formattedTime}" />
									</div>
								</div>
								<div class="col-6 mb-1 ms-1">
		
									<div>
										토요일 &nbsp;
										<c:if test="${pharmacy.phop6s != null }">
											<c:set var="rawTime" value="${pharmacy.phop6s}" />
											<c:set var="formattedTime"
												value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
											<c:out value="${formattedTime}" />  ~
		                               				<c:set var="rawTime"
												value="${pharmacy.phop6e}" />
											<c:set var="formattedTime"
												value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
											<c:out value="${formattedTime}" />
										</c:if>
									</div>
									<div>
										일요일 &nbsp;
										<c:if test="${pharmacy.phop7s != null }">
											<c:set var="rawTime" value="${pharmacy.phop7s}" />
											<c:set var="formattedTime"
												value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
											<c:out value="${formattedTime}" />  ~
		                               				<c:set var="rawTime"
												value="${pharmacy.phop7e}" />
											<c:set var="formattedTime"
												value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
											<c:out value="${formattedTime}" />
										</c:if>
									</div>
									<div>&nbsp;</div>
		
									<div>
										공휴일 &nbsp;
										<c:if test="${pharmacy.phop8s != null }">
											<c:set var="rawTime" value="${pharmacy.phop8s}" />
											<c:set var="formattedTime"
												value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
											<c:out value="${formattedTime}" />  ~
		                               				<c:set var="rawTime"
												value="${pharmacy.phop8e}" />
											<c:set var="formattedTime"
												value="${fn:substring(rawTime, 0, 2)}:${fn:substring(rawTime, 2, 4)}" />
											<c:out value="${formattedTime}" />
										</c:if>
									</div>
								</div>
							</div>
		
							<div class="mb-2 pb-4">
								<i class="ci-moon me-2 text-success fw-bold  h2"></i>
								<c:if
									test="${pharmacy.phop1e >= 2200 or pharmacy.phop2e >= 2200  or pharmacy.phop3e >= 2200  or pharmacy.phop4e >= 2200
		                                          or pharmacy.phop5e >= 2200  or pharmacy.phop6e >= 2200  or pharmacy.phop7e >= 2200  or pharmacy.phop8e >= 2200}">  심야약국  </c:if>
								<c:if test="${pharmacy.phop7s != null }"> &nbsp; 주말약국  </c:if>
							</div>
							<div class="mb-2 pb-4">
								<i class="ci-home me-2 text-success fw-bold  h2"></i> 편안한 분위기와
								전문적인 상담으로, 약물 복용에 대한 궁금증을 해결해 드립니다.
							</div>
						</div>
					</div>
				</div>
			</section>
		
		
			<!-- Reviews-->
			<section>
				<div class="border-top border-bottom my-lg-3 py-5">
					<div class="container pt-md-2" id="reviews">
						<div class="row pb-3">
							<div class="col-lg-4 col-md-5">
								<h3 class="h4 mb-4">총 리뷰 갯수: ${replyCount}개</h3> 
				                <div>
									<div class="star-rating">
										<c:forEach begin="1" end="${average}">
											<i class="ci-star-filled fs-sm text-accent me-1"></i>
										</c:forEach>
										<c:forEach begin="1" end="${5 - average}">
											<i class="ci-star fs-sm text-muted me-1"></i>
										</c:forEach>
									</div>
								</div>
								<span class="d-inline-block align-middle">${average} 총 평점</span>
				                <p class="pt-3 fs-sm text-muted">${replyCount} 명중 ${reply5 + reply4}명 (${recommand}%)<br>의 고객이 이 제품을 추천합니다</p>
				              </div>
							<div class="col-lg-8 col-md-7">
								<div class="d-flex align-items-center mb-2">
									<div class="text-nowrap me-3">
										<span class="d-inline-block align-middle text-muted">5</span><i
											class="ci-star-filled fs-xs ms-1"></i>
									</div>
									<div class="w-100">
				                    <div class="progress" style="height: 4px;">
				                      <div class="progress-bar bg-success" role="progressbar" style="width: ${rate5}%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
				                    </div>
				                  </div><span class="text-muted ms-3">${reply5}</span>
				                </div>
				                <div class="d-flex align-items-center mb-2">
				                  <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">4</span><i class="ci-star-filled fs-xs ms-1"></i></div>
				                  <div class="w-100">
				                    <div class="progress" style="height: 4px;">
				                      <div class="progress-bar" role="progressbar" style="width: ${rate4}%; background-color: #a7e453;" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100"></div>
				                    </div>
				                  </div><span class="text-muted ms-3">${reply4}</span>
				                </div>
				                <div class="d-flex align-items-center mb-2">
				                  <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">3</span><i class="ci-star-filled fs-xs ms-1"></i></div>
				                  <div class="w-100">
				                    <div class="progress" style="height: 4px;">
				                      <div class="progress-bar" role="progressbar" style="width: ${rate3}%; background-color: #ffda75;" aria-valuenow="17" aria-valuemin="0" aria-valuemax="100"></div>
				                    </div>
				                  </div><span class="text-muted ms-3">${reply3}</span>
				                </div>
				                <div class="d-flex align-items-center mb-2">
				                  <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">2</span><i class="ci-star-filled fs-xs ms-1"></i></div>
				                  <div class="w-100">
				                    <div class="progress" style="height: 4px;">
				                      <div class="progress-bar" role="progressbar" style="width: ${rate2}%; background-color: #fea569;" aria-valuenow="9" aria-valuemin="0" aria-valuemax="100"></div>
				                    </div>
				                  </div><span class="text-muted ms-3">${reply2}</span>
				                </div>
				                <div class="d-flex align-items-center">
				                  <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">1</span><i class="ci-star-filled fs-xs ms-1"></i></div>
				                  <div class="w-100">
				                    <div class="progress" style="height: 4px;">
				                      <div class="progress-bar bg-danger" role="progressbar" style="width: ${rate1}%;" aria-valuenow="4" aria-valuemin="0" aria-valuemax="100"></div>
				                    </div>
				                  </div><span class="text-muted ms-3">${reply1}</span>
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
									<div class="pharmacy-review pb-4 mb-4 border-bottom">
										<div class="d-flex mb-3">
											<div class="d-flex align-items-center me-4 pe-2">
												<img class="rounded-circle"
													src="${path}/resources/imgs/profile/0${item.mno}.png"
													width="50" alt="${item.name}">
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
										<c:if
											test="${loginMember != null && loginMember.mno == item.mno}">
											<form class="text-end" action="${path}/pharmacy/deleteReply"
												method="post">
												<input type="hidden" name="rno" value="${item.rno}"> <input
													type="hidden" name="phno" value="${item.phno}">
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
									<form class="needs-validation"
										action="${path}/pharmacy/writeReply" method="post" novalidate>
										<input type="hidden" name="phno" value="${pharmacy.phno}">
										<div class="mb-3">
											<label class="form-label" for="review-rating">평점<span class="text-danger">*</span></label>
						                      <select class="form-select" required id="review-rating" name="rating">
						                        <option value="">평점을 고르세요</option>
						                        <option value="5">5 점</option>
						                        <option value="4">4 점</option>
						                        <option value="3">3 점</option>
						                        <option value="2">2 점</option>
						                        <option value="1">1 점</option>
						                      </select>
						                      <div class="invalid-feedback">평점을 골라주세요</div>
						                    </div>
										<div class="mb-3">
					                      <label class="form-label" for="review-text">리뷰<span class="text-danger">*</span></label>
					                      <textarea class="form-control" rows="6" required id="review-text" name="content"></textarea>
					                      <div class="invalid-feedback">리뷰를 작성해주세요</div><small class="form-text text-muted">리뷰가 최소 50자를 넘어야 합니다.</small>
					                    </div>
										<c:if test="${loginMember == null}">
											<button class="btn btn-primary btn-shadow d-block w-100"
												disabled type="submit">리뷰 작성하기</button>
										</c:if>
										<c:if test="${loginMember != null}">
											<button class="btn btn-primary btn-shadow d-block w-100"
												type="submit">리뷰 작성하기</button>
										</c:if>
		
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>

</body>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	function movePage(page){
		searchForm.page.value = page;
		searchForm.submit();
	}
</script>







