<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="tit_wrap">
		<h3 class="tit">로그인</h3>
	</div>
	<div class="wrapper">
		<c:url var="login" value="/user/login" />
		<form action="${login }" method="post">
			<div class="wrap">
				<div class="login_wrap">
					<!-- <label class="login_label_name" for="userid">아이디</label> -->
					<input class="input_box" id="userid" type="text" name="userid" size="20" placeholder="아이디"required>
				</div>
				<div class="login_wrap">
					<!-- <label class="login_label_name" for="password">비밀번호</label> -->
					<input class="input_box" id="password" type="password" name="password" size="20" placeholder="비밀번호"required>
				</div>
				<div class="error_wrap">
					<label class="error" style="color: red;">${error }</label>
				</div>
				<div class="login_button_wrap">
					<button class="btn_login" type="submit">로그인</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn_cancel" type="button" onclick="location.href='${main }}'">취소</button>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>