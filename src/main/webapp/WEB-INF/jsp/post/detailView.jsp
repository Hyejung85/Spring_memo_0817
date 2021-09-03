<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memo - 상세</title>
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
		<section class="d-flex justify-content-center">
			<div class="m-5 w-75">
				<h1 class="text-center">메모 상세</h1>
				<!-- 제목, 내용, 파일 업로드  -->
				<div class="d-flex aling-item-center ml-3">
					<label>제목 : </label>
					<input type="text" class="form-control col-11 ml-3" id="subjectInput" value="${post.subject }">
				</div>
				
				<textarea class="form-control mt-3" rows="5" id="contentInput">${post.content }</textarea>
				
				<c:if test="${not empty post.imagePath }">
					<img src="${post.imagePath }">
				</c:if>
				
				<div class="d-flex justify-content-between mt-3">
					<div class="d-flex">
						<a href="/post/list_view" class="btn btn-info"> 목록으로</a>
						<button type="button" class="btn btn-danger" id="deleteBtn" data-post-id="${post.id}">삭제</button>
					</div>
					<button type="button" class="btn btn-success" id="updateBtn" data-post-id="${post.id}">수정</button>
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	<script>
	$(document).ready(function(){
		$("#updateBtn").on("click", function(){
			var postId = $(this).data("post-id");
			
			$.ajax({
				type:"post",
				url:"/post/update",
				data:{"id":postId, "subject":$("#subjectInput").val(), "content":$("#contentInput").val()},
				success:function(data){
					if(data.result =="success"){
						alert("수정 성공");
						location.reload();
					}else{
						alert("수정 실패");
					}
				},
				error:function(e){
					alert("error");
				}
			});
		});
		
		$("#deleteBtn").on("click",function(){
			var postId = $(this).data("post-id");
			
			$.ajax({
				type:"get",
				url:"/post/delete",
				data:{"id":postId},
				success:function(data){
					if(data.result == "success"){
						location.href="/post/list_view";
					}else{
						alert("삭제 실패");
					}
				},
				error:function(e){
					alert("error");
				}
			});
		});
	});
	
	</script>

</body>
</html>