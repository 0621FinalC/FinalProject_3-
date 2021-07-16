<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품장바구니 목록페이지</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/shop/cartList.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script>
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
	
	$(document).ready(function(){
		// 리스트 페이지로 이동
		$("#btnList").click(function(){
			location.href="${path}/product/list";
		});
	});
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
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
			<c:set var="sum" value="0" />
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
			<c:set var="sum" value="${map.allsummoney}"/>
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
		<div class="listResult">
 		<div class="sum">
  			총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
 		</div>
 		<div class="orderOpen">
 		 	<button type="button" class="orderOpen_bnt">주문 정보 입력</button>
 		 	
 		 	<script>
 				$(".orderOpen_bnt").click(function(){
  				$(".orderInfo").slideDown();
 				$(".orderOpne_bnt").slideUp();
				});      
			</script>
 		</div>
		</div>
		
		<div class="orderInfo">
		<c:url var="insertOrderInfo" value="/order/insertOrderInfo" />
 		<form role="form" method="post" autocomplete="off" action="${path}/order/insertOrderInfo" >
    
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
		   <input type="hidden" name="shipping_fee" id="shipping_fee" value="${map.charge}"  />
		  </div>
		  
		  <div class="inputArea">
		   <button type="submit" class="order_btn">주문</button>
		   <button type="button" class="cancel_btn">주문 정보 입력 가리기</button> 
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