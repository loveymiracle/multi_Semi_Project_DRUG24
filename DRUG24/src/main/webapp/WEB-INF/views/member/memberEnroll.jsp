<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

<style>
	section #enroll-container {text-align: ;}
	section #enroll-container input {margin: 10px;}
	section #enroll-container input {padding: 10px;}
	
</style>

	<h3 align="center" class="mt-2">회원가입</h3>
<section id="content">	
	<form id="enroll-container" name="form1" action="${path}/member/enroll" method="post" class="col-md-4" style="margin-left: 500px;">
				<div class="mb-2">
				 <label class="form-label" for="su-name">ID</label>
				<table>
					<tr>
					<th> <input style="width: 850px;  type="text" id="id" name="id" placeholder="아이디 4글자 이상" required></th>
					<th><input type="button" class="btn btn-primary btn-shadow w-5" id="checkDuplicate" value="중복검사" ></th>
					</tr>
				</table>
				</div>
				<div class="mb-3 ">
				 <label class="form-label" for="su-name">password</label>
					<input style="width: 960px;" type="password" id="password1" name="password" required>
					</div>
				<div class="mb-3 ">
				 <label class="form-label" for="su-name">password check</label>
					<input style="width: 960px;" type="password" id="password2" required>
					</div>
				<div class="mb-3 ">
				 <label class="form-label" for="su-name">name</label>
					<input style="width: 960px;" type="text" id="name" name="name" required>
					</div>
				<div class="mb-3 ">
				 <label class="form-label" for="su-name">email</label>
					<input style="width: 960px;" type="email" name="email" id="email" placeholder="abc@naver.com">
					</div>
				<div class="mb-3 ">
				 <label class="form-label" for="su-name">phone</label>
					<input style="width: 960px;" type="phone" name="phone" id="phone" placeholder="010-1111-2222">
					</div>
				<div class="mb-3 ">
				 <label class="form-label" for="su-name">adress</label>
					<input class="form-control" style="width: 960px;" type="text" id="address" name="address">
					</div>
		<div class="col-md-6">
		<table>
		<tr>
			<th><button class="btn btn-primary btn-shadow d-block mt-2 mb-5" style="width: 480px; height:50px;" type="submit">Sign up</button></th>
			<th><input class="btn btn-primary btn-shadow d-block mb-5" style="width: 480px; height:50px;" type="reset" value="취소"></th>
		</tr>
		</table>
		</div>
	</form>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script type="text/javascript">
	$(()=>{
		$('#password2').blur((e)=>{
			let password1 = $('#password1').val();
			let password2 = $('#password2').val();
			
			if(password1.trim() != password2.trim()){
				alert('패스워드가 일치하지 않습니다.');
				$('#password1').val('');
				$('#password2').val('');
				$('#password1').focus();
				
			}
		});
		
		$('#enrollSubmit').click((e)=>{
			// 서버에 보내기 전에 유효성 확인하는 로직부
			let id = $('#id').val();
			if(id.length < 4){
				alert('아이디가 4글자 보다 적습니다.');
				$('#id').focus();
				return false; // submit을 취소하는 방법, 실제 서버로 전달되지 않음
			}
			
			let password1 = $('#password1').val();
			if(password1.length < 4){
				alert('비밀번호가 4글자 보다 적습니다.');
				$('#password1').focus();
				return false; // submit을 취소하는 방법, 실제 서버로 전달되지 않음
			}
			
			// 유효성 검사로직을 추가하는 부분
			
			return true; // submit이 전송되는 부분			
		});
		
		$('#checkDuplicate').click((e)=>{
			let id = $('#id').val().trim();
			
			if(id.length < 4){
				alert('아이디가 4글자보다 적습니다.');
				return;
			}
			
			$.ajax({
				type:'get',
				url:'${path}/member/idCheck',
				data:{id},
				success:(result)=>{
						if(result.validate === true){
							alert('이미 사용중인 아이디 입니다.');
							$('#id').focus();
						}else{
							alert('사용 가능한 아이디 입니다.');
						}
					},
				error:(e)=>{
					alert('중복을 확인할수 없습니다.');
					console.log(e);
				},
			});
		});
		
	});
</script>











