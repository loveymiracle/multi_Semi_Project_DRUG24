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
						  	<td>2023-12-31</td>
						  	<th scope="row">조회수</th>
						  	<td>1384</td>
						  	<th scope="row">첨부파일</th>
						  	<td></td>
						  </tr>
						</tbody>
					</table>
          <div class="slideshow-container">
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old01.jpg" alt="old_card_news01" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old02.jpg" alt="old_card_news02" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old03.jpg" alt="old_card_news03" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old04.jpg" alt="old_card_news04" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old05.jpg" alt="old_card_news05" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old06.jpg" alt="old_card_news06" style="width:100%"></a></div>
            </div>
            <div class="newsSlides">
              <div><a href="#"><img src="${path}/resources/imgs/news/cardnews/old07.jpg" alt="old_card_news07" style="width:100%"></a></div>
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
            어르신을 위한 안전한 약물 사용 안내서<br>
            어르신은 왜 약물 사용에 주의해야 할까요?<br>
            어르신들은 여러가지 약을 복용하시는 분들이 많아요. 그리고 약물 부작용 발생 위험이 커요<br>
            고혈압, 당뇨병, 이상지질혈증, 골관절염<br>
            <br>
            어르신은 왜 부작용 발생 위험이 큰가요?<br>
            나이가 들수록 신체의 변화로 몸 안에서 정상적인 약 대사·배설이 어려워요. <br>
            그리고 복용하는 많은 약들끼리 몸 안에서 복잡한 상호작용을 할 수 있어요.<br>
            따라서, 어르신들에서 부작용 발생 가능성이 커요.<br>
            <br>
            어르신에게 흔하게 발생하는 부작용은 무엇인가요?<br>
            어르신에게 더 흔하게 나타날 수 있는 부작용은 다음과 같아요<br>
            졸림, 진정작용, 인지능력 저하, 입마름 변비, 소변 불편, 부종, 어지러움, 피로감, 소화불량, 속쓰림<br>
            <br>
            어르신이 안전하게 약물을 사용하기 위해선<br>
            1. 가능하면 단골 병원과 단골 약국을 정해서 다니세요.<br>
            단골 병원이나 단골 약국에서는 어르신의 건강상태와 <br>
            주기적으로 복용하는 약의 이력 관리가 가능해요.<br>
            2. 건강 상태와 복용하는 약은 기록하여 가지고 다니세요.<br>
            어르신의 혈압, 혈당 수치 등 건강 상태와 현재<br>
            복용 중인 모든 약들을 기록해두세요.<br>
            <br>
            어르신이 안전하게 약물을 사용하기 위해선<br>
            3. 복용하는 약을 모두 알려주세요.<br>
            병원에서 의사에게 진료받거나, 약국에서<br>
            약을 구입할 때, 현재 복용하는 약을 모두 알려<br>
            주세요. 그리고 과거에 부작용 경험이 있다면<br>
            말해주세요.<br />
            4. 복용하는 약들은 임의로 중단하면 안돼요.<br>
            증상이 좋아졌거나 잘 낫지 않는다고 임의로 약 복용 빈도를 줄이거나 중단하면 안 돼요.<br>
            반드시 의사나 약사와 먼저 상의하세요.<br>
            <br>
            우리 모두가 안전하게 의약품을 사용할 수 있도록 의심되는 부작용을 보고해 주세요!<br>
            1644-6223, 14-3330<br>
            의약품안전나라(nedrug.mfds.go.kr)
          </div>
        </div>
      </section>
    </main>











<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



