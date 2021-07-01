package com.web.shop.user;

import java.sql.Date;

public interface UserService {
	
	//회원가입 처리
	void register(UserVO userVO) throws Exception;
	
	//로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	//로그인 유지 메소드
	void keepLogin(String userId, String sessionId, Date next) throws Exception;
	
	// 회원정보 조회 메소드
	UserVO checkLoginBefore(String value) throws Exception;

}
