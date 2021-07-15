<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 취소</title>
<link href="${pageContext.request.contextPath }/resources/css/kakaopay/cancel.css" rel="stylesheet" />
</head>
<body>
	<h1>결제가 취소되었습니다.</h1>
	<c:url var="home" value="/main"/>
	<button type="button" onclick="location.href='${home}'">홈으로 돌아가기</button>
</body>
</html>