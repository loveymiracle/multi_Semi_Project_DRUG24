<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>
<style>
    div#updatePassword-container{
        background:yellowgreen;
    }
    div#updatePassword-container table {
        margin:0 auto;
        border-spacing: 20px;
    }
    div#updatePassword-container table tr:last-of-type td {
        text-align:center;
    }
</style>
</head>
<body>
	<div id="updatePassword-container">
		<form action="${path}/member/updatePwd" method="POST">
			<div class="row gx-4 gy-3">
				<div class="col-sm-6">
	                  <label class="form-label">New Password</label>
	                  <div class="password-toggle">
	                    <label class="password-toggle-btn" aria-label="Show/hide password">
	                    </label>
	                    	<input class="form-control" type="password" id="pass1" required>
	                  </div>
	                </div>
	                <div class="col-sm-6">
	                  <label class="form-label" for="account-confirm-pass">Confirm Password</label>
	                  <div class="password-toggle">
	                    <label class="password-toggle-btn" aria-label="Show/hide password">
	                    </label>
	                    	<input class="form-control" type="password" id="pass2">
	                  </div>
	                </div>
	               </div>
	               <div class="col-12">
                  	<hr class="mt-2 mb-3">
                  	<div class="d-flex flex-wrap justify-content-between align-items-center">
                    	<button class="btn btn-primary mt-3 mt-sm-0" type="submit" value="변경" id="updateSubmit" onclick="return validate();">Change password</button>
                    	<button class="btn btn-primary mt-3 mt-sm-0" type="submit" value="닫기" onclick="self.close();">Withdrawal account</button>
                  	</div>
                </div>
		</form>
	</div>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<script>
		$(document).ready(() => {
			$("#updateSubmit").on("click", (e) => {
				let pass1 = $("#pass1").val();			
				let pass2 = $("#pass2").val();
				
				if(pass1.trim() != pass2.trim()) {
					alert("비밀번호가 일치하지 않습니다.");
					
					$("#pass1").val("");
					$("#pass2").val("");
					$("#pass1").focus();
					
					return false;
				}		
			});
		});
	</script>
</body>
</html>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>










