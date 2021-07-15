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
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/orderlist/ordermain.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<script type="text/javascript">
	// 검색: url에 키워드 붙여주는 함수
	$(document).ready(function(){
		$("#btn_search").click(function(){
			// url 붙여주기
			var url = "${search_list }";
			url += "?keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url); // 콘솔에 출력해서 확인
		});
	})
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<h1>주문 내역</h1>
	<h4>지난 3년간의 주문 내역 조회가 가능합니다.</h4>
	<div>
		<c:set var="nowYear" value="<%=new java.util.Date() %>"/>
		<c:set var="year"><fmt:formatDate value="${nowYear }" pattern="yyyy" /></c:set>
		<form action="${pageContext.request.contextPath }/order/list" method="get">
			<select name="year" onchange="submit();">
				<option value="0" ${empty param.year ? "selected" : ""}>전체기간</option>
				<option value="${year }" ${param.year eq year ? "selected" : ""}>${year }</option>
				<option value="${year - 1 }" ${param.year eq year-1 ? "selected" : ""}>${year - 1 }</option>
				<option value="${year - 2 }" ${param.year eq year-2 ? "selected" : ""}>${year - 2 }</option>
			</select>
		</form>
	</div>
	<div class="orderlist_main">
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
						<fmt:parseDate var="dateString" value="${order.getOrderdate() }" pattern="yyyy-MM-dd HH:mm:ss.S" />
						<fmt:formatDate var="orderDate" value="${dateString }" pattern="yyyy.MM.dd (HH시 mm분)" />
						<td>${orderDate }</td>
						
						<c:set var="pname" value="${order.getProductname() }" />
						<c:choose>
							<c:when test="${fn:contains(pname , '외') }">
								<c:set var="pname" value="${fn:substringBefore(pname, ' 외') }"/>
								<!-- <script>
									console.log("${pname}");
								</script> -->
								
							</c:when>
							
							<c:when test="${fn:contains(pname , '[') or fn:contains(pname , ']') }">
								<c:set var="pname" value="${fn:replace(pname, '[', '%5B') }" />
								<c:set var="pname" value="${fn:replace(pname, ']', '%5D') }" />
							</c:when>
						</c:choose>
						
						<td><img src="../resources/img/product/${pname }.jpg"></td>
						<td><a href="${detail }?ordno=${order.getOid() }">${order.getProductname() }</a></td>
						<td>${order.getOid() }</td>
						<td><fmt:formatNumber value="${order.getTotalprice() }" />원</td>
						<td>${order.getOrderstat() }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div>
		<c:set var="st_page" value="${st_page_num }"/>
		<c:set var="ed_page" value="${ed_page_num }"/>
		<c:set var="page_num" value="${page }"/>

		<c:forEach var="p" begin="${st_page }" end="${ed_page }" step="1">
			<c:choose>
				<c:when test="${p eq page_num }">
					<a style="color: red;">[${p }]</a>
				</c:when>

				<c:otherwise>
					<a href="<%=request.getContextPath() %>/order/list?page=${p }">[${p }]</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>