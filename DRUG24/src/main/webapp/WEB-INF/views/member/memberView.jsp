<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

<section>
<!-- Page Title-->
      <div class="page-title-overlap bg-dark pt-4">
        <div class="container d-lg-flex justify-content-between py-2 py-lg-3">
          <div class="order-lg-2 mb-3 mb-lg-0 pt-lg-2">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb breadcrumb-light flex-lg-nowrap justify-content-center justify-content-lg-start">
                <li class="breadcrumb-item"><a class="text-nowrap" href="${path}"><i class="ci-home"></i>Home</a></li>
                <li class="breadcrumb-item text-nowrap"><a href="${path}/member/view">Account</a>
                </li>
                <li class="breadcrumb-item text-nowrap active" aria-current="page">Profile info</li>
              </ol>
            </nav>
          </div>
          <div class="order-lg-1 pe-lg-4 text-center text-lg-start">
            <h1 class="h3 text-light mb-0">Profile info</h1>
          </div>
        </div>
      </div>
      <div class="container pb-5 mb-2 mb-md-4">
        <div class="row">
          <!-- Sidebar-->
          <aside class="col-lg-4 pt-4 pt-lg-0 pe-xl-5">
            <div class="bg-white rounded-3 shadow-lg pt-1 mb-5 mb-lg-0">
              <div class="d-md-flex justify-content-between align-items-center text-center text-md-start p-4">
                <div class="d-md-flex align-items-center">
                  <div class="img-thumbnail rounded-circle position-relative flex-shrink-0 mx-auto mb-2 mx-md-0 mb-md-0" style="width: 6.375rem;"><img class="rounded-circle" src="${path}/resources/imgs/review/0${loginMember.mno}.jpg" alt="profile"></div>
                  <div class="ps-md-3">
                    <h3 class="fs-base mb-0">${loginMember.name}님</h3><span class="text-accent fs-sm">${loginMember.email}</span>
                  </div>
                </div><a class="btn btn-primary d-lg-none mb-2 mt-3 mt-md-0" href="#account-menu" data-bs-toggle="collapse" aria-expanded="false"><i class="ci-menu me-2"></i>Account menu</a>
              </div>
              <div class="d-lg-block collapse" id="account-menu">
                <div class="bg-secondary px-4 py-3">
                  <h3 class="fs-sm mb-0 text-muted">Dashboard</h3>
                </div>
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3" href="${path}/shop/cart"><i class="ci-cart opacity-60 me-2"></i>My Cart<span class="fs-sm text-muted ms-auto">${cartSize}</span></a></li>
                </ul>
                <div class="bg-secondary px-4 py-3">
                  <h3 class="fs-sm mb-0 text-muted">Account settings</h3>
                </div>
                <ul class="list-unstyled mb-0">
                  <li class="border-bottom mb-0"><a class="nav-link-style d-flex align-items-center px-4 py-3 active" href="${path}/member/view"><i class="ci-user opacity-60 me-2"></i>Profile info</a></li>
                </ul>
              </div>
            </div>
          </aside>
          <!-- Content  -->
          <section class="col-lg-8">
            <!-- Toolbar-->
            <div class="d-none d-lg-flex justify-content-between align-items-center pt-lg-3 pb-4 pb-lg-5 mb-lg-3">
              <h6 class="fs-base text-light mb-0">Update you profile details below:</h6><a class="btn btn-primary btn-sm" href="${path}/logout"><i class="ci-sign-out me-2"></i>Sign out</a>
            </div>
            <!-- Profile form-->
            <form id="enroll-container" name="form1" action="${path}/member/update" method="post">
            <div class="row gx-4 gy-3">
                <div class="col-sm-6">
                  <label class="form-label">Your ID</label>
                  <input class="form-control" type="text" id="id" name="id" value="${loginMember.id}"  required readonly>
                </div>
                <div class="col-sm-6">
                  <label class="form-label">Name</label>
                  <input class="form-control" type="text" id="name" name="name" value="${loginMember.name}" required>
                </div>
                <div class="col-sm-6">
                  <label class="form-label">Email Address</label>
                  <input class="form-control" type="email" name="email" id="email" value="${loginMember.email}">
                </div>
                <div class="col-sm-6">
                  <label class="form-label">Phone Number</label>
                  <input class="form-control" type="tel" id="phone" name="phone" maxlength="13" value="${loginMember.phone}" placeholder="010-1234-5678">
                </div>
                <div class="col-12">
                  <hr class="mt-2 mb-3">
                  <div class="d-flex flex-wrap justify-content-between align-items-center">
                    <button class="btn btn-primary mt-3 mt-sm-0" type="submit" value="정보수정">Update profile</button>
                    <button class="btn btn-primary mt-3 mt-sm-0" type="submit" value="비밀번호변경" id="updatePwd">Change password</button>
                    <button class="btn btn-primary mt-3 mt-sm-0" type="submit" value="탈퇴" id="deleteMember">Withdrawal account</button>
                  </div>
                </div>
              </div>
            </form>
           </section>
        </div>
      </div>
</section>
<br><br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	$(()=>{
		$("#deleteMember").click((e) => {
			if(confirm("정말로 탈퇴하시겠습니까?!")) {
				location.replace('${path}/member/delete');
			}
		});
		
		$("#updatePwd").click((e) => {
			const url = "${path}/member/updatePwd";
			const status = "left=500px,top=200px,width=400px,height=210px"
			window.open(url, "비밀번호 수정", status);
		});
	});
</script>











