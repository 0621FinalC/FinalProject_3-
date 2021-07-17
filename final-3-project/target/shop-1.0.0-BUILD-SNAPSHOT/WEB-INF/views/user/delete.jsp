<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<link href="${pageContext.request.contextPath }/resources/css/user/delete.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/resources/include/header.css" rel="stylesheet" />
<link href=”https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap” rel=”stylesheet”>
<c:url var="main" value="/" />
<c:url var="search_list" value="/product/search" />
<c:url var="delete" value="/user/delete" />
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
	
	function send() {
		var pass = document.getElementById("password");
		if (pass.value == "" || pass.value == undefined) {
			alert("패스워드를 입력하세요.");
			password.focus();
			return;
		}
		// disabled 설정을 submit할때는 풀어준다
		$("input[name=userid]").attr("disabled", false);
		document.deleteInfo.submit();
	}
</script>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<div class="tit_wrap">
		<h3 class="tit">비밀번호를 입력해주세요</h3>
	</div>
	<div class="wrapper">
		<form name="deleteInfo" action="${delete }" method="post">
			<div class="wrap">
				<div class="delete_wrap">
					<label class="del_label_name" for="userid">아이디</label>
			     	<input class="input_box" type="text" name="userid" id="userid" maxlength="20" value="${userData.getUserid() }" disabled>
				</div>
				<div class="delete_wrap">
					<label class="del_label_name" for="password">비밀번호</label>
			      	<input class="input_box" type="password" name="password" id="password" maxlength="20" required>
				</div>
				<div class="error_wrap">
					<label class="error" style="color: red;">${error }</label>
				</div>
				<div class="del_button_wrap">
					<button class="btn_delete" type="button" onclick="send();">탈퇴하기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn_cancel" type="button" onclick="history.go(-1);">취소</button>
				</div>
			</div>
		</form>
	</div>
	<%@ include file="../include/footer.jsp" %>
</body>
</html>