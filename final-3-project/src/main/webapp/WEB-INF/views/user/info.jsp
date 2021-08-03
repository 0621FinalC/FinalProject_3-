<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기 및 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/user/info.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<c:url var="update" value="/user/info" />
<c:url var="delete" value="/user/delete" />
<c:url var="home" value="/"/>
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
		var searchKeyword = $('#keyword').val();
		url += "?keyword=" + encodeURIComponent(searchKeyword);
		location.href = url;
		console.log(url);
	});
})

function send() {
	// disabled 설정을 submit할때는 풀어준다 (안풀어주면 userid에 null이 들어가고 그러면 user.xml의 updateUser에서 WHERE절 비교 불가)
	$("input[name=userid]").attr("disabled", false);
	$("input[name=username]").attr("disabled", false);
	document.updateInfo.submit();
}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="tit_wrap">
		<h3 class="tit">회원정보</h3>
	</div>
	<div class="wrapper">
		<form name="updateInfo" action="${update }" method="post">
			<div class="wrap">
				<div class="info_wrap">
					<label class="info_label_name" for="userid">아이디</label>
		       	 	<input class="input_box" type="text" name="userid" id="userid" maxlength="20" value="${userData.getUserid() }" disabled>
				</div>
				
				<div class="info_wrap">
					<label class="info_label_name" for="username">이름</label>
					<input class="input_box" type="text" name="username" id="username" value="${userData.getUsername() }" disabled>
				</div>
				
				<div class="info_wrap">
					<label class="info_label_name" for="email">이메일</label>
					<input class="input_box" type="email" name="email" id="email" value="${userData.getEmail() }">
				</div>
				
				<div class="info_wrap">
					<!-- userData.getGender() == 'w' 이렇게 그냥 쓰면 데이터타입이 다르다는 에러가 남 -->
					<label class="info_label_name" for="gender">성별</label><br>
					<input id="gender_m" type="radio" name="gender" value="m" ${fn:contains(userData.getGender(), 'm') ? "checked" : "" }><label for="gender_m">남</label>
					<input id="gender_w" type="radio" name="gender" value="w" ${fn:contains(userData.getGender(), 'w') ? "checked" : "" }><label for="gender_w">여</label>
				</div>
				
				<div class="info_wrap">
					<label class="info_label_name" for="phone">핸드폰 번호</label>
					<input class="input_box" type="text" name="phone" id="phone" value="${userData.getPhone() }">
				</div>	
				
				<div class="info_wrap">
					<label class="info_label_name" for="address">주소</label>
					<input class="input_box" type="text" name="address" id="address" value="${userData.getAddress() }">
				</div>
				<div class="error_wrap">
					<label class="error" style="color: red;">${error }</label>
				</div>
				<br>
				<div class="info_button_wrap">
					<button class="btn_update" type="button" onclick="send();">회원정보수정</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn_delete" type="button" onclick="location.href='${delete}'">회원탈퇴</button>
					<%-- <button class="btn_home" type="button" onclick="location.href='${home}'">홈으로 돌아가기</button> --%>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>