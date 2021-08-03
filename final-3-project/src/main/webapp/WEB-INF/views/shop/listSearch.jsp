<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/shop/listSearch.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="search_list" value="/product/search" />
<c:url var="main" value="/" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#keyword").keydown(function(e){
			if(e.keyCode == 13) {
				$("#btn_search").click();
				return false;
			} 
		});
		
		$("#btn_search").click(function(){
			var url = "${search_list }";
			var searchKeyword = $('#keyword').val();
			url += "?keyword=" + encodeURIComponent(searchKeyword);
			location.href = url;
			console.log(url);
		});
	})
</script>
</head>

<body>
	<%@ include file="../include/header.jsp" %>
	<div class="products">
		<c:set var="path" value="${pageContext.request.contextPath}" />
		<c:forEach var="row" items="${map.list}">
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
	<%@ include file="../include/footer.jsp" %>
</body>
</html>