<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="DRUG24 홈페이지" name="title"/>
</jsp:include>

<section id="content">
	<!-- Hero section-->
      <section class="bg-position-center mt-n5 mb-5" style="background-image: url(${path}/resources/imgs/marketplace-hero.png);">
        <div class="pb-lg-1 mb-lg-3">
          <div class="container py-lg-5 my-lg-5">
            <div class="row mb-4 mb-sm-5">
              <div class="col-lg-7 col-md-9 text-center text-sm-start">
                <h1 class="text-heading lh-base"><span class='fw-light blodFont'>약 24,000 개의 의약품을</span> 안전하게 확인하고 복용하세요! 의약품은 DRUG24 </h1>
                <h2 class="h5 text-heading fw-light blodFont">Check and take your medicine safely on this site. DRUG24 for you!</h2>
              </div>
            </div>
            <div class="row pb-lg-5  mb-sm-5">
              <div class="col-lg-6 col-md-8">
                <div class="input-group input-group-lg flex-nowrap"><i class="ci-search position-absolute top-50 translate-middle-y ms-3"></i>
                  <input class="form-control rounded-start" type="text" placeholder="Start your search">
                  <button class="btn btn-primary btn-lg fs-base" type="button" >Search</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- 배너 끝 Hero selction -->
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

