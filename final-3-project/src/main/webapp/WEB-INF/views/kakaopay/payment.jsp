<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 화면</title>
</head>
<body>
	<h1>결제 화면</h1>
	<div>
		상품명 : ${order.getProductname() }<br>
		수량 : ${order.getQty() } 개<br>
		금액 : ${order.getTotalPrice() } 원
	</div>
	<div>
		<c:url var="pay_img" value="/resources" />
		<c:url var="pay_url" value="/pay/payment" />
		<a href="${pay_url }"><img src="${pay_img }/img/kakaopay/payment_icon_yellow_medium.png"></a>
	</div>
</body>
</html>