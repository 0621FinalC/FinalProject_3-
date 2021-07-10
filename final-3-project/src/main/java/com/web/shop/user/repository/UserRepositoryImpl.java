package com.web.shop.user.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.user.dto.UserDTO;

@Repository
public class UserRepositoryImpl implements UserRepository {
	
	@Autowired
	SqlSession sqlSession;
	
	public UserDTO checkUser(UserDTO dto) throws Exception {
		return sqlSession.selectOne("userMapper.checkLogin", dto);
	}
	
	public int userId(String userid) throws Exception {
		return sqlSession.selectOne("userMapper.checkUserid", userid);
	}
	
	public boolean insert(UserDTO dto) throws Exception {
		boolean result = false;
		int rs = sqlSession.insert("userMapper.insertUser", dto);
		if(rs == 1) {
			result = true;
		}
		return result;
	}
	
	public UserDTO readUser(String userid) throws Exception {
		return sqlSession.selectOne("userMapper.readUser", userid);
	}
}