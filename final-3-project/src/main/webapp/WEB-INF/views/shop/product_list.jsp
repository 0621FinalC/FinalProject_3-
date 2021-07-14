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

</head>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>

<body>

<h2>상품 목록</h2>

<table border="1" width="1000px">
    <tr>
        <th>상품ID</th>
        <th>카테고리</th>
        <th>이미지</th>
        <th>상품</th>
        <th>가격</th>
        <th>등록일자</th>
        <th>재고</th>
    </tr>

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
        <td><a href="${path}/product/detail/${row.PID}">${row.PRODUCTNAME}</a></td>
        <td><fmt:formatNumber value="${row.PRICE}" type="currency" /> </td>    
        <td>${row.REGISTERDATE }</td>
        <td>${row.INVENTORY }</td>
    </tr>
</c:forEach>
</table>
</body>
</html>