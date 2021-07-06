<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세</title>
<style type="text/css">
	img {
		width:80px; height:80px;
	}
</style>
</head>
<body>
	<h1>주문 내역 상세</h1>
	<div>
		<table>
			<caption>주문번호 ${ordno }</caption>
			<thead>
				<th>대표이미지</th>
				<th>상품명</th>
				<th>금액</th>
			</thead>
			<tbody>
				<c:url var="detail" value="/product/detail"/>
				<c:forEach var="product" items="${product_list }">
					<tr>
						<c:set var="pname" value="${product.getProductname() }" />
						<td><img src="../resources/img/product/${fn:substringBefore(pname, ' 외') }.jpg"></td>
						<td><a href="${detail }?goodsno=${product.getPid() }">${pname }</a></td>
						<td>${order.getTotal_price() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<table>
			<caption>배송조회</caption>
			<h3>서비스 준비중 입니다.</h3>
		</table>
	</div>
	<div>
		<table>
			<caption>결제정보</caption>
			<thead>
				<th>상품금액</th>
				<th>배송비</th>
				<th>카카오페이 포인트 사용</th>
				<th>결제금액</th>
				<th>결제방법</th>
			</thead>
			<tbody>
				<tr>
					<td>${pay_info.getTotal() - ${delivery_info.getShipping_fee() }</td>
					<td>${delivery_info.getShipping_fee() }</td>
					<td>${pay_info.getPoint() }</td>
					<td>${pay_info.getTotal_pay() }</td>
					<td>${pay_info.getPayment_method_type() }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table>
			<caption>주문정보</caption>
			<thead>
				<th>주문 번호</th>
				<th>주문자명</th>
				<th>보내는 분</th>
				<th>결제일시</th>
			</thead>
			<tbody>
				<tr>
					<td>${ordno }</td>
					<td>${delivery_info.getUsername()}</td>
					<td>${delivery_info.getSender()}</td>
					<td>${pay_info.getApproved_at()}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table>
			<caption>배송정보</caption>
			<thead>
				<th>받는 분</th>
				<th>핸드폰</th>
				<th>주소</th>
			</thead>
			<tbody>
				<tr>
					<td>${delivery_info.getRec_name() }</td>
					<td>${delivery_info.getRec_phone() }</td>
					<td>${delivery_info.getRec_address() }</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>