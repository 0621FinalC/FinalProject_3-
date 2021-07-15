<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
	boolean logined = false;
	if(session.getAttribute("logined") != null){
		logined = (boolean)session.getAttribute("logined");
	}	
%>

	<div class="navtop">
		<a class="logo" href="${main }">
			<img src="${pageContext.request.contextPath }/resources/img/logo.png" height="20px">
		</a>
		<ul>
			<% if(logined) { %>  <!-- 로그인했을 경우와 아닌경우 메뉴를 다르게 : 여기서 오류나는거 상관 없음 -->
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
				<a href="${board_list }">전체보기</a>
			</li>
			<li>
				<a href="#">인기상품</a>
			</li>
			<li>
				<a href="#">할인상품</a>
			</li>
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
		</ul>
		<div class="search">
			<input type="text" class="search_form" name="keyword" id="keyword" value="${map.keyword }" placeholder="Search">
			<button class="search_button" name="btn_search" id="btn_search">검색</button>
		</div>
	</div>
	