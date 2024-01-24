<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
	section#board-list-container{width:600px; margin:0 auto; text-align:center;}
	section#board-list-container h2{margin:10px 0;}
	table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center ;} 
	input#btn-add{float:right; margin: 0 0 15px;}
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
    .blue_window { display: inline-block; width: 366px;  border: 3px solid #6ccaf5; }
    .input_text { width: calc( 100% - 14px); margin: 6px 7px; border: 0;  background: #007dd100; font-weight: bold;font-size: 16px; outline: none;}
    .sch_smit {width: 54px; height: 40px; margin: 0; border: 0; vertical-align: top; background: #007dd1; color: white; font-weight: bold; border-radius: 1px; cursor: pointer;}
    .sch_smit:hover {background: #007dd1;}
    #board-list-container h2{text-align: center; margin-top: 5px; margin-bottom: 5px}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 목록" name="title"/>
</jsp:include>

<!-- searchType이 비었을 경우 title로 초기화하는 코드  -->
<c:set var="searchType" value="${param.searchType}" />
<c:if test="${empty searchType}">
	<c:set var="searchType" value="title" />
</c:if>

<section id="container">
 <div class="container body-content">
	<div class="row" style="margin-top: 5px;">
		<div id='board-list-container'>
			<h2>NEWS</h2>

			<div class="alert alert-success d-flex fs-md mb-1" role="alert">
				<div class="alert-icon fs-lg">
					<i class="ci-announcement"></i>
				</div>
				<div>
					<strong>공지사항 &nbsp;</strong>※ &nbsp; 항상 정확하고, 공정하고, 신속하게 <strong>
						건강 정보를 &nbsp;</strong>제공하겠습니다. &nbsp;※
				</div>
			</div>
		</div>
	</div>
		
		<!-- 페이지 넘기는 데 필요 -->
		<form name="searchForm" action="${path}/board/list" method="get">
			<input type="hidden" name="page" value="1">
			<input type="hidden" name="types" value="NBOARD">
		</form>


	<!-- 글쓰기 버튼 -->
		<c:if test="${loginMember != null }">
			<button type="button" id="btn-add" style="margin-bottom: 3px;" 
							onclick="location.href='${path}/board/write'">글쓰기</button>
		</c:if>
		
		<!-- 게시판 목록 시작 -->
		<table class="table table-striped table-hover" id="tbl-board">
			<tr style="background-color: yellow;">
				<th>번호</th>
				<th>타입</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			
			<c:if test="${empty list}">
				<tr>
					<td colspan="6">조회된 글이 없습니다.</td>
				</tr>
			</c:if>
			
			<c:if test="${not empty list}">
				<c:forEach var="item" items="${list}">
					<tr>
<%-- 					<td>${item.bno}</td> 이렇게 해도 되는데..... --%>
						<td><c:out value="${item.bno}"/></td>
						<td><c:out value="${typeMap[item.type]}"/></td>
						<td>
							<a href="${path}/board/view?no=${item.bno}">
								<c:out value="${item.title}"/>
							</a>
						</td>
						<td><c:out value="${item.memberName}(${item.memberId})"/></td>
						<td><fmt:formatDate type="date" value="${item.createDate}"/></td>
						<td>
							<c:if test="${item.attachCount > 0}">
								<img alt="" src="${path}/resources/images/file.png">					
							</c:if>						
							<c:if test="${item.attachCount == 0}">
								<span>-</span>				
							</c:if>						
						</td>
						<td><c:out value="${item.readCount}"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 게시판 목록 끝 -->

		<!-- page부 시작 -->
			<div align="center" class="mt-4 mb-4 ">
				<!-- 가장 단순화된 버전 = 검색어가 없는 경우 -->
<!-- 			처음 페이지로 이동하는 코드 -->
<%-- 	 			<button onclick="location.href='${path}/board/list?page=1'">&lt;&lt;</button>  --%>
<!-- 			이전 페이지로 이동하는 코드 -->
<%-- 	 			<button onclick="location.href='${path}/board/list?page=${pageInfo.prevPage}'">&lt;</button>  --%>
				
				<!-- 처음 페이지 -->
				<button onclick="movePage(1);">&lt;&lt;</button>
				<!-- 이전 페이지 -->
				<button onclick="movePage(${pageInfo.prevPage});">&lt;</button>
				
				<!-- 10개의 페이지가 보이는 영역 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}" varStatus="status" step="1" >
					<!-- 현재 페이지 일때 button을 다르게 표기 하기 위한 영역 -->
					<c:if test="${status.current == pageInfo.currentPage}">
						<button disabled >
							${status.current}
						</button>
					</c:if>
					<c:if test="${status.current != pageInfo.currentPage}">
						<button onclick="movePage(${status.current});">
							${status.current}
						</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지 -->
				<button onclick="movePage(${pageInfo.nextPage});">&gt;</button>
				<!-- 마지막 페이지 -->
				<button onclick="movePage(${pageInfo.maxPage});">&gt;&gt;</button>
			</div>
		<!-- page부 끝 -->
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	function movePage(page){
		searchForm.page.value = page;
		searchForm.submit();
	}
</script>



