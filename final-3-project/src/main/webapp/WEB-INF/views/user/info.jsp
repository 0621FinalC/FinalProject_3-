<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기 및 수정</title>
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/user/info.css" rel="stylesheet" />
<c:url var="update" value="/user/info" />
<c:url var="delete" value="/user/delete" />
<c:url var="home" value="/main"/>
<script type="text/javascript">
function send() {
	// disabled 설정을 submit할때는 풀어준다 (안풀어주면 userid에 null이 들어가고 그러면 user.xml의 updateUser에서 WHERE절 비교 불가)
	$("input[name=userid]").attr("disabled", false);
	$("input[name=username]").attr("disabled", false);
	document.updateInfo.submit();
}
</script>
</head>
<body>
	<h2 class="tit">회원 정보</h2>
	<div class="info-form">
		<form name="updateInfo" action="${update }" method="post">
			<div>
				<label for="userid" class="info_name">아이디</label>
	       	 	<input class="info_box" type="text" name="userid" id="userid" maxlength="20" value="${userData.getUserid() }" disabled>
			</div>
			
			<div>
				<label for="username" class="info_name">이름</label>
				<input class="info_box" type="text" name="username" id="username" value="${userData.getUsername() }" disabled>
			</div>
			
			<div>
				<label for="email" class="info_name">이메일</label>
				<input class="info_box" type="email" name="email" id="email" value="${userData.getEmail() }">
			</div>
			
			<div>
				<!-- userData.getGender() == 'w' 이렇게 그냥 쓰면 데이터타입이 다르다는 에러가 남 -->
				<label for="gender" class="info_name">성별</label>
				<input id="gender_m" type="radio" name="gender" value="m" ${fn:contains(userData.getGender(), 'm') ? "checked" : "" }><label for="gender_m">남</label>
				<input id="gender_w" type="radio" name="gender" value="w" ${fn:contains(userData.getGender(), 'w') ? "checked" : "" }><label for="gender_w">여</label>
			</div>
			
			<div>
				<label for="phone" class="info_name">핸드폰 번호</label>
				<input class="info_box" type="text" name="phone" id="phone" value="${userData.getPhone() }">
			</div>	
			
			<div>
				<label for="address" class="info_name">주소</label>
				<input class="info_box" type="text" name="address" id="address" value="${userData.getAddress() }">
			</div>
			<div>
				<label style="color: red;">${error }</label>
			</div>
			<br>
			<button class="btn_update" type="button" onclick="send();">회원정보수정</button>
			<button type="button" onclick="location.href='${delete}'">회원탈퇴</button>
			<button type="button" onclick="location.href='${home}'">홈으로 돌아가기</button>
		</form>
	</div>
</body>
</html>