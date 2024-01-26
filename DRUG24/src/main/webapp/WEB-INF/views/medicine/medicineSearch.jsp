<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="약 상세검색" name="title"/>
</jsp:include>

<section id="content">
	<div id='board-list-container'>		
		<!-- 검색창 시작 -->
    <!-- Page Title (Shop Alt)-->
    <!-- used for shop templates with filters on top-->
    <form name="searchForm" action="${path}/medicine/search" method="get">
    	<input type="hidden" name="page" value="1">
	
	    <div class="bg-dark pt-4 pb-5">
	      <div class="container pt-2 pb-3 pt-lg-3 pb-lg-4">
	        <div class="d-lg-flex justify-content-between pb-3">
	          <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
	            <nav aria-label="breadcrumb">
	              <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
	                <li class="breadcrumb-item"><a class="text-nowrap" href="${path}"><i class="ci-home"></i>Home</a>
	                </li>
	                <li class="breadcrumb-item text-nowrap"><a href="#">의약품 검색</a>
	                </li>
	                <li class="breadcrumb-item text-nowrap active" aria-current="page">의약품 상세검색</li>
	              </ol>
	            </nav>
	          </div>
	          <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
	            <h1 class="h3 text-light mb-0">의약품 상세검색</h1>
	          </div>
	        </div>
	      </div>
	    </div>
	    <div class="container pb-5 mb-2 mb-md-4">
	      <div class="row pt-4">
	        <!-- 검색창-->
	        <div class="card">
	          <div class="card-body px-4">
	            <div class="widget widget-categories">
	              <br>
	              <h3 class="search-title mb-grid-gutter">의약품 이름 검색</h3>
	              <div class="accordion mt-n1" id="medicine-search-name">
	                <!-- 의약품 이름 검색-->
	                <div class="accordion-item">
	                  <div class="accordion-body">
	                    <div class="widget widget-links widget-filter">
	                      <div class="searchMed-div input-group-sm mb-2">
	                        <input class="filter-search" type="text" name="searchValue" id="filter-search" placeholder="검색어를 입력해주세요" value="${param.searchValue}">
	                        <i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
	                        <div class="autocomplete"></div>
	                        <span class="span"></span>
	                        <script src="js/search.js"></script>
	                      </div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
		</form>
          <div class="col-lg-4 col-sm-6 mb-grid-gutter">
            <!-- 제약 회사명 검색-->
            <div class="accordion-item">
              <br>
              <h3 class="smallsearch-title" style="margin-left:1.5rem">제약회사</h3> <!-- to do: select count -->
              <div class="accordion-body">
                <div class="widget widget-links widget-filter">
                  <div class="input-group input-group-sm mb-2">
                    <input class="widget-filter-search form-control rounded-end" type="text" placeholder="검색"><i
                      class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
                  </div>
                  <ul class="widget-list widget-filter-list pt-1" style="height: 12rem;" data-simplebar
                    data-simplebar-auto-hide="false">
                    <li class="widget-list-item widget-filter-item"><a
                        class="widget-list-link d-flex justify-content-between align-items-center" href="#"><span
                          class="widget-filter-item-text">제약회사1</span><span class="fs-xs text-muted ms-3">232
                          제품</span></a></li>
                    
                  </ul>
                </div>
              </div>
            </div>
          </div>

          
          <div class="col-lg-4 col-sm-6 mb-grid-gutter">
            <!-- 의약품 종류 검색 -->
              <div class="med-classify">
                <br>
                    <h3 class="smallsearch-title">의약품 분류</h3>
                    <div class="input-group input-group-sm mb-2">
                      <input class="widget-filter-search form-control rounded-end" type="text" placeholder="검색"><i
                      class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
                    </div>
                    <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 6rem;"
                      data-simplebar data-simplebar-auto-hide="false">
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="normal-med">
                          <label class="form-check-label widget-filter-item-text" for="adidas">일반의약품</label>
                        </div><span class="fs-xs text-muted">425</span>
                      </li>
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="pro-med">
                          <label class="form-check-label widget-filter-item-text" for="ataylor">전문의약품</label>
                        </div><span class="fs-xs text-muted">15</span>
                      </li>
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="classify3-med">
                          <label class="form-check-label widget-filter-item-text" for="armani">의약품 분류3</label>
                        </div><span class="fs-xs text-muted">18</span>
                      </li>
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="classify4-med">
                          <label class="form-check-label widget-filter-item-text" for="banana">의약품 분류4</label>
                        </div><span class="fs-xs text-muted">103</span>
                      </li>
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="classify5-med">
                          <label class="form-check-label widget-filter-item-text" for="bilabong">의약품 분류5</label>
                        </div><span class="fs-xs text-muted">27</span>
                      </li>
                    </ul>
                  </div>
              </div>

          <div class="col-lg-4 col-sm-6 mb-grid-gutter">
            <br>
            <h3 class="smallsearch-title">주요 성분</h3>
            <div class="input-group input-group-sm mb-2">
              <input class="widget-filter-search form-control rounded-end" type="text" placeholder="검색"><i
                      class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
            </div>
            <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 12rem;" data-simplebar
              data-simplebar-auto-hide="false">
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="Cyclophosphamide">
                  <label class="form-check-label widget-filter-item-text" for="Cyclophosphamide">시클로포스파미드</label>
                </div><span class="fs-xs text-muted">34</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="Disodium">
                  <label class="form-check-label widget-filter-item-text" for="Disodium">디소디움아데노신-5-트리포스페이트</label>
                </div><span class="fs-xs text-muted">57</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="Gentamicin">
                  <label class="form-check-label widget-filter-item-text" for="Gentamicin">황산겐타마이신</label>
                </div><span class="fs-xs text-muted">198</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="Cefoxitine">
                  <label class="form-check-label widget-filter-item-text" for="Cefoxitine">세팔로틴나트륨</label>
                </div><span class="fs-xs text-muted">72</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-xl">
                  <label class="form-check-label widget-filter-item-text" for="size-xl">디클록사실린나트륨</label>
                </div><span class="fs-xs text-muted">46</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-39">
                  <label class="form-check-label widget-filter-item-text" for="size-39">코바마미드(코엔자임비12)</label>
                </div><span class="fs-xs text-muted">112</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-40">
                  <label class="form-check-label widget-filter-item-text" for="size-40">아미노카프론산</label>
                </div><span class="fs-xs text-muted">85</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-41">
                  <label class="form-check-label widget-filter-item-text" for="size-40">마행감석탕연조엑스</label>
                </div><span class="fs-xs text-muted">210</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-42">
                  <label class="form-check-label widget-filter-item-text" for="size-42">십미패독산연조엑스(7.88→1)</label>
                </div><span class="fs-xs text-muted">57</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-43">
                  <label class="form-check-label widget-filter-item-text" for="size-43">옥수수전분</label>
                </div><span class="fs-xs text-muted">30</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-44">
                  <label class="form-check-label widget-filter-item-text" for="size-44">유당수화물</label>
                </div><span class="fs-xs text-muted">61</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-45">
                  <label class="form-check-label widget-filter-item-text" for="size-45">목단피</label>
                </div><span class="fs-xs text-muted">23</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-46">
                  <label class="form-check-label widget-filter-item-text" for="size-46">복령</label>
                </div><span class="fs-xs text-muted">19</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-47">
                  <label class="form-check-label widget-filter-item-text" for="size-47">산수유</label>
                </div><span class="fs-xs text-muted">15</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-48">
                  <label class="form-check-label widget-filter-item-text" for="size-48">산약</label>
                </div><span class="fs-xs text-muted">12</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-49">
                  <label class="form-check-label widget-filter-item-text" for="size-49">택사</label>
                </div><span class="fs-xs text-muted">8</span>
              </li>
              <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="checkbox" id="size-50">
                  <label class="form-check-label widget-filter-item-text" for="size-50">숙지황</label>
                </div><span class="fs-xs text-muted">6</span>
              </li>
            </ul>
          </div>

        </div>
        <!--필터끝-->
        <div class="bg-light shadow-lg rounded-3 pb-4 mt-n5 mb-4"></div>
        <div class="row justify-content-center">
          <!-- Products list-->
		<c:if test="${empty list}">
			<tr>
				<td colspan="6">조회된 글이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${not empty list}">
			<c:forEach var="item" items="${list}">
				<section class="itemRow col-lg-12 pt-2">
					<div class="card product-card product-list mt-2 height: 200px;">
						<button class="btn-wishlist btn-sm" type="button"
							data-bs-toggle="tooltip" data-bs-placement="left"
							title="Add to wishlist">
							<i class="ci-heart"></i>
						</button>
						<div class="d-sm-flex align-items-center">
							<a class="product-list-thumb"
								href="${path}/medicine/view?dno=${item.dno}"><img
								src="${item.dimgurl}" alt="Product"></a>
							<div class="card-body py-2 row m-lg-2">
								<div class="col-5">
									<a class="product-meta d-block fs-xs pb-1 " href="#">${item.dcompany}</a>
									<h3 class="product-title fs-base">
										<a class="bold" href="${path}/medicine/view?dno=${item.dno}">${item.dname}</a>
									</h3>
									<div class="product-price mt-n3">
										<span class="text-accent">₩ ${item.price}</span>
									</div>
									<div class="star-rating star-rating-fill"
										style="width: ${item.dno/50000000}%; float: left;">
										<i class="star-rating-icon ci-star-filled active"></i> <i
											class="star-rating-icon ci-star-filled active"></i> <i
											class="star-rating-icon ci-star-filled active"></i> <i
											class="star-rating-icon ci-star-filled active"></i> <i
											class="star-rating-icon ci-star-filled active"></i>
									</div>

									<div class="star-rating" style="float: left;">
										<i class="star-rating-icon ci-star"></i> <i
											class="star-rating-icon ci-star"></i> <i
											class="star-rating-icon ci-star"></i> <i
											class="star-rating-icon ci-star"></i> <i
											class="star-rating-icon ci-star"></i>
									</div>
								</div>
								<div class="col-7  align-items-center row">
									<c:choose>
										<c:when test="${item.d1type == null}">
											<button class="col ms-1 warn-btn btn-dark">병용금기</button>
										</c:when>
										<c:otherwise>
											<button class="col ms-1 warn-btn btn-primary">병용금기</button>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${item.d2type == null}">
											<button class="col ms-1 warn-btn btn-dark">노인금기</button>
										</c:when>
										<c:otherwise>
											<button class="col ms-1 warn-btn btn-warning">노인금기</button>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${item.d3type == null}">
											<button class="col ms-1 warn-btn btn-dark">임부금기</button>
										</c:when>
										<c:otherwise>
											<button class="col ms-1 warn-btn btn-success">임부금기</button>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${item.d4type == null}">
											<button class="col ms-1 warn-btn btn-dark">용량주의</button>
										</c:when>
										<c:otherwise>
											<button class="col ms-1 warn-btn btn-info">용량주의</button>
										</c:otherwise>
									</c:choose>

									<c:choose>
										<c:when test="${item.d5type == null}">
											<button class="col ms-1 warn-btn btn-dark">연령금기</button>
										</c:when>
										<c:otherwise>
											<button class="col ms-1 warn-btn btn-accent">연령금기</button>
										</c:otherwise>
									</c:choose>

								</div>
							</div>
						</div>
					</div>
					<br>
			</c:forEach>
		</c:if>

		<!-- Pagination-->
		<script type="text/javascript">
			function movePage(page){
				searchForm.page.value = page;
				searchForm.submit();
			}
		</script>

		<hr class="my-3">
            <!-- ===================================================================   Pagination-->
            <!-- Pagination-->
		<nav class="d-flex justify-content-between pt-2 mb-4 "
			aria-label="Page navigation">
			
			<ul class="pagination">
				<li class="page-item">
				<a class="page-link" onclick="movePage(${pageInfo.prevPage});"> 
					<i class="ci-arrow-left me-2"></i>Prev</a></li>
			</ul>
			
			<ul class="pagination">
				<li class="page-item d-sm-none"><span
					class="page-link page-link-static">1 / 10</span></li>
				
				<!-- 10개의 페이지가 보이는 영역 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
					varStatus="status" step="1">
					<!-- 현재 페이지 일때 button을 다르게 표기 하기 위한 영역 -->
					<c:if test="${status.current == pageInfo.currentPage}">
						<li class="page-item active d-none d-sm-block" aria-current="page">
						<span class="page-link">${status.current}<span class="visually-hidden">(current)</span></span></li>
					</c:if>
					<c:if test="${status.current != pageInfo.currentPage}">
						<li class="page-item d-none d-sm-block"><a class="page-link"
							onclick="movePage(${status.current});">${status.current}</a></li>
					</c:if>
				</c:forEach>	
				
			</ul>
			
			<ul class="pagination">
				<li class="page-item">
					<a class="page-link" onclick="movePage(${pageInfo.nextPage});"
						aria-label="Next">Next<i class="ci-arrow-right ms-2"></i></a></li>
			</ul>
		</nav>
	</section>
          
          <script type="text/javascript"> 
            function scroll_follow(id){
              $(window).scroll(function()  //스크롤이 움직일때마다 이벤트 발생
              { 
                  var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
                  $(id).stop().animate({top:position+"px"}, 1000); //해당 오브젝트 위치값 재설정
               });
            }

            scroll_follow("#scroll");
            //스크롤이 생기도록 <br> 을 여러게 넣은 부분..
            
            $(document).ready(function(){ 
              for(var i=0; i<200; i++) 
              {
                $('#brr').html($('#brr').html() +"<br>" + i);
              } 
            });
            </script> 

          
          <!-- Sidebar with banners-->
          <!-- 가장 잘 팔린 의약품-->
          <aside class="col-lg-4 d-none d-lg-block">
            <div class="d-lg-block p-4 ms-auto w-100" id=scroll style="position:absolute;right:0;top:0; max-width: 15%; margin-top:20rem; background-color:white; border-radius: 2rem">
              <div class="widget mb-4">
                <h3 class="smallsearch-title">가장 잘 팔린 의약품</h3>
                <div class="d-flex align-items-center pb-2 border-bottom"><a class="d-block" href="shop-single-v1.html"><img
                      src="${path}/resources/imgs/default.jpg" width="64" alt="Product"></a>
                  <div class="ps-2">
                    <h6 class="widget-product-title"><a href="shop-single-v1.html">활명수</a></h6>
                    <div class="widget-product-meta"><span class="text-accent me-2">3,400원</small></span></div>
                  </div>
                </div>
                <div class="d-flex align-items-center py-2 border-bottom"><a class="d-block" href="shop-single-v1.html"><img
                      src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/151577167067000087" width="64" alt="Product"></a>
                  <div class="ps-2">
                    <h6 class="widget-product-title"><a href="shop-single-v1.html">에바치온캡슐(글루타티온)</a></h6>
                    <div class="widget-product-meta"><span class="text-accent me-2">14,500원</span></div>
                  </div>
                </div>
                <div class="d-flex align-items-center py-2 border-bottom"><a class="d-block" href="shop-single-v1.html"><img
                      src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/154609810414600027" width="64" alt="Product"></a>
                  <div class="ps-2">
                    <h6 class="widget-product-title"><a href="shop-single-v1.html">아로나민골드정</a></h6>
                    <div class="widget-product-meta"><span class="text-accent me-2">7,800원</span></div>
                  </div>
                </div>
                <div class="d-flex align-items-center py-2 border-bottom"><a class="d-block" href="shop-single-v1.html"><img
                      src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/1NOwp2F68-A" width="64" alt="Product"></a>
                  <div class="ps-2">
                    <h6 class="widget-product-title"><a href="shop-single-v1.html">대웅우루사연질캡슐</a></h6>
                    <div class="widget-product-meta"><span class="text-accent me-2">17,900원</span></div>
                  </div>
                </div>
                <div class="d-flex align-items-center py-2"><a class="d-block" href="shop-single-v1.html"><img
                      src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/151369816808500002" width="64" alt="Product"></a>
                  <div class="ps-2">
                    <h6 class="widget-product-title"><a href="shop-single-v1.html">액티피드정</a></h6>
                    <div class="widget-product-meta"><span class="text-accent me-2">12,400원</small></span></div>
                  </div>
                </div>
              </div>
            </div>

          </aside>
        </div>
      </div>
  </main>


	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
