<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>KH3SHOP</title>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" />
</head>
<body>
	<div class="navtop">
		<a class="logo" href="/shop/main">
			<img src="${pageContext.request.contextPath }/resources/img/logo.png" height="20px">
		</a>
		<ul>
			<% if(logined) { %>  <!-- 로그인했을 경우와 아닌경우 메뉴를 다르게  -->
				<li><a href="/shop/user/logout">Logout</a></li>
				<li><a href="/shop/user/mypage">Mypage</a></li>
			<% } else { %>
				<li><a href="/shop/user/login">Login</a></li>
				<li><a href="/shop/user/join">Join</a></li>
			<% } %>
			<li><a href="#">Cart</a></li>
		</ul>
	</div>
	<div class="navmenu">
		<ul class="menu">
			<li>
				<a href="#">카테고리</a>
				<ul class="category">
					<li><a href="#">채소·과일</a></li>
					<li><a href="#">해산물</a></li>
					<li><a href="#">육류·계란</a></li>
					<li><a href="#">메인요리</a></li>
					<li><a href="#">디저트·간식</a></li>
					<li><a href="#">건강식품</a></li>
				</ul>
			</li>
			<li>
				<a href="#">신상품</a>
			</li>
			<li>
				<a href="#">베스트</a>
			</li>
			<li>
				<a href="#">할인상품</a>
			</li>
		</ul>
		<div class="search">
			<!-- 검색 -->
		</div>
	</div>
	
	<img class="headimg" src="${pageContext.request.contextPath }/resources/img/headimg.png">
	<h1>오늘의 추천상품</h1>
</body>
</html>