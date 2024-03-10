<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container body-content">
	        <div class="row" style="margin-top:5px;">
	          <h2>안전성서한 속보</h2>
	          <div class="col-md-9">
	              <span>총 10개</span>
	          </div>
	        </div>
	        <table class="table table-striped table-hover">
	          <thead>
	              <tr>
	                  <th style="text-align:center;">#</th>
	                  <th style="text-align:center;">공고일자</th>
	                  <th style="text-align:center;">제목</th>
	                  <th style="text-align:center;">담당부서</th>
	              </tr>
	          </thead>
	          <tbody>
	              <tr style="cursor:pointer;" data-saft_lett_no="508">
	                  <th class="col-md-1" style="text-align:center;" scope="row">1</th>
	                  <td class="col-md-1" style="text-align:center;">2023-12-06</td>
	                  <td class="col-md-6">의약품 정보 서한 등 배포 알림(오셀타미비르, 발록사비르, 페라미비르, 자나미비르 성분 제제)</td>
	                  <td class="col-md-3" style="text-align:center;">의약품안전평가과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="507">
	                  <th class="col-md-1" style="text-align:center;" scope="row">2</th>
	                  <td class="col-md-1" style="text-align:center;">2023-12-01</td>
	                  <td class="col-md-6">의약품 안전성 서한 배포 알림(첨단바이오의약품(키메라 항원 수용체 T세포(CAR-T) 항암제) 안전성 정보)</td>
	                  <td class="col-md-3" style="text-align:center;">바이오의약품정책과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="506">
	                  <th class="col-md-1" style="text-align:center;" scope="row">3</th>
	                  <td class="col-md-1" style="text-align:center;">2023-12-01</td>
	                  <td class="col-md-6">의약품 정보 서한 배포 알림(레비티라세탐 및 클로바잠 성분 제제)</td>
	                  <td class="col-md-3" style="text-align:center;">의약품안전평가과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="505">
	                  <th class="col-md-1" style="text-align:center;" scope="row">4</th>
	                  <td class="col-md-1" style="text-align:center;">2023-11-06</td>
	                  <td class="col-md-6">안전성 속보 배포 알림</td>
	                  <td class="col-md-3" style="text-align:center;">한약정책과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="504">
	                  <th class="col-md-1" style="text-align:center;" scope="row">5</th>
	                  <td class="col-md-1" style="text-align:center;">2023-10-31</td>
	                  <td class="col-md-6">의약품 정보 서한 배포 알림(스트렙토키나제스트렙토도르나제 함유 제제)</td>
	                  <td class="col-md-3" style="text-align:center;">의약품안전평가과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="503">
	                  <th class="col-md-1" style="text-align:center;" scope="row">6</th>
	                  <td class="col-md-1" style="text-align:center;">2023-08-29</td>
	                  <td class="col-md-6">안전성 서한 배포 알림</td>
	                  <td class="col-md-3" style="text-align:center;">바이오의약품품질관리과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="502">
	                  <th class="col-md-1" style="text-align:center;" scope="row">7</th>
	                  <td class="col-md-1" style="text-align:center;">2023-08-28</td>
	                  <td class="col-md-6">의약품 정보 서한 배포 알림[날록손염산염 함유 제제]</td>
	                  <td class="col-md-3" style="text-align:center;">의약품안전평가과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="501">
	                  <th class="col-md-1" style="text-align:center;" scope="row">8</th>
	                  <td class="col-md-1" style="text-align:center;">2023-08-08</td>
	                  <td class="col-md-6">안전성 속보 배포 알림</td>
	                  <td class="col-md-3" style="text-align:center;">한약정책과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="500">
	                  <th class="col-md-1" style="text-align:center;" scope="row">9</th>
	                  <td class="col-md-1" style="text-align:center;">2023-07-21</td>
	                  <td class="col-md-6">한국휴텍스제약㈜ 제조 ‘레큐틴정(트리메부틴말레산염)’등 6개 품목 잠정 제조·판매·사용 중지</td>
	                  <td class="col-md-3" style="text-align:center;">의약품관리과</td>
	              </tr>
	              <tr style="cursor:pointer;" data-saft_lett_no="499">
	                  <th class="col-md-1" style="text-align:center;" scope="row">10</th>
	                  <td class="col-md-1" style="text-align:center;">2023-07-14</td>
	                  <td class="col-md-6">㈜한독“사브릴정500밀리그램(비가바트린)”영업자 회수 알림</td>
	                  <td class="col-md-3" style="text-align:center;">의약품관리과</td>
	              </tr>
	          </tbody>
	        </table>
	        <!-- Pagination-->
			<nav class="d-flex justify-content-between pt-2"
				aria-label="Page navigation">
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						onclick="movePage(${pageInfo.prevPage});"><i
							class="ci-arrow-left me-2"></i>Prev</a></li>
				</ul>
				<ul class="pagination">

					<!-- 10개 페이지 -->
					<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
						step="1" varStatus="status">
						<c:if test="${status.current == pageInfo.currentPage}">
							<li class="page-item active d-none d-sm-block"
								aria-current="page"><span class="page-link">1<span
									class="visually-hidden">(current)</span></span></li>
						</c:if>
						<c:if test="${status.current != pageInfo.currentPage}">
							<li class="page-item d-none d-sm-block"><a class="page-link"
								>1</a></li>
						</c:if>
					</c:forEach>
				</ul>
				<ul class="pagination">
					<li class="page-item"><a class="page-link"
						onclick="movePage(${pageInfo.nextPage});" aria-label="Next">Next<i
							class="ci-arrow-right ms-2"></i></a></li>
				</ul>
			</nav>
	      </div>		








    </main>

<script type="text/javascript">
		function movePage(page){
			searchForm.page.value = page;
			searchForm.submit();
		}
</script>









<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



