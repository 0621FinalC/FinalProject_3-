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
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="userid_check" value="/ajax/userid" />
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
	<%@ include file="../include/header.jsp" %>
	<div>
		<h3 class="tit">회원가입</h3>
	</div>
	<div class="wrapper">
		<form name="userInfo" action="${join }" method="post">
			<div class="wrap">
			<div class="join_wrap">
				<label class="join_name" for="userid">아이디</label>
	       	 	<input class="input_box" type="text" name="userid" id="userid" maxlength="16" placeholder="영문 최대 20자 까지 가능" required>
	       	 	<button class="id_check_btn" type="button" onclick="idCheck();">중복확인</button>
				<label id="id_check_res"></label>
			</div>
			
			<div class="join_wrap">
				<label class="join_name" for="userpass">비밀번호</label>
	       	 	<input class="input_box" type="password" name="password" id="pass1" maxlength="20" required>
			</div>
			
			<div class="join_wrap">
				<label class="join_name" for="userpass2">비밀번호 확인</label>
				<input class="input_box" type="password" name="password2" id="pass2" maxlength="20" required>
			</div>
		
			<div class="join_wrap">
				<label class="join_name" for="name">이름</label>
				<input class="input_box" type="text" name="username" id="username" maxlength="20" required>
			</div>
			
			<div class="join_wrap">
				<label class="join_name" for="email">이메일</label>
				<input class="input_box" type="email" name="email" id="email" maxlength="50" required>
			</div>
			
			<div class="join_wrap">
				<label class="join_name" for="gender">성별</label>
				<input id="gender_m" type="radio" name="gender" value="m" checked><label for="gender_m"> 남</label>
				<input id="gender_w" type="radio" name="gender" value="w"><label for="gender_w"> 여</label>
			</div>
			
			<div class="join_wrap">
				<label class="join_name" for="phone">핸드폰 번호</label>
				<input class="input_box" type="text" name="phone" id="phone" maxlength="20" placeholder="(-) 입력해주세요" required>
			</div>	
			
			<div class="join_wrap">
				<label class="join_name" for="address">주소</label>
				<input class="input_box" type="text" name="address" id="address" maxlength="100" required>
			</div>
	
			<br>
			<div class="join_button_wrap">
				<button class="join_button" type="button" onclick="send();">가입하기</button>
				<!--  취소 버튼 주석처리 디자인 고민
				<button type="button" onclick="history.back();">취소</button>-->
			</div>
			
			</div>		
		</form>
		
	</div>
	<%-- <div class="join-form">
		<form name="userInfo" action="${join }" method="post">
			<div>
				<label for="userid">아이디</label>
	       	 	<input type="text" name="userid" id="userid" maxlength="20" placeholder="영문 최대 20자 까지 가능" required>
	       	 	<button type="button" onclick="idCheck();">중복확인</button>
				<label id="id_check_res"></label>
			</div>
			
			<div>
				<label for="userpass">비밀번호</label>
	       	 	<input type="password" name="password" id="pass1" maxlength="20" required>
			</div>
			
			<div>
				<label for="userpass2">비밀번호 확인</label>
				<input type="password" name="password2" id="pass2" maxlength="20" required>
			</div>
		
			<div>
				<label for="username">이름</label>
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
	</div> --%>
</body>
</html>