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
		<br><br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
