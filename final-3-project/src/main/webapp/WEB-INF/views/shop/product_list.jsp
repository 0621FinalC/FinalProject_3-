<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>상품 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/shop/product_list.css" rel="stylesheet" />
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
</head>
<body>
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
	
	<div class="products">
		<c:set var="path" value="${pageContext.request.contextPath}" />
		<c:forEach var="row" items="${list}">
			<c:set var="picture_url" value="${row.picture_url }" />
			<!-- [ , ] 처리 -->
			<c:if test="${fn:contains(picture_url , '[') or fn:contains(picture_url , ']') }">
				<c:set var="picture_url" value="${fn:replace(picture_url, '[', '%5B') }" />
				<c:set var="picture_url" value="${fn:replace(picture_url, ']', '%5D') }" />
			</c:if>
			<!-- 상품출력 -->
			<a href="${path}/product/detail/${row.PID}">
        		<img id="p_img" src="${path}/resources/img/product/${picture_url}">
       			<p>${row.PRODUCTNAME}</p>
        		<p class="price"><fmt:formatNumber value="${row.PRICE}" type="currency" /></p>
     		 </a>
		</c:forEach>
	</div>
	<div class="clearfix" style="clear: both;"></div>
	
	<div class="footer">
      <a href="#"><img src="${pageContext.request.contextPath }/resources/img/footer/insta.png"></a>
      <a href="#"><img src="${pageContext.request.contextPath }/resources/img/footer/call.png"></a>
      <a href="#"><img src="${pageContext.request.contextPath }/resources/img/footer/mail.png"></a>
    </div>
<%-- 
<h2>상품 목록</h2>

<table border="1" width="1000px">
    <tr>
        <th>상품ID</th>
        <th>카테고리</th>
        <th>이미지</th>
        <th>상품</th>
        <th>가격</th>
        <th>등록일자</th>
        <th>재고</th>
    </tr>

<c:forEach var="row" items="${list}">
<c:set var="path" value="${pageContext.request.contextPath}" />
    <tr align="center">
        <td>${row.PID}</td>
        <td>${row.CATEGORY }</td>
        <!-- [ ] 처리 -->
        <c:set var="picture_url" value="${row.picture_url }" />
		<c:if test="${fn:contains(picture_url , '[') or fn:contains(picture_url , ']') }">
			<c:set var="picture_url" value="${fn:replace(picture_url, '[', '%5B') }" />
			<c:set var="picture_url" value="${fn:replace(picture_url, ']', '%5D') }" />
		</c:if>
        <td><img src="${path}/resources/img/product/${picture_url}" width="100" height="100"></td>
        <td><a href="${path}/product/detail/${row.PID}">${row.PRODUCTNAME}</a></td>
        <td><fmt:formatNumber value="${row.PRICE}" type="currency" /> </td>    
        <td>${row.REGISTERDATE }</td>
        <td>${row.INVENTORY }</td>
    </tr>
</c:forEach>
</table> --%>
</body>
</html>