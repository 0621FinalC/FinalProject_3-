<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
        <td><img src="${path}/images/${row.picture_url}" width="100" height="100"></td>
        <td><a href="${path}/shop/product/detail/${row.PID}">${row.PRODUCTNAME}</a></td>
        <td><fmt:formatNumber value="${row.PRICE}" type="currency" /> </td>    
        <td>${row.REGISTER }</td>
        <td>${row.INVENTORY }</td>
    </tr>
</c:forEach>
</table>
</body>
</html>
