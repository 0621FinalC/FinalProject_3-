<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<!-- 헤드 부분 -->
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="${path}/"><b>Shop</b>Food</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">로그인을 부탁드립니다.</p>
				<form action="${path}/user/loginPost" method="post">
					<div class="input-group mb-3">
						<input type="text" name="userid" class="form-control"
							placeholder="아아디">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-exclamation"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" name="password" class="form-control"
							placeholder="비밀번호">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="remember"> <label
									for="remember"> 아이디 기억하기 </label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Sign
								In</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
				<p class="mb-1">
					<a href="#">비밀번호를 잃어버렸습니다.</a>
				</p>
				<p class="mb-0">
					<a href="${path}/user/register" class="text-center">
					새로운 회원가입</a>
				</p>
			</div>
			<!-- /.login-card-body -->
		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->
	<!-- 헤드 부분 -->
	<script> 
	var msg = "${msg}";
	if (msg === "REGISTERED") {
		alert("회원가입이 완료되었습니다. 로그인해주세요~"); 
	} else if (msg == "FAILURE") {
		alert("아이디와 비밀번호를 확인해주세요.");
	}
	$(function () {
		$('input').iCheck({
			checkboxClass: 'icheckbox_square-blue', 
			radioClass: 'iradio_square-blue', 
			increaseArea: '20%' // optional 
			}); 
		}); 
	</script>
</body>
</html>
