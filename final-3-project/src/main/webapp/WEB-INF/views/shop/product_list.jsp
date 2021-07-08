<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv = "Content=Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>

$(function(){   
    $("#btnAdd").click(function(){
        location.href = "${path}/shoppingmall/product/write.do";
    });
});

</script>
</head>
<body>
	
	<h2>상품목록</h2>
	<button type = "button" id = "btnAdd">상품등록</button>
		<table border = "1" width = "500px">
		    <tr>
		        <th>상품ID</th>
		        <th>상품사진</th>
		        <th>상품명</th>
		        <th>가격</th>
		    </tr>
			<c:forEach var="row" items="${list }"> 
			    <tr align = "center">
			    <td>${row.product_id }</td>
			    <td><img src="${path }/images/${row.picture_url}"
			    width="100" height = "100"></td>
			     <td>
			    <a href = "${path }/shoppingmall/product/detail/${row.product_id}">
			    ${row.product_name }</a> 
			    </td>

			    <td>
			    <fmt:formatNumber value="${row.price}" pattern="#,###" /> </td>
			    <!-- 가격을 표시하기 위해서 사용함. 0이 3개 있을 때마다 ,를 하나씩 찍게 한다. -->
			    </tr>
			    
			</c:forEach>
		</table>
	</body>
</html>
