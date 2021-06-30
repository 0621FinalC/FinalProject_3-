package com.web.shop.cart.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.cart.dto.*;

@Repository
public class CartRepositoryImpl implements CartRepository {
	
	  @Autowired
	  private SqlSession sqlSession;
	
	  @Override
	  public void insert(CartDTO dto) throws Exception {
		  sqlSession.insert("cart.insert",dto);
	  } 
	 
	  /*
	  @Override
	  public List<CartDTO> listCart(String userid) throws Exception {
		  return sqlSession.selectList("cart.listCart",userid);
	  }
	 
	  @Override
	  public void delete(int cart_id) throws Exception {
		  sqlSession.delete("cart.delete", cart_id);
	  }
	 
	  @Override
	  public void update(int cart_id) throws Exception {
	      sqlSession.update("cart.update", cart_id);
	 
	  }
	 
	  @Override
	  public int sumMoney(String userid) {
	      return sqlSession.selectOne("cart.sumMoney", userid);
	  }
	  
	  @Override
	  public int countCart(String userid) {
	      return sqlSession.selectOne("cart.countCart", userid);
	  */
	  }

