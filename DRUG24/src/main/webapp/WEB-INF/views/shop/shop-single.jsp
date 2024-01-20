<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>


      <!-- Page Title-->
      <div class="page-title-overlap bg-dark pt-4">
        <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
          <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i class="ci-home"></i>Home</a></li>
                <li class="breadcrumb-item text-nowrap"><a href="#">Shop</a>
                </li>
                <li class="breadcrumb-item text-nowrap active" aria-current="page">상품 상세보기</li>
              </ol>
            </nav>
          </div>
          <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">${product.title}</h1>
          </div>
        </div>
      </div>
      <div class="container">
        <!-- Gallery + details-->
        <div class="bg-light shadow-lg rounded-3 px-4 py-3 mb-5">
          <div class="px-lg-3">
            <div class="row">
              <!-- Product gallery-->
              <div class="col-lg-7 pe-lg-0 pt-lg-4">
                <div class="product-gallery">
                  <div class="product-gallery-preview order-sm-2">
                    
                    <div class="product-gallery-preview-item active" id="first"><img class="image-zoom" src="${product.image}" data-zoom="img/shop/single/gallery/01.jpg" alt="Product image">
                      <div class="image-zoom-pane"></div>
                    </div>
                    

                  </div>
                  <div class="product-gallery-thumblist order-sm-1">
                    <a class="product-gallery-thumblist-item active" href="#first">
                      <img src="${product.image}" alt="Product thumb">
                    </a>
                  </div>
                  </div>
                  </div>
                  <!-- Product details-->
              <div class="col-lg-5 pt-4 pt-lg-0">
                <div class="product-details ms-auto pb-3">
                  <div class="d-flex justify-content-between align-items-center mb-2"><a href="#reviews" data-scroll>
                      <div class="star-rating">
						<c:forEach begin="1" end="${product.rating}">
	                    <i class="star-rating-icon ci-star-filled active"></i>
	                    </c:forEach>
	                    <c:forEach begin="1" end="${5 - product.rating}">
		                    <i class="star-rating-icon ci-star"></i>
	                    </c:forEach>                      
                      </div><span class="d-inline-block fs-sm text-body align-middle mt-1 ms-1">74 Reviews</span></a>
                    <button class="btn-wishlist me-0 me-lg-n3" type="button" data-bs-toggle="tooltip" title="Add to wishlist"><i class="ci-heart"></i></button>
                  </div>
                  <div class="mb-3"><span class="h3 fw-normal text-accent me-1">
                  <fmt:formatNumber value="${product.lprice}" pattern="#,###" />원
                  </span>
                    <span class="badge bg-danger badge-shadow align-middle mt-n2">Sale</span>
                  </div>

                  <form class="mb-grid-gutter" action="${path}/shop/addCart" method="post" >
                  	<input type="hidden" name="pno" value="${product.pno}">
                    <div class="mb-3 d-flex align-items-center">
                      <select class="form-select me-3" style="width: 5rem;">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                      </select>
                      <button class="btn btn-primary btn-shadow d-block w-100" type="submit"><i class="ci-cart fs-lg me-2"></i>Add to Cart</button>
                    </div>
                  </form>

                  <!-- Product panels-->
                  <div class="accordion mb-4" id="productPanels">
                    <div class="accordion-item">
                      <h3 class="accordion-header"><a class="accordion-button" href="#productInfo" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="productInfo"><i class="ci-announcement text-muted fs-lg align-middle mt-n1 me-2"></i>Product info</a></h3>
                      <div class="accordion-collapse collapse show" id="productInfo" data-bs-parent="#productPanels">
                        <div class="accordion-body">
                          <h6 class="fs-sm mb-2">${product.brand}</h6>
                          <ul class="fs-sm ps-4">
                            <li>메이커 : ${product.maker}</li>
                            <li>판매점 : ${product.mallName}</li>
                            <li>카테고리1 : ${product.category1}</li>
                            <li>카테고리2 : ${product.category2}</li>
                            <li>카테고리3 : ${product.category3}</li>
                            <li>카테고리4 : ${product.category4}</li>
                          </ul>
                          <h6 class="fs-sm mb-2">상세보기</h6>
                          <ul class="fs-sm ps-4 mb-0">
                            <li><a href="${product.link}">링크</a></li>
                          </ul>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h3 class="accordion-header"><a class="accordion-button collapsed" href="#shippingOptions" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="shippingOptions"><i class="ci-delivery text-muted lead align-middle mt-n1 me-2"></i>Shipping options</a></h3>
                      <div class="accordion-collapse collapse" id="shippingOptions" data-bs-parent="#productPanels">
                        <div class="accordion-body fs-sm">
                          <div class="d-flex justify-content-between border-bottom pb-2">
                            <div>
                              <div class="fw-semibold text-dark">Courier</div>
                              <div class="fs-sm text-muted">2 - 4 days</div>
                            </div>
                            <div>$26.50</div>
                          </div>
                          <div class="d-flex justify-content-between border-bottom py-2">
                            <div>
                              <div class="fw-semibold text-dark">Local shipping</div>
                              <div class="fs-sm text-muted">up to one week</div>
                            </div>
                            <div>$10.00</div>
                          </div>
                          <div class="d-flex justify-content-between border-bottom py-2">
                            <div>
                              <div class="fw-semibold text-dark">Flat rate</div>
                              <div class="fs-sm text-muted">5 - 7 days</div>
                            </div>
                            <div>$33.85</div>
                          </div>
                          <div class="d-flex justify-content-between border-bottom py-2">
                            <div>
                              <div class="fw-semibold text-dark">UPS ground shipping</div>
                              <div class="fs-sm text-muted">4 - 6 days</div>
                            </div>
                            <div>$18.00</div>
                          </div>
                          <div class="d-flex justify-content-between pt-2">
                            <div>
                              <div class="fw-semibold text-dark">Local pickup from store</div>
                              <div class="fs-sm text-muted">&mdash;</div>
                            </div>
                            <div>$0.00</div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="accordion-item">
                      <h3 class="accordion-header"><a class="accordion-button collapsed" href="#localStore" role="button" data-bs-toggle="collapse" aria-expanded="true" aria-controls="localStore"><i class="ci-location text-muted fs-lg align-middle mt-n1 me-2"></i>Find in local store</a></h3>
                      <div class="accordion-collapse collapse" id="localStore" data-bs-parent="#productPanels">
                        <div class="accordion-body">
                          <select class="form-select">
                            <option value>Select your country</option>
                            <option value="Argentina">Argentina</option>
                            <option value="Belgium">Belgium</option>
                            <option value="France">France</option>
                            <option value="Germany">Germany</option>
                            <option value="Spain">Spain</option>
                            <option value="UK">United Kingdom</option>
                            <option value="USA">USA</option>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Sharing-->
                  <label class="form-label d-inline-block align-middle my-2 me-3">Share:</label><a class="btn-share btn-twitter me-2 my-2" href="#"><i class="ci-twitter"></i>Twitter</a><a class="btn-share btn-instagram me-2 my-2" href="#"><i class="ci-instagram"></i>Instagram</a><a class="btn-share btn-facebook my-2" href="#"><i class="ci-facebook"></i>Facebook</a>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- Product description section 1-->
      </div>


      <!-- Reviews-->
      <div class="border-top border-bottom my-lg-3 py-5">
        <div class="container pt-md-2" id="reviews">
          <div class="row pb-3">
            <div class="col-lg-4 col-md-5">
              <h2 class="h3 mb-4">74 Reviews</h2>
              <div class="star-rating me-2"><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star-filled fs-sm text-accent me-1"></i><i class="ci-star fs-sm text-muted me-1"></i></div><span class="d-inline-block align-middle">4.1 Overall rating</span>
              <p class="pt-3 fs-sm text-muted">58 out of 74 (77%)<br>Customers recommended this product</p>
            </div>
            <div class="col-lg-8 col-md-7">
              <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">5</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                <div class="w-100">
                  <div class="progress" style="height: 4px;">
                    <div class="progress-bar bg-success" role="progressbar" style="width: 60%;" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div><span class="text-muted ms-3">43</span>
              </div>
              <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">4</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                <div class="w-100">
                  <div class="progress" style="height: 4px;">
                    <div class="progress-bar" role="progressbar" style="width: 27%; background-color: #a7e453;" aria-valuenow="27" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div><span class="text-muted ms-3">16</span>
              </div>
              <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">3</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                <div class="w-100">
                  <div class="progress" style="height: 4px;">
                    <div class="progress-bar" role="progressbar" style="width: 17%; background-color: #ffda75;" aria-valuenow="17" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div><span class="text-muted ms-3">9</span>
              </div>
              <div class="d-flex align-items-center mb-2">
                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">2</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                <div class="w-100">
                  <div class="progress" style="height: 4px;">
                    <div class="progress-bar" role="progressbar" style="width: 9%; background-color: #fea569;" aria-valuenow="9" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div><span class="text-muted ms-3">4</span>
              </div>
              <div class="d-flex align-items-center">
                <div class="text-nowrap me-3"><span class="d-inline-block align-middle text-muted">1</span><i class="ci-star-filled fs-xs ms-1"></i></div>
                <div class="w-100">
                  <div class="progress" style="height: 4px;">
                    <div class="progress-bar bg-danger" role="progressbar" style="width: 4%;" aria-valuenow="4" aria-valuemin="0" aria-valuemax="100"></div>
                  </div>
                </div><span class="text-muted ms-3">2</span>
              </div>
            </div>
          </div>
          <hr class="mt-4 mb-3">
          <div class="row pt-4">
            <!-- Reviews list-->
            <div class="col-md-7">
              <div class="d-flex justify-content-end pb-4">
              </div>

			<c:forEach var="item" items="${replyList}">
             <!-- Review-->
              <div class="product-review pb-4 mb-4 border-bottom">
                <div class="d-flex mb-3">
                  <div class="d-flex align-items-center me-4 pe-2"><img class="rounded-circle" src="${path}/resources/img/shop/reviews/0${loginMember.mno}.jpg" width="50" alt="Rafael Marquez">
                    <div class="ps-3">
                      <h6 class="fs-sm mb-0">${item.name}</h6>
                      <span class="fs-ms text-muted">
                      <fmt:formatDate type="both" value="${item.createDate}"/>
                      </span>
                    </div>
                  </div>
                  <div>
                    <div class="star-rating">
                    <c:forEach begin="1" end="${item.score}">
	                    <i class="star-rating-icon ci-star-filled active"></i>
                    </c:forEach>
                    <c:forEach begin="1" end="${5 - item.score}">
	                    <i class="star-rating-icon ci-star"></i>
                    </c:forEach>
                    </div>
                  </div>
                </div>
                <p class="fs-md mb-2">${item.content }</p>
                 <c:if test="${loginMember != null && loginMember.mno == item.mno}">
                	<form class="text-end" action="${path}/shop/deleteReply" method="post">
                		<input type="hidden" name="rno" value="${item.rno}">
                		<input type="hidden" name="pno" value="${item.pno}">
                		<button class="btn">삭제</button>
                	</form>
                </c:if>
              </div>
			</c:forEach>              



            </div>


            <!-- Leave review form-->
            <div class="col-md-5 mt-2 pt-4 mt-md-0 pt-md-0">
              <div class="bg-secondary py-grid-gutter px-grid-gutter rounded-3">
                <h3 class="h4 pb-2">리뷰 쓰기</h3>
                <form class="needs-validation" action="${path}/shop/writeReply" method="post" novalidate>
                	<input type="hidden" name="pno" value="${product.pno}">
                  <div class="mb-3">
                    <label class="form-label" for="review-rating">Rating<span class="text-danger">*</span></label>
                    <select name="score" class="form-select" required id="review-rating">
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
                    <label class="form-label" for="review-text">Review<span class="text-danger">*</span></label>
                    <textarea name="content" class="form-control" rows="6" required id="review-text"></textarea>
                    <div class="invalid-feedback">Please write a review!</div><small class="form-text text-muted">Your review must be at least 50 characters.</small>
                  </div>
                <c:if test="${loginMember == null}">
                  <button class="btn btn-primary btn-shadow d-block w-100" disabled type="submit">Submit a Review</button>
                </c:if>  
                <c:if test="${loginMember != null}">
                  <button class="btn btn-primary btn-shadow d-block w-100" type="submit">Submit a Review</button>
                </c:if>  
                
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- Product carousel (Style with)-->
      <div class="container pt-5">
        <h2 class="h3 text-center pb-4">Style with</h2>
        <div class="tns-carousel tns-controls-static tns-controls-outside">
          <div class="tns-carousel-inner" data-carousel-options="{&quot;items&quot;: 2, &quot;controls&quot;: true, &quot;nav&quot;: false, &quot;responsive&quot;: {&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2, &quot;gutter&quot;: 18},&quot;768&quot;:{&quot;items&quot;:3, &quot;gutter&quot;: 20}, &quot;1100&quot;:{&quot;items&quot;:4, &quot;gutter&quot;: 30}}}">
          
          ${plist1}
          <c:forEach var="item" items="${plist1}">
            <!-- Product-->
            <div>
              <div class="card product-card card-static">
                <button class="btn-wishlist btn-sm" type="button" data-bs-toggle="tooltip" data-bs-placement="left" title="Add to wishlist"><i class="ci-heart"></i></button>
                <a class="card-img-top d-block overflow-hidden" style="width: 200px" href="${path}/shop/product?pno=${item.pno}"><img src="${item.image}" alt="Product"></a>
                <div class="card-body py-2"><a class="product-meta d-block fs-xs pb-1" href="${path}/shop/product?pno=${item.pno}">${item.brand}</a>
                  <h3 class="product-title fs-sm"><a href="${path}/shop/product?pno=${item.pno}">${item.title}</a></h3>
                  <div class="d-flex justify-content-between">
                    <div class="product-price"><span class="text-accent">
                    <fmt:formatNumber value="${item.lprice}" pattern="#,###" />원
                    </span></div>
                    <div class="star-rating"><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star-filled active"></i><i class="star-rating-icon ci-star"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </c:forEach>
            
            
          </div>
        </div>
      </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>