package com.web.shop.user.repository;

import com.web.shop.user.dto.UserDTO;

public interface UserRepository {
	public UserDTO checkUser(UserDTO dto) throws Exception;
}
