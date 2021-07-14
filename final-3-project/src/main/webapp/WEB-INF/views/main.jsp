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
<title>KH3SHOP</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" />
<c:url var="main" value="/" />
<c:url var="logout" value="/user/logout" />
<c:url var="mypage" value="/user/mypage" />
<c:url var="login" value="/user/login" />
<c:url var="join" value="/user/join" />
<c:url var="board_list" value="/product/list" />
<c:url var="search_list" value="/product/search" />
<c:url var="cart" value="/cart/list" />
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
</head>
<body>
	<div class="navtop">
		<a class="logo" href="${main }">
			<img src="${pageContext.request.contextPath }/resources/img/logo.png" height="20px">
		</a>
		<ul>
			<% if(logined) { %>  <!-- 로그인했을 경우와 아닌경우 메뉴를 다르게  -->
				<li><a href="${logout }">Logout</a></li>
				<li><a href="${mypage }">Mypage</a></li>
			<% } else { %>
				<li><a href="${login }">Login</a></li>
				<li><a href="${join }">Join</a></li>
			<% } %>
			<li><a href="${cart }">Cart</a></li>
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
				<a href="${board_list }">전체보기</a>
			</li>
			<li>
				<a href="#">인기상품</a>
			</li>
			<li>
				<a href="#">할인상품</a>
			</li>
			<li class="search">
				<input type="text" class="search_form" name="keyword" id="keyword" value="${map.keyword }">
				<button class="search_button" name="btn_search" id="btn_search">검색</button>
			</li>
		</ul>
	</div>
	
	<img class="headimg" src="${pageContext.request.contextPath }/resources/img/headimg.png">
	<h1>오늘의 추천상품</h1>
</body>
</html>