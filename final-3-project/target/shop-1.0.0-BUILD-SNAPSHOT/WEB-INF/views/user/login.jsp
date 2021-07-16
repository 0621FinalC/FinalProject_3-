<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%
	boolean logined = false;
	if(session.getAttribute("logined") != null){
		logined = (boolean)session.getAttribute("logined");
	}	
%> --%>
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
			url += "?keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});
	})
</script>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="wrapper">
	<div class="wrap">
		<div class="logo_wrap">
			<span>로그인</span>
		</div>
	
	<c:url var="login" value="/user/login" />
	<div class="login_form">
		<form action="${login }" method="post">
			<div class="id_wrap">
					<div class="id_input_box">
					<input class="id_input" id="userid" type="text" name="userid" size="20" placeholder="아이디를 입력해 주세요"required>
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_iput" id="password" type="password" name="password" size="20" placeholder="비밀번호를 입력해 주세요"required>
				</div>
			</div>
		<div>
			<label style="color: red;">${error }</label>
		</div>
		<div class="login_button_form">
			<button type="submit" class="login_button">로그인</button>
			<!-- 취소버튼 잠깐 비활성화 
			<c:url var="main" value="/main" />
			<button type="button" onclick="location.href='${main }'">취소</button>
			-->
		</div>
		<div class="login_button_form">
			<c:url var="join" value="/user/join" />
			<button type="button" onclick="location.href='${join }'" class="join_button">회원가입</button>
		</div>
	</form>
	</div>
	
	
	</div>
	
</div>
	<%-- <c:url var="login" value="/user/login" />
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
	</div> --%>
</body>
</html>