package com.web.shop.order.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.order.dto.OrderDTO;

@Repository
public class OrderRepositoryImpl {
	
	@Autowired
	SqlSession sqlSession;
	
	// 상품 주문 내역
	public OrderDTO checkOrder(OrderDTO dto) throws Exception{
		return sqlSession.selectOne("orderMapper.checkOrder", dto);
	}
}
