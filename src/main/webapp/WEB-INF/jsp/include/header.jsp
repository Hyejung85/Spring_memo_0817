<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="d-flex justify-contents-between align-items-center">
			<h2 class="ml-3">Memo</h2>
			<c:if test="${not empty userName }">
				<div class="mr-3">${userName }님 <a href="/user/sign_out">로그아웃</a></div>
			</c:if>
</header>