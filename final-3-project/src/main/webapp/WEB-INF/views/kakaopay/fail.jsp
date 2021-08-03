<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 실패</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/kakaopay/fail.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
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
	<div class="tit_wrap">
		<h3 class="tit">결제에 실패했습니다.</h3>
	</div>
	<c:url var="home" value="/"/>
	<div class="wrap">
		<button type="button" onclick="location.href='${home}'">홈으로 돌아가기</button>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>