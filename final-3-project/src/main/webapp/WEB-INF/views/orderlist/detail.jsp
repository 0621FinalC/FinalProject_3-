<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<caption>주문번호 ${param.ordno }</caption>
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>금액</th>
				<tr>
			</thead>
			<tbody>
				<c:url var="detail" value="/product/detail"/>
				<c:forEach var="product" items="${product_list }">
					<tr>
						<c:set var="pname" value="${product.getProductname() }" />
						<c:if test="${fn:contains(pname , '[') or fn:contains(pname , ']') }">
							<c:set var="pname" value="${fn:replace(pname, '[', '%5B') }" />
							<c:set var="pname" value="${fn:replace(pname, ']', '%5D') }" />
						</c:if>
						
						<td><img src="../resources/img/product/${pname }.jpg"></td>
						<td><a href="${detail }?goodsno=${product.getPid() }">${product.getProductname() }</a></td>
						<td>${product.getItem_qty() }개</td>
						<td><fmt:formatNumber value="${product.getTotal_price() }" />원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		배송조회<br>
		서비스 준비중 입니다.
	</div>
	<div>
		<table>
			<caption>결제정보</caption>
			<thead>
			<tr>
				<th>상품금액</th>
				<th>배송비</th>
				<th>카카오페이 포인트 사용</th>
				<th>결제금액</th>
				<th>결제방법</th>
			<tr>
			</thead>
			<tbody>
				<tr>
					<td><fmt:formatNumber value="${pay_info.getTotal() - delivery_info.getShipping_fee() }" />원</td>
					<td><fmt:formatNumber value="${delivery_info.getShipping_fee() }" />원</td>
					<td><fmt:formatNumber value="${pay_info.getPoint() }" />원</td>
					<td><fmt:formatNumber value="${pay_info.getTotal() - pay_info.getPoint() }" />원</td>
					<td>${pay_info.getPayment_method_type() }</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table>
			<caption>주문정보</caption>
			<thead>
				<tr>
					<th>주문 번호</th>
					<th>주문자명</th>
					<th>보내는 분</th>
					<th>결제일시</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${param.ordno }</td>
					<td>${delivery_info.getUsername()}</td>
					<td>${delivery_info.getSender()}</td>
					<td>${fn:replace(pay_info.getApproved_at(),'T',' ')}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div>
		<table>
			<caption>배송정보</caption>
			<thead>
				<tr>
					<th>받는 분</th>
					<th>핸드폰</th>
					<th>주소</th>
				</tr>
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