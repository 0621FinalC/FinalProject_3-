<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
</head>
<body>
	<h1>주문 내역</h1>
	<div>
		<table>
			<thead>
				<th>주문일자</th>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>주문번호</th>
				<th>결제금액</th>
				<th>주문상태</th>
			</thead>
			<tbody>
				<c:url var="detail" value="/order/detail"/>
				<c:forEach var="order" items="${orderlist }">
					<tr>
						<fmt:formatDate var="odate" value="${order.getOrderdate() }" pattern="yyyy.MM.dd (hh시 mm분)"/>
						<td>${odate }</td>
						<c:set var="pname" value="${order.getProductname() }" />
						<td><img src="/resources/img/product/${fn:substringBefore(pname, ' 외') }.jpg"></td>
						<td><a href="${detail }?ordno=${order.getOid() }">${pname }</a></td>
						<td>${order.getOid() }</td>
						<td>${order.getTotalprice() }</td>
						<td>${order.getOrderstat() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>