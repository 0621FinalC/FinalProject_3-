package com.web.shop.cart.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Qualifier;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.cart.dto.*;

@Repository
public class CartRepositoryImpl implements CartRepository {
	
	  @Inject
	  private SqlSession sqlSession;
	  
	  public CartRepositoryImpl(){}
	  
	  public CartRepositoryImpl(SqlSession sqlSession) {
		  this.sqlSession = sqlSession;
	  }
	
	  // 장바구니 추가
	  @Override
	  public void insert(CartDTO dto) throws Exception {
		  sqlSession.insert("cart.insert", dto);
	  } 
	 
	  // 장바구니 삭제
	  @Override
	  public void delete(Integer cid) throws Exception {
		  sqlSession.delete("cart.delete", cid);
	  }
	  
	  // 장바구니 수정
	  @Override
	  public void modify(CartDTO dto) throws Exception {
		  sqlSession.update("cart.modify", dto);
		  
	  }
	 
	  // 장바구니 수량 변경
	  @Override
	  public void update(CartDTO dto) throws Exception {
		  sqlSession.update("cart.update", dto);
		  
	  }
	  
	  // 장바구니 같은 상품 확인
	  @Override
	  public int countCart(Integer pid, String userid) {
		  Map<String, Object> map = new HashMap<String, Object>();
		  map.put("pid", pid);
		  map.put("userid", userid);
		  return sqlSession.selectOne("cart.countCart", map);
	  } 
	  
	  // 장바구니 목록
	  @Override
      public List<CartDTO> listCart(String userid) throws Exception {
		  return sqlSession.selectList("cart.listCart", userid);
	  }
	  
	  // 장바구니 금액 합계
	  @Override
	  public int sumtotalmoney(String userid) {
		  sqlSession.selectOne("cart.sumtotalmoney",userid);
		  return sqlSession.selectOne("cart.sumtotalmoney", userid);
	  }
		  
}
