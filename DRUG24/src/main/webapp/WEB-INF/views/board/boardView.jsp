<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both ; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    div#comment-container button#btn-insert{width:60px;height:50px; color:white; background-color:#3300FF;position:relative;top:-20px;}
    
    /*댓글테이블*/
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 상세조회" name="title"/>
</jsp:include>


<!-- cont_info -->
    <section class="container ">
      <h2 class="mt-5 mb-3 pb-2 border-bottom">게시판 상세페이지</h2>
      <div>
        <table class="table table-stripe">
          <tbody>
            <tr>
              <th scope="row">제목</th>
              <td colspan="5">${board.title}</td>
              <th scope="row">번호</th>
              <td colspan="2">${board.bno}</td>
            </tr>
            <tr>
              <th scope="row">작성자</th>
              <td><c:out value="${board.memberName}(${board.memberId})"/></td>
              <th scope="row">등록일</th>
              <td><fmt:formatDate type="date" value="${board.createDate}"/></td>
              <th scope="row">수정일</th>
              <td><fmt:formatDate type="date" value="${board.modifyDate}"/></td>
              <th scope="row">조회수</th>
              <td><c:out value="${board.readCount}"/></td>
            </tr>
            <tr>
              <th scope="row">첨부파일</th>
              <td colspan="7"><c:if test="${empty board.attachFiles}">
					<span>-</span>
				</c:if>		
				<c:if test="${not empty board.attachFiles}">
					<c:forEach var="item" items="${board.attachFiles }">
						<div>
							<a href="javascript:fileDownload('${item.fno}');">
								<img src="${path}/resources/images/file-earmark.svg" width="20" height="20"/>
								<c:out value="${item.originalFilename}"></c:out>		
							</a>
						</div>
					</c:forEach>
				</c:if>		
				</td>
            </tr>
            <tr>
              <th scope="row">이미지</th>
	              <td colspan="7">
		              <c:if test="${not empty board.attachFiles}">
						<c:forEach var="item" items="${board.attachFiles}" >
						<c:if test="${fn:contains(item.originalFilename,'.jpg') 
									  or fn:contains(item.originalFilename,'.png')  
									  or fn:contains(item.originalFilename,'.jpeg')}">
						<div>
							<img src="${path}/resources/upload/board/${item.renamedFilename}"
																		width="50%" height="50%"/>
						</div>
						</c:if>
						</c:forEach>
					</c:if>	
				</td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
    <!-- Product description-->
    <div class="container pt-lg-3 pb-4 pb-sm-5">
      <div class="row justify-content-center">
        <div class="mx-5">
          <textarea name="content" class="form-control" id="details-description" rows="10" readonly><c:out value="${board.content}"/></textarea>
        </div>
      </div>
      
      <c:if test="${not empty loginMember && (loginMember.id == board.memberId 
														|| loginMember.role == 'ROLE_ADMIN')}">
			<div class="mt-2" align="right">
				<button class="btn btn-primary  " type="button" id="btnUpdate">수정</button>
				<button class="btn btn-primary  " type="button" id="btnDelete">삭제</button>
			</div>
	  </c:if>
      
      <hr class="m-1">
    </div>
    <div class="container">
      <div class="row pt-0 ">
        <!-- Reviews list-->
        <div class="col-md-8">
          <div class="d-flex justify-content-end pb-4">
          </div>
          
			
			<c:if test="${not empty board.replies}">
				<c:forEach var="reply" items="${board.replies}">
				
				  <!-- Review-->
		          <div class="product-review pb-4 mb-4 border-bottom">
		            <div class="d-flex mb-3">
		              <div class="d-flex align-items-center me-4 pe-2"><img class="rounded-circle" src="${path}/resources/imgs/profile/0${loginmember.mno}.png"
		                  width="50" alt="name">
		                <div class="ps-3">
		                  <h6 class="fs-sm mb-0">
		                  	<c:out value="${reply.memberName}(${reply.memberId})"/>
		                  	   <!-- 삭제버튼 -->
								<button class="btn btn-primary ms-5" style="padding-top:3px; height: 25px; text-align: center; font-size: 12px;" onclick="deleteReply('${reply.rno}','${board.bno}');" >삭제</button>
							<c:if test="${not empty loginMember && (loginMember.id == reply.memberId
																				|| loginMember.role == 'ROLE_ADMIN') }">
							</c:if>
		                  </h6>
		                  <span class="fs-ms text-muted"><fmt:formatDate type="both" value="${reply.createDate}"/></span>
		               
		                </div>
		              </div>
		              <div>
		              </div>
		            </div>
		            <p class="fs-md mb-2"><c:out value="${reply.content}"/></p>
		          </div>
				</c:forEach>
			</c:if>
          
  
        </div>



        <!-- Leave review form-->
		<c:if test="${not empty loginMember}">
	        <div class="col-md-4 mt-2 pb-4">
	          <div class="bg-secondary py-grid-gutter px-grid-gutter rounded-3">
	            <h3 class="h4 pb-2">답변을 작성해주세요</h3>
	            <form class="needs-validation" method="post" novalidate  action="${path}/board/reply" >
	               <input type="hidden" name="bno" value="${board.bno}" />
		    	   <input type="hidden" name="memberId" value="${loginMember.id}" />
	              <div class="mb-3">
	                <label class="form-label" for="review-name">아이디<span class="text-danger">*</span></label>
	                <input class="form-control" type="text" required id="review-name" value="${loginMember.id}" readonly="readonly">
	                <div class="invalid-feedback">Please enter your name!</div><small class="form-text text-muted">Will be
	                  displayed on the comment.</small>
	              </div>
	              <div class="mb-3">
	                <label class="form-label" for="review-text">답변<span class="text-danger">*</span></label>
	                <textarea class="form-control" name="content" rows="6" required id="review-text"></textarea>
	                <div class="invalid-feedback">Please write a reply!</div><small class="form-text text-muted">Your
	                  reply must be at least 50 characters.</small>
	              </div>
	              <button class="btn btn-primary btn-shadow d-block w-100" type="submit">Submit a Reply</button>
	            </form>
	          </div>
	        </div>
        </c:if>
      </div>
    </div>





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">

	$(document).ready(() => {
		$("#btnUpdate").click((e) => {
			location.href = "${path}/board/update?no=${board.bno}";
		});
		
		$("#btnDelete").click((e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${path}/board/delete?no=${board.bno}");
			}
		});
	});

	function fileDownload(fno) {
		const url = '${path}/board/fileDown?fno=' + fno;
		location.href = url;
	}

	function deleteReply(rno, bno) {
		const url = '${path}/board/replyDel?rno=' + rno + '&bno=' + bno;
		location.href = url;
	}

</script>


















