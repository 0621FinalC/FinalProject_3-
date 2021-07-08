package com.web.shop.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.user.dto.UserDTO;
import com.web.shop.user.repository.UserRepositoryImpl;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepositoryImpl dao;
	
	public void login(UserDTO dto) throws Exception {
		UserDTO data = dao.checkUser(dto);
		if (data != null) {
			// 로그인 성공시
			dto.setUserid(data.getUserid());
			dto.setUsername(data.getUsername());
			dto.setPassword("");
			dto.setGender(data.getGender());
			dto.setEmail(data.getEmail());
			dto.setPhone(data.getPhone());
			dto.setAddress(data.getAddress());
			dto.setRegisterdate(data.getRegisterdate());
		} else {
			// 로그인 실패시
			dto.setUserid("");
			dto.setPassword("");
		}
	}
	
	public boolean checkUserid(String userid) throws Exception {
		// 사용중인 아이디를 찾는 메소드
		// 사용중이면 true, 사용하지 않으면 false 반환
		boolean result = true;
		int rs = dao.userId(userid);
		if(rs == 0) {
			result = false;
		}
		return result;
	}
	
	public boolean join(UserDTO dto) throws Exception {
		return dao.insert(dto);
	}
}
