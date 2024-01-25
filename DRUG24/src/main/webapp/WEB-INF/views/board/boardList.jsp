<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시판 목록" name="title" />
</jsp:include>

<!-- searchType이 비었을 경우 title로 초기화하는 코드  -->
<c:set var="searchType" value="${param.searchType}" />
<c:if test="${empty searchType}">
	<c:set var="searchType" value="title" />
</c:if>

<div class="container body-content" id='board-list-container'>

	<!-- 검색창 시작 -->
	<form name="searchForm" action="${path}/board/list" method="get">
		<input type="hidden" name="page" value="1">

		<div class="row" style="margin-top: 15px;">
			<h1>Community Board</h1>

			<div class="alert alert-danger d-flex fs-md mb-1" role="alert">
				<div class="alert-icon fs-lg">
					<i class="ci-announcement"></i>
				</div>
				<div>
					<strong>공지사항 &nbsp; </strong>※타인의 명예를 훼손하는 <strong>상업성 및
						도배성</strong>게시물은 삭제될 수 있습니다.
				</div>
			</div>


			<div div class="container"
				style="margin-bottom: 10px; margin-top: 20px;">
				<div class="d-flex justify-content-between h2">
					<select class=" form-select" name="searchType" id="pharcategory"
						style="width: 320px;" >
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="writer">ID</option>
					</select>
					<div class="d-flex justify-content-between">
						<input class="form-control" type="text" id="road" name="searchValue"
							placeholder="입력하세요" style="width: 700px;" required>
						<button class="btn btn-primary" type="submit"
							style="margin-left: 25px; margin-right: 30px;">
							<i class="ci-search 
	              me-1"></i> 검색
						</button>
					</div>
				</div>
			</div>
		</div>
		</form>

		<!-- 글쓰기 버튼 -->
		<c:if test="${loginMember != null }">
			<i style="color: blueviolet;" class="navbar-tool-icon ci-edit-alt"></i>
			<button type="button" class="btn btn-primary" id="btn-add" style="margin-bottom: 3px;"
				onclick="location.href='${path}/board/write'">글쓰기</button>
		</c:if>

		<!-- 게시판 목록 시작 -->
		<table class="table table-striped table-hover" id="tbl-board">

			<thead>
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">타입</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">작성자</th>
					<th style="text-align: center;">작성일</th>
					<th style="text-align: center;">첨부파일</th>
					<th style="text-align: center;">조회수</th>
				</tr>
			</thead>

			<c:if test="${empty list}">
				<tr>
					<td colspan="6">조회된 글이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty list}">
				<c:forEach var="item" items="${list}">
					<tr style="cursor: pointer;" data-saft_not_no="10">
						<%-- 					<td>${item.bno}</td> 이렇게 해도 되는데..... --%>
						<td style="text-align: center;"><c:out value="${item.bno}" /></td>
						<td style="text-align: center;"><c:out
								value="${typeMap[item.type]}" /></td>
						<td style="text-align: center;"><a class="text-accent "
							href="${path}/board/view?no=${item.bno}"><c:out
									value="${item.title}" />
						</a></td>
						<td style="text-align: center;"><c:out
								value="${item.memberName}(${item.memberId})" /></td>
						<td style="text-align: center;"><fmt:formatDate type="date"
								value="${item.createDate}" /></td>
						<td style="text-align: center;"><c:if
								test="${item.attachCount > 0}">
								<img alt="" src="${path}/resources/images/file.png">
							</c:if> <c:if test="${item.attachCount == 0}">
								<span>-</span>
							</c:if></td>
						<td style="text-align: center;"><c:out
								value="${item.readCount}" /></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 게시판 목록 끝 -->


		<!-- Pagination-->
		<nav class="d-flex justify-content-between pt-2 mb-4 "
			aria-label="Page navigation">
			
			<ul class="pagination">
				<li class="page-item">
				<a class="page-link" onclick="movePage(${pageInfo.prevPage});"> 
					<i class="ci-arrow-left me-2"></i>Prev</a></li>
			</ul>
			
			<ul class="pagination">
				<li class="page-item d-sm-none"><span
					class="page-link page-link-static">1 / 10</span></li>
				
				<!-- 10개의 페이지가 보이는 영역 -->
				<c:forEach begin="${pageInfo.startPage}" end="${pageInfo.endPage}"
					varStatus="status" step="1">
					<!-- 현재 페이지 일때 button을 다르게 표기 하기 위한 영역 -->
					<c:if test="${status.current == pageInfo.currentPage}">
						<li class="page-item active d-none d-sm-block" aria-current="page">
						<span class="page-link">${status.current}<span class="visually-hidden">(current)</span></span></li>
					</c:if>
					<c:if test="${status.current != pageInfo.currentPage}">
						<li class="page-item d-none d-sm-block"><a class="page-link"
							onclick="movePage(${status.current});">${status.current}</a></li>
					</c:if>
				</c:forEach>	
				
			</ul>
			
			<ul class="pagination">
				<li class="page-item">
					<a class="page-link" onclick="movePage(${pageInfo.nextPage});"
						aria-label="Next">Next<i class="ci-arrow-right ms-2"></i></a></li>
			</ul>
		</nav>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<script type="text/javascript">
	function movePage(page){
		searchForm.page.value = page;
		searchForm.submit();
	}
</script>



