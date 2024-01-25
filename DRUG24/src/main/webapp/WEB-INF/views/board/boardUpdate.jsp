<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<style>
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    .input-text {width: 350px;}
</style>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 수정" name="title"/>
</jsp:include>




<main class="page-wrapper">

    <!-- Page title====================================== -->
    <div class="bg-accent mb-4 py-4">
        <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol
                        class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="index.html"><i
                                    class="ci-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap">
                            <a href="BoardMain.html"> Community</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page"> 게시글 수정 </li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                <h1 class="h3 text-light mb-0"> 게시글 수정 </h1>
            </div>
        </div>
    </div>
    
    <!-- Page content-->
    <section class="container mb-5 pt-3 pb-md-5 pb-1">
    
        <div class="row gy-5">
            <form class="needs-validation col-md-8" novalidate
            			 action="${path}/board/update" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="memberId" value="${loginMember.id}" readonly class="input-text">
            	<input type="hidden" name="bno" value="${board.bno}">
                <!-- Details-->
                <div class="mb-md-5 mb-4 pb-md-0 pb-2">
                    <h2 class="h5 mb-3 fs-3">
                        <i class="ci-edit-alt text-accent"></i> Modify
                    </h2>
                    <div class="row gy-md-4 gy-3">
                        <div class="col-12">
                            <label class="form-label" for="details-title"> 제목
                                <span class="ms-1 text-danger">*</span></label>
                            <input name="title" class="form-control" id="details-title" type="Text" placeholder="제목을 입력하세요"
                            	value="${board.title}"
                                required>
                            <div class="invalid-feedback">제목을 입력하세요</div><span class="form-text">
                                최대 100자입니다. HTML이나 이모티콘은 허용되지 않습니다.</span>
                        </div>
                        <div class="col-sm-6">
                            <label class="form-label" for="details-category"> 게시판 선택 <span
                                    class="ms-1 text-danger">*</span> </label>
                            
                            <select class="form-select" id="details-category" name="type">
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
                            
                        </div>
                        <div class="col-sm-6">
<!--                                 <label class="form-label" for="details-collection">Add to collection</label> -->
<!--                                 <select class="form-select" id="details-collection"> -->
<!--                                     <option disabled selected>Choose collection</option> -->
<!--                                     <option>Contemporary art collage</option> -->
<!--                                     <option>3D digital abstract art</option> -->
<!--                                     <option>Clone X Mini Monsters</option> -->
<!--                                     <option>Ocean and sky</option> -->
<!--                                     <option>Aesthetic art collage</option> -->
<!--                                 </select> -->
                        </div>
                        <div class="invalid-feedback">Please choose rating!</div>
                        <div class="col-12">
                            <label class="form-label" for="details-description">내용<span
                                    class="ms-1 text-danger">*</span></label>
                            <textarea name="content"  class="form-control" id="details-description" rows="10"
                                placeholder="내용을 입력하세요">${board.content}</textarea><span class="form-text">0 of 500 characters
                                used.</span>
                        </div>
                    </div>
                </div>


                <!-- Upload file-->
                <div class="mb-md-5 mb-4 pb-md-0 pb-2">
                    <h2 class="h5 mb-2 pb-1 fs-3"> <i class="ci-image text-accent"></i> Photos </h2>
                    <p class="mb-4 fs-7"> 파일 지원 형식 : PNG, JPG, GIF, WEBP, MP3 or
                        MP4. Max size: 100mb.
                    </p>
                    <!-- Drag and drop file upload-->
                    <div class="file-drop-area" style="background-color:rgba(220, 220, 220, 0.171);">
                        <div class="file-drop-icon ci-cloud-upload"></div><span class="file-drop-message">Drag
                            and
                            drop here to upload</span>
                        <input class="file-drop-input" type="file" multiple="multiple" name="upfiles">
                        <button class="file-drop-btn btn btn-outline-accent" type="button">파일 선택
                        </button>
                    </div>
                </div>
                
				<c:if test="${empty board.attachFiles}">
					<div>첨부파일 없음</div>
				</c:if>
				<c:if test="${not empty board.attachFiles}">
					<c:forEach var="item" items="${board.attachFiles}" >
						<div>
							<a href="javascript:fileDownload('${item.fno} }')">
								<img src="${path}/resources/images/file.png" width="20" height="20">
								<c:out value="${item.originalFilename}"/>								
							</a>
						</div>
					</c:forEach>
				</c:if>
                
                <!-- Submit-->
                <div class="pt-2">
                    <button class="btn btn-lg btn-accent d-block w-100" type="submit"> 게시글 수정 </button>
                </div>

            </form>
            <!-- Preview =============================================================-->
            <aside class="col-lg-3 offset-lg-1 col-md-4 position-relative">
                <div class="sticky-top" style="top: 100px;">
                    <h4 class="h5 mb-3 text-md-start text-center">Preview</h4>
                    <!-- Preview item-->
                    <div class="card border-0 shadow mx-auto" style="max-width: 500px; pointer-events: none;">
                        <div class="card-img-top position-relative overflow-hidden">
                            <img src="imgs/review/blueimg.png" alt="Product image" style="height: 170px;">
                        </div>
                        <div class="card-body">
                            <div class="product-review pb-4 mb-4 border-bottom">
                                <div class="d-flex mb-3">
                                    <div class="d-flex align-items-center me-4 pe-2">
                                        <div class="ps-3">
                                            <h6 class="fs-sm mb-0"> 나경원 </h6><span class="fs-ms text-muted">May 8,
                                                2019</span>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="star-rating">
                                            <i class="star-rating-icon 
                           ci-star-filled active"></i>
                                            <i class="star-rating-icon ci-star-filled 
                           active"></i>
                                            <i class="star-rating-icon ci-star-filled 
                           active"></i>
                                            <i class="star-rating-icon ci-star"></i><i
                                                class="star-rating-icon ci-star"></i>
                                        </div>

                                    </div>
                                </div>
                                <p class="fs-md mb-2">Sed ut perspiciatis unde omnis iste
                                    natus error sit voluptatem
                                    accusantium doloremque laudantium, totam rem aperiam,
                                    eaque ipsa quae ab illo inventore
                                    veritatis et quasi architecto beatae vitae dicta sunt explicabo.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </section>
</main>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



<script type="text/javascript">
	function fileDownload(fno) {
		const url = '${path}/board/fileDown?fno=' + fno;
		location.href = url;
	}
</script>





