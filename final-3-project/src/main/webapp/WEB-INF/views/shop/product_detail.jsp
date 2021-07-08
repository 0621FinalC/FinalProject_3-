<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>hi</title>
 
</head>
<body>
   
    <h2>상품 정보</h2>
    <table>
        <tr>
            <!-- 이미지를 불러오기위한 url 작성 -->
            <td><img src="${path}/images/${dto.picture_url}" width="300px"
                height="300px"></td>
            <td align="center">
                <table>
 
                    <tr>
                        <td>상품명</td>
                        <td>${dto.product_name }</td>
                    </tr>
                    <tr>
                        <td>가격</td>
                        <td>${dto.price }</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>${dto.description }</td>
                    </tr>
                    	<td>                         
                            <a href="${path}/shoppingmall/product/list.do">상품목록</a>
                        </td>
                    </tr>
                </table>
    </table>
</body>
</html>
