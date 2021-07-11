<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
	<h2>주문 내역</h2>
	<div class="orderinfo">
		<div>
			<label for="oid">상품 번호</label>
	    	<input type="text" name="oid" id="oid" value="${orderData.getOid() }">
		</div>
		<div>
			<label for="productname">상품 이름</label>
			<input type="text" name="productname" id="productname" value="${orderData.getProductname() }">
		</div>
		<div>
			<label for="qty">수량</label>
			<input type="text" name="qty" id="qty" value="${orderData.getQty() }">
		</div>
		<div>
			<label for="totalprice">금액</label>
			<input type="text" name="totalprice" id="totalprice" value="${orderData.getTotalprice() }">
		</div>	
	</div>
</body>
</html>