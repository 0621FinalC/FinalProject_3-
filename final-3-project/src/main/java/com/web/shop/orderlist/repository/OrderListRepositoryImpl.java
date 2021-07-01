package com.web.shop.orderlist.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.OrderListDTO;

@Repository
public class OrderListRepositoryImpl implements OrderListRepository {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderDTO> selectAll(String userid) throws Exception {
		return sqlSession.selectList("orderlistMapper.all", userid);
	}

}
