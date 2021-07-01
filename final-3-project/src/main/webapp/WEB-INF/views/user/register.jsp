<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<!-- 헤드 부분 -->
<body class="hold-transition register-page">
	<div class="register-box">
		<div class="register-logo">
			<a href="${path}/"><b>Shop</b>Food</a>
		</div>
		<!-- 다른 회원가입 칸들 미작성 상태 -->
		<div class="card">
			<div class="card-body register-card-body">
				<p class="login-box-msg">새로운 00회원가입</p>
				<form action="${path}/user/register" method="post">
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
						<input type="text" name="username" class="form-control"
							placeholder="이름">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="email" name="useremail" class="form-control"
							placeholder="이메일">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-envelope"></span>
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
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="비밀번호 확인">
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="agreeTerms" name="terms"
									value="agree"> <label for="agreeTerms"><a href="#">약관</a>에 동의합니다.
								</label>
							</div>
						</div>
						<!-- /.col -->
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block">Register</button>
						</div>
						<!-- /.col -->
					</div>
				</form>
				<a href="${path}/user/login" class="text-center">I already have
					a membership</a>
			</div>
			<!-- /.form-box -->
		</div>
		<!-- /.card -->
	</div>
	<!-- /.register-box -->
	<!-- 헤드 부분 -->
	<script> $(function () { $('input').iCheck({ checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue', increaseArea: '20%'
		}); 
	}); 
	</script>
	}
</body>
</html>