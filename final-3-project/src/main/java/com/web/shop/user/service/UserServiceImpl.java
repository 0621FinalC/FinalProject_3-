package com.web.shop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.user.dto.UserDTO;
import com.web.shop.user.repository.UserRepositoryImpl;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import com.web.shop.user.repository.*;
import com.web.shop.user.dto.*;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	UserRepository userrepository;
	
	// 01_01. 회원 로그인체크
	@Override
	public boolean loginCheck(UserDTO dto, HttpSession session) throws Exception {
		boolean result = userrepository.loginCheck(dto);
		if (result) { // true일 경우 세션에 등록
			UserDTO dto2 = viewMember(dto);
			// 세션 변수 등록
			session.setAttribute("userid", dto2.getUserid());
			session.setAttribute("username", dto2.getUsername());
		} 
		return result;
	}
	// 01_02. 회원 로그인 정보
	@Override
	public UserDTO viewMember(UserDTO dto) {
		return userrepository.viewMember(dto);
	}
	// 02. 회원 로그아웃
	@Override
	public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("userId");
		// 세션 정보를 초기화 시킴
		session.invalidate();
	}
}