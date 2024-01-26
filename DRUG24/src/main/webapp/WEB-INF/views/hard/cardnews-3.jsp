<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<style>
	      * {
	        box-sizing:border-box
	      }
	
	      /* Slideshow container */
	      .slideshow-container {
	      max-width: 1000px;
	      position: relative;
	      margin: auto;
	      }
	
	      .newsSlides {
	        display: none
	      }
	
	      .newsSlides:first-child {
	        display: block;
	      }
	
	      /* Slideshow container */
	      .slideshow-container {
	        max-width: 1000px;
	        position: relative;
	        margin: auto;
	      }
	
	      /* Hide the images by default */
	      .slide-news {
	        display: none;
	      }
	
	      /* Next & previous buttons */
	      .prev, .next {
	        cursor: pointer;
	        position: absolute;
	        top: 50%;
	        width: auto;
	        margin-top: -22px;
	        padding: 16px;
	        color: black;
	        font-weight: bold;
	        font-size: 18px;
	        transition: 0.6s ease;
	        border-radius: 0 3px 3px 0;
	        user-select: none;
	      }
	
	      /* Position the "next button" to the right */
	      .next {
	        right: 0;
	        border-radius: 3px 0 0 3px;
	      }
	
	      /* On hover, add a black background color with a little bit see-through */
	      .prev:hover, .next:hover {
	        background-color: rgba(0,0,0,0.8);
	      }
	
	      /* The dots/bullets/indicators */
	      .dot {
	        cursor: pointer;
	        height: 15px;
	        width: 15px;
	        margin: 0 2px;
	        background-color: #bbb;
	        border-radius: 50%;
	        display: inline-block;
	        transition: background-color 0.6s ease;
	      }
	
	      .active, .dot:hover {
	        background-color: #717171;
	      }
	</style>
	
	<script>
      let slideIndex = 1;
      showSlides(slideIndex);
      
      function plusSlides(n) {
        showSlides(slideIndex += n);
      }
      
      function currentSlide(n) {
        showSlides(slideIndex = n);
      }
      
      function showSlides(n) {
        let i;
        let slides = document.getElementsByClassName("newsSlides");
        let dots = document.getElementsByClassName("dot");
        if (n > slides.length) {
          slideIndex = 1
        }    
        if (n < 1) {
          slideIndex = slides.length
        }
        for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none";  
        }
        for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
        }
        slides[slideIndex-1].style.display = "block";  
        dots[slideIndex-1].className += " active";
      }
    </script>
    
    <!-- 카드 뉴스 (슬라이드 쇼) 시작-->
			<section class="container">
				<h2 class="mt-5 mb-3 border-bottom">최신 의학 뉴스, 일상 건강 정보 모아보기</h2>
				<div>
		      <!-- form 영역 start -->
		      <!-- <form id="" name="" action="" method=""> -->
		        <!-- <input type="hidden" name="bbrdId" />           -->
		        <!-- <input type="hidden" name="atacFleNm" /> -->
		        <!-- <input type="hidden" name="atacFleSvNm" /> -->
		        <!-- <input type="hidden" name="atacFleSvPath" /> -->
					<table class="table table-stripe">
						<tbody>
						  <tr>  
						  	<th scope="row">제목</th>
						  	<td colspan="7">[카드뉴스]어르신을 위한 안전한 약물 사용 안내서</td>
						  </tr>
						  <tr>
						  	<th scope="row">작성자</th>
						  	<td>관리자</td>
						  	<th scope="row">등록일</th>
						  	<td>2024-01-25</td>
						  	<th scope="row">조회수</th>
						  	<td>304</td>
						  	<th scope="row">첨부파일</th>
						  	<td></td>
						  </tr>
						</tbody>
					</table>
          <div class="slideshow-container">
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe01.jpg" alt="safe_card_news01" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe02.jpg" alt="safe_card_news02" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe03.jpg" alt="safe_card_news03" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe04.jpg" alt="safe_card_news04" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe05.jpg" alt="safe_card_news05" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe06.jpg" alt="safe_card_news06" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/safe07.jpg" alt="safe_card_news07" style="width:100%"></a></div>
            </div>
            <a class="prev" onclick="plusSlides(-1)">&lt;</a>
            <a class="next" onclick="plusSlides(1)">&gt;</a>
          </div>
          <br>
          <div style="text-align:center">
            <span class="dot" onclick="currentSlide(1)"></span>
            <span class="dot" onclick="currentSlide(2)"></span>
            <span class="dot" onclick="currentSlide(3)"></span>
            <span class="dot" onclick="currentSlide(4)"></span>
            <span class="dot" onclick="currentSlide(5)"></span>
            <span class="dot" onclick="currentSlide(6)"></span>
            <span class="dot" onclick="currentSlide(7)"></span>
          </div>
          <div>
            2022.10.1.~10.10.<br>
            에 이어 24년에도 다시 하는 캠페인<br>
			약물안전캠페인 함께해요<br>
			<br>
			나의 부작용 정보 나눌수록 안전해집니다.<br>
			<br>
			약물안전캠페인이란?<br>
			보다 안전한 의약품 사용을 위해<br>
			식품의약품안전처, 한국의약품안전관리원, 지역의약품안전센터가 함께 의약품 안전 사용 및 부작용 보고의 중요성을<br>
			알리기 위해 실시되는 다양한 활동을 말합니다.<br>
			
			약을 복용한 후 몸에 이상이 있다면 부작용일 수 있습니다.<br>
			<br>
			부작용이 의심된다면?<br>
			먼저, 의약전문가에게 상담을 요청하세요. 그리고, 의심되는 부작용을 알려주세요!<br>
			<br>
			부작용을 보고하고 싶어요! 어떻게 보고해야 할까요?<br>
			의약품 부작용 보고 및 피해구제 상담센터(1644-6223 또는 14-3330)<br>
			의약품안전나라(nedrug.mfds.go.kr)<br>
			의약품안전나라로그인 > 전자민원/보고 > 전자보고신청 > 보고분류 「약물이상반응/이상사례」 선택 > '국내이상사례보고_E2B(R3)' 보고서작성<br>
			보고방법 Click<br>
			<br>
			가까운 지역의약품안전센터에 보고 및 상담 지역의약품안전센터 리스트 및 연락처 Click<br>
			<br>
			부작용 보고 시, 어떤 내용을 보고해야 하나요?<br>
			환자 정보 : 환자이니셜(실명 미기재 가능), 나이, 성별 등<br>
			부작용 정보 : 증상, 발생일, 경과 등<br>
			의심되는 의약품 정보 : 제품명 또는 성분명, 복용일 등<br>
			보고자 정보 : 보고자 이름, 연락처(전화번호 또는 이메일주소) 등 * 보고자 정보는 보호됩니다.<br>
			<br>
			어떻게 약물 부작용 재발생을 예방할 수 있을까요?<br>
			'약물 안전카드'로 약물 부작용을 예방하세요!<br>
			약물 안전카드란 의약전문가가 환자의 약물 부작용을 의심의약품과 함께 기록한 카드입니다.<br>
			병원이나 약국을 방문하실 때 의사나 약사에게 반드시 보여주세요.<br>
			유사한 부작용 피해를 예방할 수 있습니다.<br>
			<br>
			의사 선생님, 이 카드는 제 약물 안전카드입니다. 확인해 주세요. / 과거에 이 약을 복용하고<br>
			부작용이 있으셨군요. 다른 약을 처방해 드리겠습니다.<br>
			<br>
			우리 모두가 안전하게 의약품을 사용할 수 있도록 의심되는 부작용을 보고해 주세요!<br>
			1644-6223, 14-3330<br>
			의약품안전나라(nedrug.mfds.go.kr)<br>
          </div>
        </div>
      </section>
    </main>











<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



