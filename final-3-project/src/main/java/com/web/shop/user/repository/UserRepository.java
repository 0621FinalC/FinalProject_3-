package com.web.shop.user.repository;

import javax.servlet.http.HttpSession;

import com.web.shop.user.dto.UserDTO;

public interface UserRepository {
	// 01_01. 회원 로그인 체크
		public boolean loginCheck(UserDTO dto) throws Exception;
		// 01_02. 회원 로그인 정보
		public UserDTO viewMember(UserDTO dto);
		// 02. 회원 로그아웃
		public void logout(HttpSession session);
}