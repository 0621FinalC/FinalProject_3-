<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>상품</title>
 
</head>
<body>
   
    <h2>상품 정보</h2>
    <table>
        <tr>
            <!-- 이미지를 불러오기위한 url 작성 -->
            <c:set var="path" value="${pageContext.request.contextPath}" />
            <td><img src="${path}/images/${dto.picture_url}" width="300px"
                height="300px"></td>
            <td align="center">
                <table>
 
 					<tr>
                        <td>종류</td>
                        <td>${dto.CATEGORY }</td>
                    </tr>
                    <tr>
                        <td>상품명</td>
                        <td>${dto.PRODUCTNAME }</td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td><fmt:formatNumber value="${dto.PRICE}" type="currency" /></td>
                    </tr>
                    <tr>
                        <td>상품설명</td>
                        <td>${dto.EXPLANATION }</td>
                    </tr>
                    <tr>
                    	<td>등록일자</td>
                    	<td>${dto.REGISTER }</td>
                    </tr>
                  
                    <tr>
                    	<td>재고</td>
                    	<td>${dto.INVENTORY }</td>
                    </tr>
                    
                    <tr>
                    	<td>                         
                            <a href="${path}/shop/product/list.do">상품목록</a>
                        </td>
                    </tr>
                </table>
    </table>
</body>
</html>
