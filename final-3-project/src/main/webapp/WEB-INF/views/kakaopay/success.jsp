<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
<link href="${pageContext.request.contextPath }/resources/css/kakaopay/success.css" rel="stylesheet" />
</head>
<body>
	<h1>결제가 완료되었습니다.</h1>
	<c:url var="home" value="/"/>
	<c:url var="order_list" value="/order/list" />
	<button type="button" onclick="location.href='${home}'">홈으로 돌아가기</button>
	<button type="button" onclick="location.href='${order_list}'">주문내역 확인하기</button>
</body>
</html>