<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품장바구니 목록페이지</title>
<script>
	$(document).ready(function(){
		// 리스트 페이지 이동
		$("#btnList").click(function(){
			location.href="${path}/shop/product/list";
		});
	});
</script>
</head>
<body>
	<h2> 장바구니 확인</h2>
	<c:choose>
		<c:when test="$map.count ==0}">
		장바구니가 비어있습니다.
	</c:when>
	<c:otherwise> 
	<form name="form1" id="form1" method="post" action="${path}/cart/update">
		<table border="1">
			<tr>
				<th>상품명</th>
				<th>단가</th>
				<th>수량</th>
				<th>금액</th>
				<th>취소</th>
			</tr>
			<c:forEach var="row" items="${map.list}" varStatus="status">
			<tr>
				<td>
					${row.productname}
				</td>
				<td style="width: 80px" align="right">
					<fmt:formatNumber pattern="###,###,###" value="${row.price}"/>
				</td>
				<td>
					<input type="number" style="width: 40px" name="qty" value="${row.qty}" min="1">
					<input type="hidden" name="pid" value="${row.pid}">
				</td>
				<td style="width: 100px" align="right">
					<fmt:formatNumber pattern="###,###,###" value="${row.totalprice}"/>
				</td>
				<td>
					<a href="${path}/cart/delete?cart_id=${row.cart_id}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
				장바구니 금액 : <fmt:formatNumber pattern="###,###,###" value="${map.sumtotalmoney}"/><br>
				배송비 : ${map.charge}<br>
				총금액 :<fmt:formatNumber pattern="###,###,###" value="${map.allsummoney}"/>
				</td>
			</tr>			
		</table>
		<input type="hidden" name="count" value="${map.count}">
		<button type="submit" id="btnupdate">수정</button>
	</form>
	</c:otherwise>
	</c:choose>
	<button type="button" id="btnlist">상품목록</button>
</body>
</html>