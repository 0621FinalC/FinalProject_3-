<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">	
<title>상품</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/shop/product_detail.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<script type="text/javascript">
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
</script>
</head>
<body>
   	<%@ include file="../include/header.jsp" %>
   	<div class="tit_wrap">
		<h3 class="tit">상품 상세 정보</h3>
	</div>
	<div class="wrapper">
		<div class="wrap">
			<div class="img_table">
				<table class="prod_img">
			        <tr>
			            <!-- 이미지를 불러오기위한 url 작성 -->
			            <c:set var="path" value="${pageContext.request.contextPath}" />
			            <c:set var="picture_url" value="${dto.picture_url }" />
						<c:if test="${fn:contains(picture_url , '[') or fn:contains(picture_url , ']') }">
							<c:set var="picture_url" value="${fn:replace(picture_url, '[', '%5B') }" />
							<c:set var="picture_url" value="${fn:replace(picture_url, ']', '%5D') }" />
						</c:if>
			            <td><img src="${path}/resources/img/product/${picture_url}" width="300px"
			                height="300px"></td>
			            <td align="center">
			    		</td>
			    	</tr>
			    </table>	
			</div>
			<div class="prod_expl_table">
				<br>
				<table class="prod_expl">
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
			             <td>${dto.REGISTERDATE }</td>
			      </tr>
			          
			      <tr>
			            <td>재고</td>
			            <td>${dto.INVENTORY }</td>
			      </tr>
			      <tr class="tr_cart" align="center">
						<td colspan="2">
							<form name="form1" method="post" action="${path}/cart/insert">
								<div class="cart_info">
									<input type="hidden" name="pid" value="${dto.PID}">
									<select name="cartqty">
										<c:forEach begin="1" end="10" var="i">
											<option value="${i}">${i}</option>
										</c:forEach>
									</select>&nbsp;개 <br><br>
									<input class="btn_cart" type="submit" value="장바구니에 담기">
									&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn_prod_list" type="button" onclick="location.href='${path}/product/list.do'">상품목록</button>
								</div>
							</form>
						</td>
					</tr>
			    </table>
			</div>
		</div>
	</div>
	<!-- footer 위치 문제로 여기서만 include 안함 -->
   <div class="footer">
	      <a href="#"><img src="${pageContext.request.contextPath }/resources/img/footer/insta.png"></a>
	      <a href="#"><img src="${pageContext.request.contextPath }/resources/img/footer/call.png"></a>
	      <a href="#"><img src="${pageContext.request.contextPath }/resources/img/footer/mail.png"></a>
	</div>
</body>
</html>