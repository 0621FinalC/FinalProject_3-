<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<link href="${pageContext.request.contextPath }/resources/css/shop/product_list.css" rel="stylesheet" />
</head>
<body>
<div class="content_wrap">
    <h3 class="tit">상품목록</h3>
    <div class="product_table_wrap">
    <table class="product_table">
    <thead>
    <tr>
        <td class="th_column_1">상품ID</td>
        <td class="th_column_2">카테고리</td>
        <td class="th_column_3">이미지</td>
        <td class="th_column_4">상품</td>
        <td class="th_column_5">가격</td>
        <td class="th_column_6">등록일자</td>
        <td class="th_column_7">재고</td>
    </tr>
    </thead>
<c:forEach var="row" items="${list}">
<c:set var="path" value="${pageContext.request.contextPath}" />
    <tr align="center">
        <td>${row.PID}</td>
        <td>${row.CATEGORY }</td>
        <!-- [ ] 처리 -->
        <c:set var="picture_url" value="${row.picture_url }" />
		<c:if test="${fn:contains(picture_url , '[') or fn:contains(picture_url , ']') }">
			<c:set var="picture_url" value="${fn:replace(picture_url, '[', '%5B') }" />
			<c:set var="picture_url" value="${fn:replace(picture_url, ']', '%5D') }" />
		</c:if>
        <td><img src="${path}/resources/img/product/${picture_url}" width="100" height="100"></td>
        <td><a href="${path}/shop/product/detail/${row.PID}">${row.PRODUCTNAME}</a></td>
        <td><fmt:formatNumber value="${row.PRICE}" type="currency" /> </td>    
        <td>${row.REGISTERDATE }</td>
        <td>${row.INVENTORY }</td>
    </tr>
</c:forEach>
</table>
</div>
</div>
</body>
</html>