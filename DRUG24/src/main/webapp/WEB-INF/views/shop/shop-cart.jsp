<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<style>
	.btn_submit{
		background-image:url(${path}/resources/imgs/pay/payR.png);
		background-repeat: no-repeat;
		width: 240px;
		height: 90px;
		border: 0px;
	}
	.notice_box{
		margin-top: 5px;
		padding: 22px 15px 23px;
	}
	.card_promotion{
		margin-top: 5px;
		padding: 22px 15px 23px;
	}
	.thumb_wrap{
		width: 80px;
		height: 20px;
		margin-right: 12px;
		text-align: center;
		flex-shrink: 0;
	}
	.no_dot{
		list-style: none;
	}
</style>

		<!-- Page Title-->
		<div class="page-title-overlap bg-dark pt-4">
			<div class="container d-lg-flex justify-content-between py-2 py-lg-3">
				<div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
					<nav aria-label="breadcrumb">
						<ol
							class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
							<li class="breadcrumb-item"><a class="text-nowrap"
								href="${path}"><i class="ci-home"></i>Home</a></li>
							<li class="breadcrumb-item text-nowrap"><a
								href="${path}/shop/main">Market</a></li>
							<li class="breadcrumb-item text-nowrap active" aria-current="page">Cart</li>
						</ol>
					</nav>
				</div>
				<div class="order-lg-1 pe-lg-4 text-center text-lg-start">
					<h1 class="h3 text-light mb-0">My Cart</h1>
				</div>
			</div>
		</div>
		<div class="container pb-5 mb-2 mb-md-4">
			<div class="row">
				<!-- List of items-->
				<section class="col-lg-8">
					<div
						class="d-flex justify-content-between align-items-center pt-3 pb-4 pb-sm-5 mt-1">
						<h2 class="h6 text-light mb-0">Products</h2>
						<a class="btn btn-outline-primary btn-sm ps-2"
							href="${path}/shop/main"><i class="ci-arrow-left me-2"></i>Continue
							shopping</a>
					</div>
		
					<script type="text/javascript">
						cartArray = [];
						<c:forEach var="item" items="${list}">
						temp = {
							pno : ${item.pno},		
							title : '${item.title}',		
							lprice :${item.lprice},
							amount : ${item.amount},
							check : true,
						}
						cartArray.push(temp);
						</c:forEach>
						console.log('cartArray : ' + cartArray);
					</script>
					
		
					<c:forEach var="item" items="${list}">
						<!-- Item-->
						<div
							class="d-sm-flex justify-content-between align-items-center my-2 pb-3 border-bottom">
							<input type="checkbox" class="cart_checkbox" checked="checked" onchange="changeCheckbox(this);" pno="${item.pno}">
							<div
								class="d-block d-sm-flex align-items-center text-center text-sm-start">
								<a class="d-inline-block flex-shrink-0 mx-auto me-sm-4"
									href="${path}/shop/product?pno=${item.pno}"><img
									src="${item.image }" width="160" alt="Product"></a>
								<div class="pt-2">
									<h3 class="product-title fs-base mb-2">
										<a href="${path}/shop/product?pno=${item.pno}">${item.title }</a>
									</h3>
									<div class="fs-lg text-accent pt-2">
										<fmt:formatNumber value="${item.lprice }" pattern="#,###"/>원
									</div>
								</div>
							</div>
							<div
								class="pt-2 pt-sm-0 ps-sm-3 mx-auto mx-sm-0 text-center text-sm-start"
								style="max-width: 9rem;">
								<label class="form-label" for="quantity1">Quantity</label> 
								<input
									class="form-control" type="number" id="quantity1" min="1"
									value="${item.amount}" pno="${item.pno}" onchange="changeAmount(this);">
								<button class="btn btn-link px-0 text-danger" type="button"
									onclick="cartDelete('${item.pno}', '/shop/cart');">
									<i class="ci-close-circle me-2"></i><span class="fs-sm">Remove</span>
								</button>
							</div>
						</div>
					</c:forEach>
		
					<script type="text/javascript">
						function cartDelete(pno, url) {
							location.href = '${path}/shop/deleteCart?pno=' + pno
									+ '&url=' + url;
						}
						
						$(function(){
							Total();
						});
						
						
						$(".cart_checkbox").on("change", function(){
							Total($(".d-sm-flex"));
						});
						
						function changeCheckbox(obj){
							for(var i = 0; i < cartArray.length; i++){
								if(cartArray[i].pno == obj.getAttribute('pno')){
									cartArray[i].check = obj.checked;
								}
							}					
							console.log(cartArray);
							Total();
						}
						
						function changeAmount(obj){
							for(var i = 0; i < cartArray.length; i++){
								if(cartArray[i].pno == obj.getAttribute('pno')){
									cartArray[i].amount = obj.value;
								}
							}					
							console.log(cartArray);
							Total();
						}
						
						
						
						function Total(){
							var totalPrice = 0;
							var payStr = '';
							var quantity = 0;
							for(var i = 0; i < cartArray.length; i++){
								if(cartArray[i].check == true){
									payStr += cartArray[i].title+',';
									totalPrice += cartArray[i].amount * cartArray[i].lprice;
									quantity++;
								}
							}
							
							if(payStr.endsWith(',')){
								payStr = payStr.slice(0, -1);
							}
							
							var formattedPrice = new Intl.NumberFormat('ko-KR', { style : 'currency', currency: 'KRW'}).format(totalPrice);
							$("#totalfee").html(formattedPrice);
							
							$("#item_name").val(payStr);
							$("#total_amount").val(totalPrice);
							$("#quantity").val(quantity);
						}
						
						
						
					</script>
		
		
				</section>
				<!-- Sidebar-->
				<aside class="col-lg-4 pt-4 pt-lg-0 ps-xl-5">
					<div class="bg-white rounded-3 shadow-lg p-4">
						<form action="${path}/kakaoPay" method="post">
							<div class="py-2 px-xl-2">
								<div class="text-center mb-4 pb-3 border-bottom">
									<h2 class="h6 mb-3 pb-1">총 결제 금액</h2>
									<h3 class="fw-normal">
										<span id="totalfee">원</span>
									</h3>
									<input type="hidden" name="item_name" id="item_name" value="영양제">
									<input type="hidden" name="total_amount" id="total_amount" value="5000">
									<input type="hidden" name="quantity" id="quantity" value="1">
									<input type="submit" value="" class="btn_submit">
								</div>
								<div class="mb-3 mb-4">
									<label class="form-label mb-3" for="order-comments"><span
										class="badge bg-info fs-xs me-2">Note</span><span
										class="fw-medium">Additional comments</span></label>
									<textarea class="form-control" rows="6" id="order-comments"></textarea>
								</div>
								<div>
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
							</div>
						</form>
					</div>
				</aside>
			</div>
		</div>
		<section>
		<div class="container" style="background-color:#eee;">
			<ul class="notice_box">
				<li>장바구니 상품은  <b style="color:red">최대 30일간 저장</b> 됩니다.</li>
				<li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
				<li>오늘 출발 정보는 판매자가 설정한 정보에 의해 제공되며, 물류위탁 상품인 경우 물류사의 사정에 따라 실제와 다를 수 있습니다.</li>
				<li>일부 상품의 경우 카드 할부기간이 카드사 제공 기간보다 적게 제공될 수 있습니다.</li>
			</ul>
		</div>
		</section>
		<section>
			<div class="container" style="background-color:#eee;">
				<div class="card_promotion">
					<strong class="promotion_title">지금 카카오 페이 충전하면 가능한 카드 혜택</strong>
					<div class="promotion_content d-flex align-items-center">
						<div class="thumb_wrap">
							<img src="${path}/resources/imgs/pay/sh.png" alt="card">
						</div>
						<div class="card_info">
							<ul class="no_dot"><b>신한카드</b>
								<li>200,000원 이상 결제 시 최대 3% 추가 할인</li>
								<li>진행기간 : 2024.01.23 00:00 ~ 2024.01.31 23:59</li>
								<li>참여대상 : DRUG24 회원 대상</li>
							</ul>
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

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
