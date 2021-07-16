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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/orderlist/detail.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<script type="text/javascript">
	$(document).ready(function(){
		$("#keyword").keydown(function(e){
			if(e.keyCode == 13) {
				$("#btn_search").click();
				return false;
			} 
		});
		
		$("#btn_search").click(function(){
			var url = "${search_list }";
			url += "?keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});
	})
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<h1>주문 내역 상세</h1>
	<div class="orderlist_detail">
		<table>
			<caption>주문번호 ${param.ordno }</caption>
			<thead>
				<th>이미지</th>
				<th>상품명</th>
				<th>수량</th>
				<th>금액</th>
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
				<th>상품금액</th>
				<th>배송비</th>
				<th>카카오페이 포인트 사용</th>
				<th>결제금액</th>
				<th>결제방법</th>
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
				<th>주문 번호</th>
				<th>주문자명</th>
				<th>보내는 분</th>
				<th>결제일시</th>
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