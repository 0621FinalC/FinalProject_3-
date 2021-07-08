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
	<c:url var="login" value="/user/login" />
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
	</div>
</body>
</html>