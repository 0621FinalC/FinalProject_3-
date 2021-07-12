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

<table border="1" width="500px">
    <tr>
        <th>상품ID</th>
        <th>이미지</th>
        <th>상품</th>
        <th>가격</th>
    </tr>

<c:forEach var="row" items="${list}">
<c:set var="path" value="${pageContext.request.contextPath}" />
    <tr align="center">
        <td>${row.product_id}</td>
        <td><img src="${path}/images/${row.picture_url}" width="100" height="100"></td>
        <td><a href="${path}/shop/product/detail/${row.product_id}">${row.product_name}</a></td>
        <td><fmt:formatNumber value="${row.price}" type="currency" /> </td>    
    </tr>
</c:forEach>
</table>
</body>
</html>
