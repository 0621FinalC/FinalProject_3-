<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	boolean logined = false;
	if(session.getAttribute("logined") != null){
		logined = (boolean)session.getAttribute("logined");
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/user/login.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<script type="text/javascript">
	// 검색: url에 키워드 붙여주는 함수
	$(document).ready(function(){
		$("#btn_search").click(function(){
			// url 붙여주기
			var url = "${search_list }";
			url += "?keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url); // 콘솔에 출력해서 확인
		});
	})
</script>
<body>
	<c:url var="login" value="/user/login" />
	<div class="login_form">
		<form action="${login }" method="post">
		<div>
			<label>아이디</label>
			<input id="userid" type="text" name="userid" required>
		</div>
		<div>
			<label>패스워드</label>
			<input id="password" type="password" name="password" required>
		</div>
		<div>
			<label style="color: red;">${error }</label>
		</div>
		<div>
			<button type="submit">로그인</button>
			<c:url var="main" value="/main" />
			<button type="button" onclick="location.href='${main }'">취소</button>
		</div>
	</form>
	</div>
</body>
</html>