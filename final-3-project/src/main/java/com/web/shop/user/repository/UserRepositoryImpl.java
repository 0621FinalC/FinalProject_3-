package com.web.shop.user.repository;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.user.dto.UserDTO;

@Repository
public class UserRepositoryImpl implements UserRepository {
	
	// SqlSession 객체를 스프핑에서 생성하여 주입
		// 의존관계 주입(Dependency Injection), 느슨한 결합
		@Inject
		SqlSession sqlSession; // mybatis 실행 객체
		
		// 01_01. 회원 로그인체크
		@Override
		public boolean loginCheck(UserDTO dto) throws Exception {
			String name = sqlSession.selectOne("user.loginCheck", dto);
			return (name == null) ? false : true;
		}
		// 01_02. 회원 로그인 정보
		@Override
		public UserDTO viewMember(UserDTO dto) {
			return sqlSession.selectOne("user.viewMember", dto);
		}
		// 02. 회원 로그아웃
		@Override
		public void logout(HttpSession sessin) {
		}
	}