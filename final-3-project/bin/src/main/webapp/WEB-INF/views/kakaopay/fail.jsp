<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 실패</title>
</head>
<body>
	<h1>결제에 실패했습니다.</h1>
	<c:url var="home" value="/main"/>
	<button type="button" onclick="location.href='${home}'">홈으로 돌아가기</button>
</body>
</html>