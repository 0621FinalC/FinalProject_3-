<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<link href="${pageContext.request.contextPath }/resources/css/user/mypage.css" rel="stylesheet" />
</head>
<c:url var="info" value="/user/info" />
<c:url var="order_list" value="/order/list" />
<body>	
	<button type="button" onclick="location.href='${info}'">회원정보</button>
	<button type="button" onclick="location.href='${order_list}'">주문내역</button>
</body>
</html> 