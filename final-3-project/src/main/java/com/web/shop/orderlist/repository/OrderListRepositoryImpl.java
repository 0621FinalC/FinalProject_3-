package com.web.shop.orderlist.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

@Repository
public class OrderListRepositoryImpl implements OrderListRepository {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<OrderDTO> selectAll(String userid, int year) throws Exception {
		HashMap<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("year", year);
		
		return sqlSession.selectList("orderlistMapper.all", params);
	}

	@Override
	public List<OrderDetailDTO> selectOrder(String oid) throws Exception {
		return sqlSession.selectList("orderlistMapper.order", oid);
	}

	@Override
	public DeliveryDetailDTO selectDelivery(String oid) throws Exception {
		return sqlSession.selectOne("orderlistMapper.deliver", oid);
	}

}
