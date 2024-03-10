<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="약 View페이지" name="title"/>
</jsp:include>

<section id="content">
	<div id='board-list-container'>		
	
	    <div class="page-title-overlap bg-accent pt-4">
        <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
          <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i class="ci-home"></i>Home</a></li>
                <li class="breadcrumb-item text-nowrap"><a href="marketplace-category.html">약 상세검색</a>
                </li>
                <li class="breadcrumb-item text-nowrap active" aria-current="page">약 제품 상세정보</li>
              </ol>
            </nav>
          </div>
          <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">상세 페이지</h1>
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
                <h2 class="h3 mb-0 pt-2" id="productName">${medicine.dname}</h2>
                <br>

                <!-- 제품 이미지 (백엔드 수신 필요)-->
                <c:choose>
					<c:when test="${!empty medicine.dimgurl}">
						<div class="gallery"><a class="gallery-item rounded-3 mb-grid-gutter"><img src="${medicine.dimgurl}" alt="Gallery preview"></a>
					</c:when>
					<c:otherwise>
						<div class="gallery"><a class="gallery-item rounded-3 mb-grid-gutter"><img src="${path}/resources/imgs/default.jpg" alt="Gallery preview"></a>
					</c:otherwise>
				</c:choose>
                
                </div>
                <!-- Wishlist + Sharing-->
                <div class="d-flex flex-wrap justify-content-between align-items-center border-top pt-3">
                  <div class="py-2"><i class="ci-share-alt fs-lg align-middle text-muted me-2"></i><a class="btn-social bs-outline bs-facebook bs-sm ms-2" href="#"><i class="ci-facebook"></i></a><a class="btn-social bs-outline bs-twitter bs-sm ms-2" href="#"><i class="ci-twitter"></i></a><a class="btn-social bs-outline bs-pinterest bs-sm ms-2" href="#"><i class="ci-pinterest"></i></a><a class="btn-social bs-outline bs-instagram bs-sm ms-2" href="#"><i class="ci-instagram"></i></a></div>
                </div>
              </div>
            </section>
            <!-- Sidebar-->
            <aside class="col-lg-4 ps-xl-5" style="margin-top:10rem">
              <hr class="d-lg-none">
              <div class="bg-white h-100 p-4 ms-auto border-start">

                <div class="px-lg-2">
