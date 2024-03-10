<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    .input-text {width: 350px;}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 작성" name="title"/>
</jsp:include>


<!-- 글쓰기 에디터 추천 : https://summernote.org/ , https://naver.github.io/smarteditor2/user_guide/ -->

<section class="container" id="board-write-container">
	<h2 class="mt-2" align="center">게시글 작성</h2>
	
	<!-- enctype="multipart/form-data" : 파일 첨부를 할수 있는 html 옵션  -->
	<form action="${path}/board/write" method="post" enctype="multipart/form-data">
		<table class="table table-stripe" id="tbl-board">
			<tr>
				<th scope="row" >제목</th>
				<td colspan="7"><input type="text" name="title" class="input-text form-control"></td>
			</tr>
			<tr>
				<th scope="row">카테고리</th>
				<td colspan="7">
					<select name="type" >
						<c:forEach var="item" items="${categoryList}" varStatus="status">
							<c:if test="${status.first and loginMember.role == 'ROLE_ADMIN'}">
								<option value="${item.type}">${item.name}</option>
							</c:if>
							<c:if test="${not status.first and not status.last}">
								<option value="${item.type}">${item.name}</option>
							</c:if>
							<c:if test="${status.last and loginMember.role == 'ROLE_ADMIN'}">
								<option value="${item.type}">${item.name}</option>
							</c:if>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">작성자</th>
				<td>
					<input type="text" name="memberId" value="${loginMember.id}" readonly class="input-text form-control">
				</td>
			</tr>
			<tr>
				<th scope="row">첨부 파일</th>
				<td colspan="7">
					<input class="form-control" type="file" multiple="multiple" name="upfiles">
				</td>
			</tr>
			<tr>
				<th scope="row">내용</th>
				<td colspan="7">
					<textarea class="form-control" name="content" rows="12" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button class="form-control" type="submit" style="color: brown;">등록</button>
					<button class="form-control" type="reset" style="color: brown;">다시 쓰기</button>
				</th>
			</tr>
		</table>
	</form>
</section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>







