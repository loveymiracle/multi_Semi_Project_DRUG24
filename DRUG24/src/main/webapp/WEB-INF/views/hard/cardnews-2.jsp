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
						  	<td colspan="7">[카드뉴스]여드름약, 이소트레티노인 안전사용! 엄마와 아기를 지켜주세요!</td>
						  </tr>
						  <tr>
						  	<th scope="row">작성자</th>
						  	<td>관리자</td>
						  	<th scope="row">등록일</th>
						  	<td>2024-01-08</td>
						  	<th scope="row">조회수</th>
						  	<td>3124</td>
						  	<th scope="row">첨부파일</th>
						  	<td></td>
						  </tr>
						</tbody>
					</table>
          <div class="slideshow-container">
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman01.jpg" alt="woman_card_news01" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman02.jpg" alt="woman_card_news02" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman03.jpg" alt="woman_card_news03" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman04.jpg" alt="woman_card_news04" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman05.jpg" alt="woman_card_news05" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman06.jpg" alt="woman_card_news06" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/woman07.jpg" alt="woman_card_news07" style="width:100%"></a></div>
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
            여드름약, 이소트레티노인 안전사용! 엄마와 아기를 지켜주세요!<br>
            이소트레티노인은 태아에게 심각한 기형 유발 가능<br>
            <br>
            중증의 여드름 치료제<br>
            이소트레티노인!<br>
            이소트레티노인은 처방 받기 전에 환자의 임신 여부 확인 및 안전사용 안내가 반드시 필요한 중증의 여드름 치료제입니다<br>
            <br>
            안전사용 안내<br>
            - 임신여부 확인<br>
            - 태아 기형 위험성 설명<br>
            - 피임기간/방법 설명<br>
            - 헌혈 금지/나눠먹기 금지<br>
            - 처방은 30일까지/조제는 7일이내<br>
            <br>
            이소트레티노인은 왜 위험하나요?<br>
            이소트레티노인 치료 중 또는 치료 종료 후 1개월 이내 임신 될 경우, 태아의 심각한 기형 및 자연유산 등을 유발 할 수 있습니다.<br>
            그러므로, 가임 여성은 반드시 임신 여부를 알려야 합니다<br>
            <br>
            수두증, 무이증, 소두증, 소안구증, 지능저하, 입술갈림증<br>
			주요 태아 기형 : 두개골 이상, 뇌기형, 소뇌기형, 수두증, 무뇌수두증, 소두증, 뇌신경 이상,<br>
			외이이상, 소안구증, 심혈관계이상, 안면이형증, 구개열, 흉선 및 부갑상성기형 등<br>
			<br>
            안전하게 이소트레티노인을 사용하기 위해선<br>
			1. 의사 상담은 필수<br>
			이소트레티노인의 기형 위험성 및 안전 사용 수칙에 대한 충분한 설명 확인은 필수에요.<br>
			임신여부 확인 기형 위험성 설명 피임 필요성 설명 동의서 서명<br>
            <br>
            2. 의사와 상담 시 임신 여부 알리기<br>
			가임 여성은 여드름 치료 시, 반드시 의사에게 임신 여부를 알려주세요<br>
			임신 가능성이 있으신가요? 혹은 임신계획 중이신가요?<br>
			임신 가능성은 없어요. 아직까지는 임신 계획은 없는 상황이에요.<br>
			<br>
            안전하게 이소트레티노인을 사용하기 위해선<br>
			3. 복용 전후 피임기간 지키기<br>
			이소트레티노인 복용 최소 한달 전부터 마지막 복용 후 최소 한달까지 반드시<br>
			피임을 해야해요.<br>
			<br>
            4. 복용 동안 효과적인 피임법 선택하기<br>
			이소트레티노인 복용 중에는 가능하면 2가지 이상의 피임법을 함께 사용하는 것을 권장해요.<br>
			1. 콘돔+경구피임약 , 2. 콘돔+루프<br>
            <br>
            안전하게 이소트레티노인을 사용하기 위해선<br>
			5. 헌혈 금지<br>
			이소트레티노인 복용 시작 부터 마지막 복용 후 최소 한 달까지 헌혈해서는 안 돼요.<br>
			6. 나눠먹기 금지<br>
			복용하고 남은 이소트레티노인을 다른 사람에게 나눠주거나 인터넷으로 판매하면 안 돼요.<br>
			<br>
			국내에서 사용 중인 이소트레티노인 성분 의약품<br>
			(14개 품목/경구제, '22년 9월 기준)<br>
			1 니메겐연질캡슐(이소트레티노인) ㈜메디카코리아<br>
			2 레씨범연질캡슐(이소트레티노인) 위더스제약㈜<br>
			3 로이탄연질캡슐(이소트레티노인) ㈜마더스제약<br>
			4 아키놀연질캡슐(이소트레티노인) 아주약품㈜<br>
			5 오피큐탄연질캡슐(이소트레티노인) ㈜아이월드제약<br>
			6 우리큐탄연질캡슐(이소트레티노인) ㈜팜젠사이언스<br>
			7 이소탐연질캡슐(이소트레티노인) 성원애드콕제약㈜<br>
			8 이소트렌연질캡슐(이소트레티노인) 고려제약㈜<br>
			9 이소티논연질캡슐10밀리그램(이소트레티노인) 한미약품㈜<br>
			10 제로큐탄연질캡슐(이소트레티노인) 제이더블유신약㈜<br>
			11 트레논연질캡슐(이소트레티노인) ㈜동구바이오제약<br>
			12 트레인연질캡슐(이소트레티노인) ㈜제뉴파마<br>
			13 트레틴연질캡슐10mg(이소트레티노인) 코오롱제약㈜<br>
			14 핀플연질캡슐(이소트레티노인) 주식회사 더유제약<br>
			<br>
			우리 모두가 안전하게 의약품을 사용할 수 있도록 의심되는 부작용을 보고해 주세요!<br>
			1644-6223, 14-3330<br>
			의약품안전나라(nedrug.mfds.go.kr)<br>
          </div>
        </div>
      </section>
    </main>











<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