<<<<<<< HEAD
                  <div class="accordion-header d-flex justify-content-between align-items-center py-3">
                    <div class="form-check" data-bs-toggle="collapse" data-bs-target="#standard-license">
                      <input class="form-check-input" type="radio" name="license" id="license-std" checked>
                      <label class="form-check-label fw-medium text-dark" for="license-std">${medicine.dname}</label>
                    </div>
                  </div>



                  <ul class="list-unstyled fs-sm">

                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">제조사</span><span class="text-muted">${medicine.dcompany}</span></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">분류</span><span class="text-muted">${medicine.dotc_code}</span></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">주요성분</span><a class="product-meta" href="#">건조수산화알루미늄겔</a></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">유통기간</span><span class="text-muted">제조일로부터 24개월</span></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium">제형</span><span class="text-muted">타블렛</span></li>


                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium fs-5">판매처</span><span class="text-muted">${medicine.dcompany}</span></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium fs-5">분류</span><span class="text-muted">${medicine.dotc_code}</span></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium fs-5">주요성분</span><a class="product-meta" href="#">건조수산화알루미늄겔</a></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium fs-5">유통기간</span><span class="text-muted">제조일로부터 36개월</span></li>
                    <li class="d-flex justify-content-between mb-3 pb-3 border-bottom"><span class="text-dark fw-medium fs-5">제형</span><span class="text-muted">밀폐용기</span></li>


                  </ul>
                </div>
              </div>
            </aside>
          </div>
        </div>
      </section>
      <!-- Product description + Reviews + Comments-->
      <section class="container mb-4 mb-lg-5">
        <!-- Nav tabs-->
        <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item"><a class="nav-link p-4 active" href="#details" data-bs-toggle="tab" role="tab">제품 상세설명</a></li>
          <li class="nav-item"><a class="nav-link p-4" href="#reviews" data-bs-toggle="tab" role="tab">리뷰</a></li>
        </ul>
        <div class="tab-content pt-2">
          <!-- Product details tab-->
          <div class="tab-pane fade show active" id="details" role="tabpanel">
            <div class="row">
              <div class="col-lg-8">
                <h3 class="h5 pt-2">효능 효과</h3>
                <ul class="fs-md">
                  <li>${medicine.deffect}</li>
                </ul>

                <h3 class="h5 pt-2">사용법</h3>
                <ul class="fs-md">
                  <li>${medicine.dusage}</li>
                </ul>

                <h3 class="h5 pt-2">사용상 주의사항</h3>
                <ul class="fs-md">
                  <li style="list-style-type:none;"> ${medicine.dwarn}</li>
                  <br>
                </ul>

                <h3 class="h5 pt-2">상호작용</h3>
                <ul class="fs-md">
                  <li> ${medicine.dinteraction}</li>
                  <br>
                </ul>

                <h3 class="h5 pt-2">부작용</h3>
                <ul class="fs-md">
                  <li> ${medicine.dnegative}</li>
                </ul>
                
                <h3 class="h5 pt-2">보관법</h3>
                <ul class="fs-md">
                  <li> ${medicine.dsave}</li>
                </ul>

              </div>
            </div>
          </div>
          <!-- Reviews tab-->
          <div class="tab-pane fade" id="reviews" role="tabpanel">
            <!-- Reviews-->
            <div class="row pt-2 pb-3">
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
                  <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">5</span><i class="ci-star-filled fs-xs ms-1"></i></div>
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
            <div class="row py-4">

               
                <!-- Review-->
                	<div class="col-md-7">
                		<c:forEach var="item" items="${replyList}">
								<!-- Review-->
								<div class="product-review pb-4 mb-4 border-bottom">
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
									<c:if test="${loginMember != null && loginMember.mno == item.mno}">
										<form class="text-end" action="${path}/medicine/deleteReply" method="post">
											<input type="hidden" name="rno" value="${item.rno}"> 
											<input type="hidden" name="dno" value="${item.dno}">
											<button type="submit"  class="btn">삭제</button>
										</form>
									</c:if>
								</div>
							</c:forEach>
						</div>
              <!-- 리뷰 작성하기 writereply-->
              <div class="col-md-5 mt-2 pt-4 mt-md-0 pt-md-0">
                <div class="bg-secondary py-grid-gutter px-grid-gutter rounded-3">
                  <h3 class="h4 pb-2">리뷰 작성하기</h3>
                  <form class="needs-validation" action="${path}/medicine/writeReply" method="post" novalidate>
                    <input type="hidden" name="dno" value="${medicine.dno}">

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
          
      </section>
      <!-- Related products carousel-->
      <section class="container mb-5 pb-lg-3">
        <div class="d-flex flex-wrap justify-content-between align-items-center border-bottom pb-4 mb-4">
          <h2 class="h3 mb-0 pt-2">인기 제품</h2>
          <div class="pt-2"><a class="btn btn-outline-accent btn-sm" href="marketplace-category.html">더보기<i class="ci-arrow-end ms-1 me-n1"></i></a></div>
        </div>
        <!-- Carousel-->
        <div class="tns-carousel">
          <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 2, &quot;gutter&quot;: 16, &quot;controls&quot;: false, &quot;nav&quot;: true, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2 },&quot;768&quot;:{&quot;items&quot;:3}, &quot;992&quot;:{&quot;items&quot;:4}}}">
            <!-- Product-->
            <div>
              <div class="card product-card-alt">
                <div class="product-thumb">
                  <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                  <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                  </div><a class="product-thumb-overlay" href="#"></a><img src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/151577167067000087" alt="Product">
                </div>
                <div class="card-body">
                  <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                    <div class="text-muted fs-xs me-1">조아제약(주)</a></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i>
                    </div>
                  </div>
                  <h3 class="product-title fs-sm mb-2"><a href="#">에바치온캡슐(글루타티온)</a></h3>
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                  </div>
                </div>
              </div>
            </div>
            <!-- Product-->
            <div>
              <div class="card product-card-alt">
                <div class="product-thumb">
                  <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                  <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                  </div><a class="product-thumb-overlay" href="#"></a><img src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/154609810414600027" alt="Product">
                </div>
                <div class="card-body">
                  <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                    <div class="text-muted fs-xs me-1">일동제약(주)</a></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-half active"></i><i class="star-rating-icon ci-star"></i>
                    </div>
                  </div>
                  <h3 class="product-title fs-sm mb-2"><a href="#">아로나민골드정</a></h3>
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                  </div>
                </div>
              </div>
            </div>
            <!-- Product-->
            
            <!-- Product-->
            <div>
              <div class="card product-card-alt">
                <div class="product-thumb">
                  <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                  <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                  </div><a class="product-thumb-overlay" href="#"></a><img src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/147427297681200156" alt="Product">
                </div>
                <div class="card-body">
                  <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                    <div class="text-muted fs-xs me-1">명문제약(주)</a></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-half active"></i><i class="star-rating-icon ci-star"></i>
                    </div>
                  </div>
                  <h3 class="product-title fs-sm mb-2"><a href="#">에이스린장용정(아스피린)</a></h3>
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                  </div>
                </div>
              </div>
            </div>
            <!-- Product-->
            
            <!-- Product-->
            <div>
              <div class="card product-card-alt">
                <div class="product-thumb">
                  <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                  <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                  </div><a class="product-thumb-overlay" href="#"></a><img src="https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/147427297681200156" alt="Product">
                </div>
                <div class="card-body">
                  <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                    <div class="text-muted fs-xs me-1">일동제약(주)제이더블유중외제약(주)</a></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-half active"></i><i class="star-rating-icon ci-star"></i>
                    </div>
                  </div>
                  <h3 class="product-title fs-sm mb-2"><a href="#">크린조</a></h3>
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                  </div>
                </div>
              </div>
            </div>
            <!-- Product-->
            <div>
              <div class="card product-card-alt">
                <div class="product-thumb">
                  <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                  <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                  </div><a class="product-thumb-overlay" href="#"></a><img src="img/marketplace/products/08.jpg" alt="Product">
                </div>
                <div class="card-body">
                  <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                    <div class="text-muted fs-xs me-1">by <a class="product-meta fw-medium" href="#">pixels </a>in <a class="product-meta fw-medium" href="#">Graphics</a></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-half active"></i>
                    </div>
                  </div>
                  <h3 class="product-title fs-sm mb-2"><a href="#">Business Card Branding Mockup</a></h3>
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                    <div class="fs-sm me-2"><i class="ci-download text-muted me-1"></i>316<span class="fs-xs ms-1">Sales</span></div>
                    <div class="bg-faded-accent text-accent rounded-1 py-1 px-2">$17.<small>00</small></div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Product-->
            <div>
              <div class="card product-card-alt">
                <div class="product-thumb">
                  <button class="btn-wishlist btn-sm" type="button"><i class="ci-heart"></i></button>
                  <div class="product-card-actions"><a class="btn btn-light btn-icon btn-shadow fs-base mx-2" href="#"><i class="ci-eye"></i></a>
                    <button class="btn btn-light btn-icon btn-shadow fs-base mx-2" type="button"><i class="ci-cart"></i></button>
                  </div><a class="product-thumb-overlay" href="#"></a><img src="img/marketplace/products/07.jpg" alt="Product">
                </div>
                <div class="card-body">
                  <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                    <div class="text-muted fs-xs me-1">by <a class="product-meta fw-medium" href="#">pixels </a>in <a class="product-meta fw-medium" href="#">Graphics</a></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star"></i>
                    </div>
                  </div>
                  <h3 class="product-title fs-sm mb-2"><a href="#">Gravity Device Mockups (PSD)</a></h3>
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                    <div class="fs-sm me-2"><i class="ci-download text-muted me-1"></i>234<span class="fs-xs ms-1">Sales</span></div>
                    <div class="bg-faded-accent text-accent rounded-1 py-1 px-2">$16.<small>00</small></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
   
  </div>
 </section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<script type="text/javascript">
	function movePage(page){
		searchForm.page.value = page;
		searchForm.submit();
	}
</script>
