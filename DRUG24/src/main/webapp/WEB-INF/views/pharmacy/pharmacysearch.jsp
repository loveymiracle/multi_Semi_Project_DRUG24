<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!-- j 쿼리 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>


<style>
      /* 지도 스타일 시작 */
      .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
      .map_wrap {position:relative;width:100%;height:350px;}
      #category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
      #category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
      #category li.on {background: #eee;}
      #category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
      #category li:last-child{margin-right:0;border-right:0;}
      #category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
      #category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
      #category li .pharmacy {background-position: -10px -72px;}
      #category li.on .category_bg {background-position-x:-46px;}
      .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
      .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
      .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
      .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
      .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
      .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
      .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
      .placeinfo .tel {color:#0f7833;}
      .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
      h2 {color: white; }
       * {font-family: 'Noto Sans KR', sans-serif;}
      .blodFont {font-family: 'Nanum Gothic', sans-serif;}
      .fs-5 {font-family: 'Noto Sans KR', sans-serif;}
      /* 지도 스타일 끝 */
</style>



<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="약국찾기 검색" name="title"/>
</jsp:include>

     <!-- Hero section  히어로 섹션 =============================================================-->
        <section class="mt-n5 mb-5 bg-dark"
            style="background-color: white; background-image: url(); background-repeat: no-repeat; background-position: 85% center;; height: 250px;">
            <div class="pb-lg-1 mb-lg-3">
                <div class="container d-lg-flex justify-content-between py-2 py-lg-5 my-lg-5">
                    <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb flex-lg-nowrap justify-content-center justify-content-lg-start fs-5">
                                <li class="breadcrumb-item"><a class="text-nowrap text-light" href="main.html"><i
                                            class="ci-home"></i>Home</a></li>
                                <li class=" breadcrumb-item text-nowrap "><a class="text-light" href="${path}/pharmacy/search"> 약국 찾기 </a>
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                        <h1 class="blodFont mb-0 text-light"> 약국 찾기 </h1>
                        <br>
                        <p class="h5 mb-1 text-light">
                            운영시간이 변동될 수 있으므로 약국에 전화 확인 후 방문해주시기 바랍니다.
                        <p class="h5 mb-0 text-light">약국 운영시간은 대한약사회에서 제공하는 정보입니다.</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- =============================== -->
        <form name="searchForm" action="${path}/pharmacy/search" method="get">
			<input type="hidden" name="page" value="1">
        <!-----------------------------------------------------------      체크 박스 ----------------------->
        <div class="container h2"
            style=" border-top: 1px solid #183459; border-bottom: 1px solid #183459; padding: 30px; margin-top: 40px;">
            <!--name : 라디오를 그룹핑할 네임으로 중복해서 사용-->
            <!--value : 실제 서버로 넘어갈 값-->
            <div class="col-md-4 mb-4 h2">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="nightck" name="nightck" value="${param.nightck}" ${nightck == true ? 'checked' : ''}>
                    <label class="form-check-label fs-5" for="nightck"> 심야 약국 </label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" id="holidayck" name="holidayck" value="${param.holidayck}" ${holidayck == true ? 'checked' : ''}>
                    <label class="form-check-label fs-5" for="holidayck"> 공휴일</label>
                </div>

            </div>
            <div class="d-flex justify-content-between h2">
                <select class="form-select" name="sido1" id="sido1" style="width: 500px; " >
                </select>
                <select class="form-select" name="gugun1" id="gugun1" style="width: 350px; margin-right: 270px;" >
                </select>
            </div>
            
            
                <script>
                    $(function () {
                        var area0 = ["시/도 선택", "서울특별시", "인천광역시", "대전광역시", "광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주도"];
                        var area1 = ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
										"중구", "중랑구"];
                        var area2 = ["계양구", "남구", "남동구", "동구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"];
                        var area3 = ["대덕구", "동구", "서구", "유성구", "중구"];
                        var area4 = ["광산구", "남구", "동구", "북구", "서구"];
                        var area5 = ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"];
                        var area6 = ["남구", "동구", "북구", "중구", "울주군"];
                        var area7 = ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"];
                        var area8 = ["고양시", "과천시", "광명시", "광주시", "구리시", "군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시", "시흥시", "안산시", "안성시", "안양시", "양주시", "오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
										"평택시", "포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군"];
                        var area9 = ["강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시", "태백시", "고성군", "양구군", "양양군", "영월군", "인제군", "정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군"];
                        var area10 = ["제천시", "청주시", "충주시", "괴산군", "단양군", "보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군"];
                        var area11 = ["계룡시", "공주시", "논산시", "보령시", "서산시", "아산시", "천안시", "금산군", "당진군", "부여군", "서천군", "연기군", "예산군", "청양군", "태안군", "홍성군"];
                        var area12 = ["군산시", "김제시", "남원시", "익산시", "전주시", "정읍시", "고창군", "무주군", "부안군", "순창군", "완주군", "임실군", "장수군", "진안군"];
                        var area13 = ["광양시", "나주시", "목포시", "순천시", "여수시", "강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군", "보성군", "신안군", "영광군", "영암군", "완도군", "장성군", "장흥군", "진도군", "함평군", "해남군", "화순군"];
                        var area14 = ["경산시", "경주시", "구미시", "김천시", "문경시", "상주시", "안동시", "영주시", "영천시", "포항시", "고령군", "군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군", "울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군"];
                        var area15 = ["거제시", "김해시", "마산시", "밀양시", "사천시", "양산시", "진주시", "진해시", "창원시", "통영시", "거창군", "고성군", "남해군", "산청군", "의령군", "창녕군", "하동군", "함안군", "함양군", "합천군"];
                        var area16 = ["서귀포시", "제주시", "남제주군", "북제주군"];

                        // 시/도 선택 박스 초기화
                        $("select[name^=sido]").each(function () {
                            $selsido = $(this);
                            $.each(eval(area0), function () {
                                $selsido.append("<option value='" + this + "'>" + this + "</option>");
                            });
                            $selsido.next().append("<option value=''> 구/군 선택 </option>");
                        });

                        // 시/도 선택시 구/군 설정
                        $("select[name^=sido]").change(function () {
                            var area = "area" + $("option", $(this)).index($("option:selected", $(this))); // 선택지역의 구군 Array
                            var $gugun = $(this).next(); // 선택영역 군구 객체
                            $("option", $gugun).remove(); // 구군 초기화

                            if (area == "area0")
                                $gugun.append("<option value=''> 구/군 선택 </option>");
                            else {
                                $.each(eval(area), function () {
                                    $gugun.append("<option value='" + this + "'>" + this + "</option>");
                                });
                            }
                        });

                    });
                </script>
            
        
            
           
            <div class="col-md-3 mb-3 h2" style="margin-top: 30px;">
                <h5> 약국 이름 </h5>
                <div class="d-flex justify-content-between">
                    <input class="form-control" type="text" id="name"  name="name"  placeholder="약국 이름을 입력하세요" value="${param.name}" style="width: 700px;"
                        >
                    <button class="btn btn-primary" type="submit" style="margin-left: 20px;"> <i
                            class="ci-search me-1"></i> 검색
                    </button>
                </div>
            </div>
        </div>
        </form>
        <br><br><br>
        <div class="gray container d-flex justify-content-between" style="border-bottom: 1px solid #183459;">
            <div class="container">
                <div class="h3 mb-4 text-accent" id="sample5_address_display">  </div>
            </div>
        </div>

        <div class="container pb-5 mb-2 mb-md-4">
            <!-- ===============================================================================================  지도  ================= -->
           
            <br><br><br><br>
             <div class="gray container d-flex justify-content-between" style="border-bottom: 1px solid #183459;">
            </div>
            <c:if test="${empty list}">
				<tr>
					<td colspan="6">조회된 글이 없습니다.</td>
				</tr>
			</c:if>
			
            <c:if test="${not empty list}">
			<c:forEach var="item" items="${list}">
            <!-- Products grid ============================================================  약국 리스트   -->
            <div class="row pt-4 mx-n2"> <!--여백 좌우여백 제거-->
					
                <!--- ==============================================================================-->
                <!-- Product -------------------------------------------------- -->
           
                <div class="col-lg-4 col-md-4 col-sm-6 px-3 mb-grid-gutter">
                    <div class="card product-card">
                        <button class="btn-wishlist btn-sm" type="button" data-bs-toggle="tooltip"
                            data-bs-placement="left" title="즐겨찾기">
                            <i class="ci-star"></i></button>
                        <a class="card-img-top d-block overflow-hidden" href="${path}/pharmacy/view">
                            <img src="imgs/pharmacy/phar1.png" style="width: 100%; height: 230px;" alt="Product"></a>
                        <!-- ---------- ---------  약국 이미지 -->
                        <div class="card-body">
                            <div class="d-flex flex-wrap justify-content-between align-items-start pb-2">
                                <h3 class="product-title mb-2 blodFont"><a href="${path}/pharmacy/view">
                                       <c:out value="${item.phname}"/>
                                    </a>
                                </h3>
                                <!-- 별 -->
                                <div class="h5 text-warning"> 이용후기 (3) </div>
                                <div class="Pharmacy-name">
                                    <div class="h5 me-1">
                                        <i class="ci-location me-1"></i> <c:out value="${item.phaddress}"/>
                                    </div>
                                    <div class="h5 me-1">
                                        <i class="ci-phone me-1"></i> <c:out value="${item.phtel}"/>
                                    </div>
                                    <h1 class="product-title h5 mb-3 me-1">
                                        <i class="ci-time text-muted me-1"></i> 영업시간
                                        <span class="h6 ms-2 text-muted"></span>
                                    </h1>
                                </div>
                                <div class="d-flex align-items-center">
                                    <c:if test="${item.phop1s != null }">
	                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">월 </div>
                                    </c:if>
                                    <c:if test="${item.phop1s == null }">
                                    <div class="rounded-3 py-1 px-1 h4 me-2" style="color: gray">월 </div>
                                    </c:if>
                                    
                                    
                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">화 </div>
                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">수 </div>
                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">목 </div>
                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">금 </div>
                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">토 </div>
                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4 me-2">일 </div>
                                    
                                    <c:if test="${item.phop8s != null }">
	                                    <div class="bg-faded-accent text-accent rounded-3 py-1 px-1 h4"> 공휴일</div>
                                    </c:if>
                                    <c:if test="${item.phop8s == null }">
	                                    <div class="rounded-3 py-1 px-1 h4 me-2" style="color: gray"> 공휴일</div>
                                    </c:if>
                                    
                                    
                                    
                                </div>
                                <div class="d-flex h5" style="margin-top: 5px;">
                                    <div class="bg-success text-white rounded-1 py-2 px-3 h5 me-3">
                                        <i class="ci-moon text-white me-1"></i> 심야 약국
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </div>
               </c:forEach>
			</c:if>
               
           

            </div>

            <hr class="my-3">
            <!-- ===================================================================   Pagination-->
            <nav class="d-flex justify-content-between pt-2" aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#"><i class="ci-arrow-left me-2"></i></a>
                    </li>
                </ul>
                <ul class="pagination">
                    <li class="page-item d-sm-none"><span class="page-link page-link-static">1 /
                            5</span></li>
                    <li class="page-item active d-none d-sm-block" aria-current="page"><span class="page-link">1<span
                                class="visually-hidden">(current)</span></span>
                    </li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">2</a></li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">3</a></li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">4</a></li>
                    <li class="page-item d-none d-sm-block"><a class="page-link" href="#">5</a></li>
                </ul>
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#" aria-label="Next"><i
                                class="ci-arrow-right ms-2"></i></a></li>
                </ul>
            </nav>
        </div>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	function movePage(page){
		searchForm.page.value = page;
		searchForm.submit();
	}
</script>


