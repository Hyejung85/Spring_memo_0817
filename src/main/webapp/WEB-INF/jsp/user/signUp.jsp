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
				<input type="text" class="form-control mt-3" placeholder="아이디" id="idInput">
				<input type="text" class="form-control mt-3" placeholder="패스워드" id="passwordInput">
				<input type="text" class="form-control mt-3" placeholder="패스워드 확인" id="passwordCheckInput">
				<div class="text-danger d-none" id="passwordBox">
				<small>패스워드가 일치하지 않습니다.</small>
				</div>
				<input type="text" class="form-control mt-3" placeholder="이름" id="nameInput">
				<input type="text" class="form-control mt-3" placeholder="이메일 주소" id="emailInput">
				<button type="submit" class="btn btn-info btn-block mt-3" id="checkBtn">회원가입</button>
			 </div>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	$(document).ready(function(){
		$("#checkBtn").on("click",function(){
			var id = $("#idInput").val();
			var password = $("#passwordInput").val();
			var passwordCheck = $("#passwordCheckInput").val();
			var name = $("#nameInput").val();
			var email = $("#emailInput").val();
			
			if(id == null || id ==""){
				alert("id를 입력하세요");
				return;
			}
			if(password == null || password ==""){
				alert("password를 입력하세요");
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
		
		});
	});
	</script>

</body>
</html>