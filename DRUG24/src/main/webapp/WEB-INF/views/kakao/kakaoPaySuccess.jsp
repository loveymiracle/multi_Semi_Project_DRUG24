<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="카카오 페이 데모" name="title"/>
</jsp:include>

<section id="container">
	
	카카오페이 결제가 정상적으로 완료되었습니다.
	 
	결제일시: ${info.approved_at}<br>
	주문번호: ${info.partner_order_id}<br>
	상품명:   ${info.item_name}<br>
	상품수량: ${info.quantity}<br>
	결제금액: ${info.amount.total}<br>
	결제방법: ${info.payment_method_type}<br>
	 
	 

</section>
<br><br><br><br>
<h3>구매해주셔서 감사합니다.</h3>
<section class="bg-position-center mt-n5 mb-5"
				style="background-image: url(${path}/resources/imgs/pay/paysu.png);">
				<div class="pb-lg-1 mb-lg-3">
					<div class="container py-lg-5 my-lg-5">
						<div class="row mb-4 mb-sm-5">
							<div class="col-lg-7 col-md-9 text-center text-sm-start">
								<h1 class="text-heading lh-base" style="color: white;">
									<span class='fw-light blodFont'>약 24,000 개의 의약품을</span> 안전하게 확인하고
									복용하세요! 의약품은 DRUG24
								</h1>
								<h2 class="h5 text-heading fw-light blodFont" style="color: white;">Check and take
									your medicine safely on this site. DRUG24 for you!</h2>
							</div>
						</div>
						<div class="row pb-lg-5  mb-sm-5">
							<div class="col-lg-6 col-md-8">
							</div>
						</div>
					</div>
				</div>
			</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



