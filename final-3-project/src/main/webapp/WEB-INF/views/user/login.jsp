<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${pageContext.request.contextPath }/resources/css/user/login.css" rel="stylesheet" />
</head>
<body>

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
					<input class="id_input" id="userid" type="text" name="userid" placeholder="아이디를 입력해 주세요"required>
				</div>
			</div>
			<div class="pw_wrap">
				<div class="pw_input_box">
					<input class="pw_iput" id="password" type="password" name="password" placeholder="비밀번호를 입력해 주세요"required>
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
</body>
</html>