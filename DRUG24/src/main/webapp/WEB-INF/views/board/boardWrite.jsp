<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="게시글 작성" name="title"/>
</jsp:include>



<main class="page-wrapper">

    <!-- Page title====================================== -->
    <div class="bg-accent mb-4 py-4">
        <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
            <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
                <nav aria-label="breadcrumb">
                    <ol
                        class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                        <li class="breadcrumb-item"><a class="text-nowrap" href="${path}"><i
                                    class="ci-home"></i>Home</a></li>
                        <li class="breadcrumb-item text-nowrap">
                            <a href="${path}/board/list"> Community</a>
                        </li>
                        <li class="breadcrumb-item text-nowrap active" aria-current="page"> 게시글 작성하기 </li>
                    </ol>
                </nav>
            </div>
            <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
                <h1 class="h3 text-light mb-0"> 게시글 작성하기 </h1>
            </div>
        </div>
    </div>
    
    <!-- Page content-->
    <section class="container mb-5 pt-3 pb-md-5 pb-1">
    
        <div class="row gy-5">
            <form class="needs-validation col-md-8" novalidate
            			 action="${path}/board/write" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="memberId" value="${loginMember.id}" readonly class="input-text">
                <!-- Details-->
                <div class="mb-md-5 mb-4 pb-md-0 pb-2">
                    <h2 class="h5 mb-3 fs-3">
                        <i class="ci-edit-alt text-accent"></i> Write
                    </h2>
                    <div class="row gy-md-4 gy-3">
                        <div class="col-12">
                            <label class="form-label" for="details-title"> 제목
                                <span class="ms-1 text-danger">*</span></label>
                            <input name="title" class="form-control" id="details-title" type="Text" placeholder="제목을 입력하세요"
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
                                placeholder="내용을 입력하세요"></textarea><span class="form-text">0 of 500 characters
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
                <!-- Submit-->
                <div class="pt-2">
                    <button class="btn btn-lg btn-accent d-block w-100" type="submit"> 게시글 등록 </button>
                </div>

            </form>
            <!-- Preview =============================================================-->
        </div>
    </section>
</main>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>







