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
}
