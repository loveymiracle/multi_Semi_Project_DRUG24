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
	                    <div class="widget widget-links">
	                      <div class="searchMed-div input-group-sm mb-2">
	                        <input class="filter-search" type="text" name="searchValue" id="filter-search" placeholder="검색어를 입력해주세요" value="${param.searchValue}">
	                        <i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
	                        <div class="autocomplete"></div>
	                        <span class="span"></span>
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
            <!-- 의약품 종류 검색 -->
              <div class="med-classify">
                <br>
                    <h3 class="smallsearch-title">제약회사</h3>
                    <div class="input-group input-group-sm mb-2">
                      <input class="widget-filter-search form-control rounded-end" name="searchValue1" type="text" placeholder="검색" value="${param.searchValue1}">
                      <i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
                    </div>
                    <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 6rem;"
                      data-simplebar data-simplebar-auto-hide="false"><li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">태극제약(주)</label>
	                        </div><span class="fs-xs text-muted">118</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">일양약품(주)</label>
	                        </div><span class="fs-xs text-muted">101</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">조아제약(주)</label>
	                        </div><span class="fs-xs text-muted">98</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)알피바이오</label>
	                        </div><span class="fs-xs text-muted">97</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)유한양행</label>
	                        </div><span class="fs-xs text-muted">95</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">신일제약(주)</label>
	                        </div><span class="fs-xs text-muted">84</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)에이프로젠바이오로직스</label>
	                        </div><span class="fs-xs text-muted">82</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">일동제약(주)</label>
	                        </div><span class="fs-xs text-muted">80</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)마더스제약</label>
	                        </div><span class="fs-xs text-muted">69</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">경남제약(주)</label>
	                        </div><span class="fs-xs text-muted">66</span>
	                     </li>
						<li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">태극제약(주)</label>
	                        </div><span class="fs-xs text-muted">118</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">일양약품(주)</label>
	                        </div><span class="fs-xs text-muted">101</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">조아제약(주)</label>
	                        </div><span class="fs-xs text-muted">98</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)알피바이오</label>
	                        </div><span class="fs-xs text-muted">97</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)유한양행</label>
	                        </div><span class="fs-xs text-muted">95</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">신일제약(주)</label>
	                        </div><span class="fs-xs text-muted">84</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)에이프로젠바이오로직스</label>
	                        </div><span class="fs-xs text-muted">82</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">일동제약(주)</label>
	                        </div><span class="fs-xs text-muted">80</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">(주)마더스제약</label>
	                        </div><span class="fs-xs text-muted">69</span>
	                     </li>
	                     <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
	                        <div class="form-check">
	                          <input class="form-check-input" type="radio" name="search1">
	                          <label class="form-check-label widget-filter-item-text">경남제약(주)</label>
	                        </div><span class="fs-xs text-muted">66</span>
	                     </li>
                       
                    </ul>
                  </div>
              </div>

          
          <div class="col-lg-4 col-sm-6 mb-grid-gutter">
            <!-- 의약품 종류 검색 -->
              <div class="med-classify">
                <br>
                    <h3 class="smallsearch-title">의약품 분류</h3>
                    <div class="input-group input-group-sm mb-2">
                      <input class="widget-filter-search form-control rounded-end" name="searchValue2" type="text" placeholder="검색" value="${param.searchValue2}">
                      <i class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
                    </div>
                    <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 6rem;"
                      data-simplebar data-simplebar-auto-hide="false">
                      
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="search2" id="normal-med">
                          <label class="form-check-label widget-filter-item-text" for="adidas">일반의약품</label>
                        </div><span class="fs-xs text-muted">425</span>
                      </li>
                      <li class="widget-filter-item d-flex justify-content-between align-items-center mb-1">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="search2" id="pro-med">
                          <label class="form-check-label widget-filter-item-text" for="ataylor">전문의약품</label>
                        </div><span class="fs-xs text-muted">15</span>
                      </li>
                      
                    </ul>
                  </div>
              </div>

          <div class="col-lg-4 col-sm-6 mb-grid-gutter">
            <br>
            <h3 class="smallsearch-title">약 효능 검색</h3>
            <div class="input-group input-group-sm mb-2">
              <input class="widget-filter-search form-control rounded-end" name="searchValue3" type="text" placeholder="검색" value="${param.searchValue3}"><i
                      class="ci-search position-absolute top-50 end-0 translate-middle-y fs-sm me-3"></i>
            </div>
            <ul class="widget-list widget-filter-list list-unstyled pt-1" style="max-height: 12rem;" data-simplebar
              data-simplebar-auto-hide="false">

              <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">기침</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">가래</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">육체피로</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">설사</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">체함</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">멀미</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">위산과다</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">위부불쾌함</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">속쓰림</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">임신</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">소화불량</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">약물중독</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">두통</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">치통</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">변비</label>
                </div> </li> <li class="widget-filter-item d-flex justify-content-between align-items-center">
                <div class="form-check">
                  <input class="form-check-input" type="radio" name="search3">
                  <label class="form-check-label widget-filter-item-text">인후통</label>
                </div> </li>
              
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
							<a class="product-list-thumb" href="${path}/medicine/view?dno=${item.dno}">
							<c:choose>
								<c:when test="${!empty item.dimgurl}">
									<img src="${item.dimgurl}" alt="Product"></a>
								</c:when>
								<c:otherwise>
									<img src="${path}/resources/imgs/default.jpg" alt="Product"></a>
								</c:otherwise>
							</c:choose>
					
							<div class="card-body py-2 row m-lg-2">
								<div class="col-5">
									<a class="product-meta d-block fs-xs pb-1 " href="#">${item.dcompany}</a>
									<h3 class="product-title fs-base">
										<a class="bold" href="${path}/medicine/view?dno=${item.dno}">${item.dname}</a>
									</h3>
									<div style="position:relative;">
										<div class="star-rating star-rating-fill" style="position:absolute; float: left;">
											<i class="star-rating-icon ci-star-filled active"></i>
											<c:if test="${item.price > 10000}">
												<i class="star-rating-icon ci-star-filled active"></i> 
											</c:if> 
											<c:if test="${item.price > 20000}">
												<i class="star-rating-icon ci-star-filled active"></i> 
											</c:if>
											<c:if test="${item.price > 30000}">
												<i class="star-rating-icon ci-star-filled active"></i> 
											</c:if> 
											<c:if test="${item.price > 40000}">
												<i class="star-rating-icon ci-star-filled active"></i> 
											</c:if> 
										</div>
	
										<div class="star-rating" style="position:absolute; float: left;">
											<i class="star-rating-icon ci-star"></i> <i
												class="star-rating-icon ci-star"></i> <i
												class="star-rating-icon ci-star"></i> <i
												class="star-rating-icon ci-star"></i> <i
												class="star-rating-icon ci-star"></i>
										</div>
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

<<<<<<< HEAD
          
          <!-- Sidebar with banners-->
=======
          <!--  가장 잘팔린의약품
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
          -->
          
>>>>>>> branch 'master' of https://github.com/loveymiracle/mulProject.git
        </div>
      </div>
  </main>


	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
