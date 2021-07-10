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
</head>
<script type="text/javascript">
function updateInfo() {
	// 일단 다른 체크하는기능은 빼고 구현 - 시간되면 구현할 것
	document.updateInfo.submit();
}

function expire() {
	$.ajax({
		url: "${expire }",
		type: "post",
		datatype: "json",
		data: {
			id: document.getElementById("userid").value
		},
		success: function(data) {
			if(data.res == "success") {
				alert("탈퇴 처리가 완료되었습니다.")
				location.href = "${pageContext.request.contextPath }/user/logout"
			} else {
				alert("탈퇴 처리에 실패하였습니다.")
			}
		}
	});
}
</script>
<c:url var="update" value="/user/info" />
<body>
	<h2>회원 정보</h2>
	<div class="info-form">
		<form name="updateInfo" action="${update }" method="post">
			<div>
				<label for="userid">아이디</label>
	       	 	<input type="text" name="userid" id="userid" maxlength="20" value="${userData.getUserid() }" disabled>
			</div>
			
			<div>
				<label for="username">이름</label>
				<input type="text" name="username" id="username" value="${userData.getUsername() }" disabled>
			</div>
			
			<div>
				<label for="email">이메일</label>
				<input type="email" name="email" id="email" value="${userData.getEmail() }">
			</div>
			
			<div>
				<!-- userData.getGender() == 'w' 이렇게 그냥 쓰면 데이터타입이 다르다는 에러가 남 -->
				<label for="gender">성별</label>
				<input id="gender_m" type="radio" name="gender" value="m" ${fn:contains(userData.getGender(), 'm') ? "checked" : "" }><label for="gender_m">남</label>
				<input id="gender_w" type="radio" name="gender" value="w" ${fn:contains(userData.getGender(), 'w') ? "checked" : "" }><label for="gender_w">여</label>
			</div>
			
			<div>
				<label for="phone">핸드폰 번호</label>
				<input type="text" name="phone" id="phone" value="${userData.getPhone() }">
			</div>	
			
			<div>
				<label for="address">주소</label>
				<input type="text" name="address" id="address" value="${userData.getAddress() }">
			</div>
	
			<br>
			<button class="btn_update" type="button" onclick="updateInfo();">회원정보수정</button>
			<button type="button" onclick="expire();">회원탈퇴</button>
		</form>
	</div>
</body>
</html>