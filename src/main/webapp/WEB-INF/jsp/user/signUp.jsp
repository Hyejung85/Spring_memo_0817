<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 - 회원가입</title>
<!-- bootstrap CDN link -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="/static/css/style.css">
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		
		<section class="signup-content d-flex justify-content-center">
			<div class="login-box h-100 d-flex justify-content-center align-items-center">
			 <div class="w-100">
				<h1 class="text-center">회원가입</h1>
				<form method="post" action="/user/sign_up" id="signupForm">
					<div class="d-flex mt-3">
						<input type="text" class="form-control mt-3" placeholder="아이디" id="loginIdInput" name="loginId">
						<button type="button" class="btn btn-info btn-sm mt-3" id="idDuplicateBtn">중복확인</button>
					</div>
					<div class="text-success d-none" id="noneDuplicateDiv">
						<small>사용 가능한 아이디입니다.</small>
					</div>
					<div class="text-danger d-none" id="duplicateDiv">
						<small>중복된 아이디입니다.</small>
					</div>
					<input type="password" class="form-control mt-3" placeholder="패스워드" id="passwordInput" name="password">
					<input type="password" class="form-control mt-3" placeholder="패스워드 확인" id="passwordCheckInput">
					<div class="text-danger d-none" id="passwordBox">
						<small>패스워드가 일치하지 않습니다.</small>
					</div>
					<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput" name="name">
					<input type="text" class="form-control mt-3" placeholder="이메일 주소" id="emailInput" name="email">
					
					<button type="submit" class="btn btn-info btn-block mt-3" id="signupBtn">회원가입</button>
				</form>
			 </div>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	$(document).ready(function(){
		
		var isIdCheck = false;
		var isDuplicate = true;
		
		$("#signupForm").on("submit",function(e){
			
			e.preventDefault();
			
			var loginId = $("#loginIdInput").val();
			var password = $("#passwordInput").val();
			var passwordCheck = $("#passwordCheckInput").val();
			var name = $("#nameInput").val().trim();
			var email = $("#emailInput").val().trim();
			
			if(loginId == null || loginId ==""){
				alert("아이디를 입력하세요");
				return;
			}
			if(password == null || password ==""){
				alert("비밀번호를 입력하세요");
				return;
			}
			if(name == null || name ==""){
				alert("이름를 입력하세요");
				return;
			}
			if(email == null || email ==""){
				alert("email를 입력하세요");
				return;
			}
			if(password != passwordCheck){
				$("#passwordBox").removeClass("d-none");
			}
			
			// 중복체크했는?
			if(isIdCheck == false){
				alert("아이디 중복체크를 진행하세요");
				return;
			}
									
			// 중복이 되었는지 안되었는지?
			if(isDuplicate == true){
				alert("아이디가 중복되었습니다.");
				return;
			}
			
			$.ajax({
				type:"post",
				url:"/user/sign_up",
				data:{"loginId":loginId, "password":password, "name":name, "email":email},
				success:function(data){
					if(data.result == "success"){
						location.href ="/user/signin_view";
					}else{
						alert("회원 가입 실패");
					}
				},
				error:function(e){
					alert("회원 가입 실패");
				}
			});
			return false;
		});
		
		$("#idDuplicateBtn").on("click",function(){
			
			var loginId = $("#loginIdInput").val();
			
			if(loginId == null || loginId ==""){
				alert("아이디를 입력하세요");
				return;
			}
			
			$.ajax({
				type:"get",
				url:"/user/is_duplicate_id",
				data:{"loginId":loginId},
				success:function(data){
					isIdCheck = true;
					
					if(data.is_duplicate){
						isDuplicate = true;					
						$("#duplicateDiv").removeClass("d-none");
						$("#noneDuplicateDiv").addClass("d-none");
					}else{
						isDuplicate = false;	
						$("#duplicateDiv").addClass("d-none");
						$("#noneDuplicateDiv").removeClass("d-none");
					}
				},
				error:function(e){
					alert("중복확인 실패!!");
				}
			});
		});
	});
	</script>

</body>
</html>