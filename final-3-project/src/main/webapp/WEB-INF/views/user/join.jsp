<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/user/join.css" rel="stylesheet" />
<c:url var="userid_check" value="/ajax/userid" />
<script type="text/javascript">
	function idCheck() {
		var userid = document.getElementById("userid").value;
		if(userid == "" || userid == undefined) {
			alert("아이디를 입력하세요.");
			document.getElementById("userid").focus();
			return;
		}
		$.ajax({
			url: "${userid_check }",
			type: "get",
			datatype: "json",
			data: {
				userid: document.getElementById("userid").value
			},
			success: function(data) {
				if(data.result == false) {
					document.getElementById("id_check_res").innerText = "사용 가능한 아이디 입니다.";
				} else {
					document.getElementById("id_check_res").innerText = "이미 사용중인 아이디 입니다.";
				}
			}
		});
	}
    
	function send() {
		var id_check = document.getElementById("id_check_res").innerText;
		if(id_check == "" || id_check == undefined) {
			alert("아이디 중복확인을 먼저 진행하세요.");
			document.getElementById("userid").focus();
			return;
		} else if(id_check != "사용 가능한 아이디 입니다.") {
			alert("해당 아이디로는 가입을 할 수 없습니다.");
			document.getElementById("userid").focus();
			return;
		}
		
		var pass1 = document.getElementById("pass1");
		var pass2 = document.getElementById("pass2");
		if (pass1.value == "" || pass1.value == undefined) {
			alert("패스워드를 입력하세요.");
			pass1.focus();
			return;
		}
		
		if(pass1.value != pass2.value){
			alert("패스워드를 동일하게 입력하세요.");
			pass2.focus();
			return;
		}
		
		document.userInfo.submit();
	}
	
</script>
</head>
<c:url var="join" value="/user/join" />
<body>
	<div class="join-form">
		<form name="userInfo" action="${join }" method="post">
			<div>
				<label for="userid">아이디</label>
	       	 	<input type="text" name="userid" id="userid" maxlength="20" placeholder="영문 최대 20자 까지 가능" required>
	       	 	<button type="button" onclick="idCheck();">중복확인</button>
				<label id="id_check_res"></label>
			</div>
			
			<div>
				<label for="userpass">비밀번호</label>
	       	 	<input type="password" name="password" id="pass1" maxlength="20" placeholder="영문 최대 20자 까지 가능" required>
			</div>
			
			<div>
				<label for="userpass2">비밀번호 확인</label>
				<input type="password" name="password2" id="pass2" maxlength="20" required>
			</div>
		
			<div>
				<label for="name">이름</label>
				<input type="text" name="username" id="username" maxlength="20" required>
			</div>
			
			<div>
				<label for="email">이메일</label>
				<input type="email" name="email" id="email" maxlength="50" required>
			</div>
			
			<div>
				<label for="gender">성별</label>
				<input id="gender_m" type="radio" name="gender" value="m" checked><label for="gender_m"> 남</label>
				<input id="gender_w" type="radio" name="gender" value="w"><label for="gender_w"> 여</label>
			</div>
			
			<div>
				<label for="phone">핸드폰 번호</label>
				<input type="text" name="phone" id="phone" maxlength="20" placeholder="(-) 입력해주세요" required>
			</div>	
			
			<div>
				<label for="address">주소</label>
				<input type="text" name="address" id="address" maxlength="100" required>
			</div>
	
			<br>
			<button class="btn_join" type="button" onclick="send();">가입</button>
			<button type="button" onclick="history.back();">취소</button>
		</form>
	</div>
</body>
</html>