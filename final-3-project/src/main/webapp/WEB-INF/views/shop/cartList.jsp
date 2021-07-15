<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품장바구니 목록페이지</title>
<%@ include file="../include/header.jsp" %>
<script>
	$(document).ready(function(){
		// 리스트 페이지로 이동
		$("#btnList").click(function(){
			location.href="${path}/product/list";
		});
	});
</script>
</head>
<body>

<%@ include file="../include/menu.jsp" %>
	<h2> 장바구니 확인</h2>
	<!-- 장바구니 담긴 상품이 없으면(0) 장바구니가 비었습니다. 출력 아니면(0이 아님) 장바구니 목록 출력  -->
	<c:choose>
		<c:when test="${map.count == 0}">
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
			<!-- 장바구니 레코드 출력 -->
			<c:forEach var="row" items="${map.list}" varStatus="i">
			<tr>
				<td>
					${row.productname}
				</td>
				<td style="width: 80px" align="right">
						<fmt:formatNumber pattern="###,###,###" value="${row.price}"/>
				</td>
				<td>
					<input type="number" style="width: 40px" name="cartqty" value="${row.cartqty}" min="1">
					<input type="hidden" name="pid" value="${row.pid}">
				</td>
				
				<td style="width: 100px" align="right">
						<fmt:formatNumber pattern="###,###,###" value="${row.totalprice}"/>
				</td>
				<td>
					<a href="${path}/cart/delete?cid=${row.cid}">삭제</a>
				</td>
			</tr>	
			</c:forEach>
			<tr>
				<td colspan="5" align="right">
					장바구니 금액 합계 : <fmt:formatNumber pattern="###,###,###" value="${map.sumtotalmoney}"/><br>
					배송료 : <fmt:formatNumber pattern="###,###,###" value="${map.charge}"/><br>
					전체 주문금액  :<fmt:formatNumber pattern="###,###,###" value="${map.allsummoney}"/>
				</td>	
			</tr>			
		</table>
		<input type="hidden" name="count" value="${map.count}">
		<button type="submit" id="btnUpdate">수정</button>
	</form>
	</c:otherwise>
	</c:choose>
	<button type="button" id="btnList">상품목록</button>
		
 		<div class="orderOpen">
 		 	<button type="button" class="orderOpen_bnt">주문 정보 입력</button>
 		 	
 		 	<script>
 				$(".orderOpen_bnt").click(function(){
  				$(".orderInfo").slideDown();
 				$(".orderOpne_bnt").slideUp();
				});      
			</script>
 		</div>
		
		<div class="orderInfo">
 			<form role="form" method="post" autocomplete="off" >
    
		<div class="inputArea">
	   <label for="sender">발송인</label>
	   <input type="text" name="sender" id="sender" required="required" />
	 	 </div>
	 	 
	 	 <div class="inputArea">
	   <label for="rec_name">수령인</label>
	   <input type="text" name="rec_name" id="rec_name" required="required" />
	 	 </div>
    
 		 <div class="inputArea">
  		 <label for="rec_phone">수령인 연락처</label>
  		 <input type="text" name="rec_phone" id="rec_phone" required="required" />
  		</div>
  
	  <div class="inputArea">
	   <label for="rec_address">주소</label>
	   <input type="text" name="rec_address" id="rec_address" required="required" />
	  </div>
	  
	  <div class="inputArea">
	   <button type="submit" class="order_btn">주문</button>
	   <button type="button" class="cancel_btn">취소</button> 
	   <script>
			$(".cancel_btn").click(function(){
 			$(".orderInfo").slideUp();
 			$(".orderOpen_bnt").slideDown();
			});      
		</script>
	  </div>
 </form> 
</div>
</body>
</html>

