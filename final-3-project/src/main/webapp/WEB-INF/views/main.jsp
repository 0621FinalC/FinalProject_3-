<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KH3SHOP</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/main.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="board_list" value="/product/list" />
<c:url var="search_list" value="/product/search" />
<c:url var="cart" value="/cart/list" />
<!-- 스크립트 내장으로 넣으려고 했는데, url 관련 오류나서 일단 보류 : search_list JSTL 관련. 그냥 텍스트로 shop/product/search 하면 컨텍스트루트 변경시 x : 해결중.. -->
<!-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/searchJs.js"></script> -->
<script type="text/javascript">
$(document).ready(function(){
		$("#keyword").keydown(function(e){
			if(e.keyCode == 13) {
				$("#btn_search").click();
				return false;
			} 
		});
		
		$("#btn_search").click(function(){
			// url 붙여주기
			var url = "${search_list }";
			var searchKeyword = $('#keyword').val();
			url += "?keyword=" + encodeURIComponent(searchKeyword); //[, ] 처리위해 인코딩
			location.href = url;
		});
	})
</script>
</head>
<body>
	<%@ include file="../views/include/header.jsp" %>

	<img class="headimg" src="${pageContext.request.contextPath }/resources/img/headimg.png">
	<h1>What's New</h1>
	<div class="products">
		<c:set var="path" value="${pageContext.request.contextPath}" />
		<c:forEach var="row" items="${list}" begin="0" end="5" step="1"> <!-- 메인페이지에는 최대 6개의 상품만 보여주기로! -->
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
	
	<%@ include file="../views/include/footer.jsp" %>
</body>
</html>