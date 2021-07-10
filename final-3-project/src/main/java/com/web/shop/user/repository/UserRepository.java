package com.web.shop.user.repository;

import com.web.shop.user.dto.UserDTO;

public interface UserRepository {
	public UserDTO checkUser(UserDTO dto) throws Exception;
	public int userId(String userid) throws Exception;
	public boolean join(UserDTO dto) throws Exception;
	public UserDTO readUser(String userid) throws Exception;
	public boolean updateUser(UserDTO dto) throws Exception;
	public boolean deleteUser(UserDTO dto) throws Exception;
}