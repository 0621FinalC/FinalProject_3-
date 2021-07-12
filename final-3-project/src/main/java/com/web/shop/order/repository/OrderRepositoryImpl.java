package com.web.shop.order.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;

@Repository
public class OrderRepositoryImpl implements OrderRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public boolean update(OrderDTO dto) throws Exception {
		boolean result = false;
		
		int res = sqlSession.update("orderMapper.addInfo", dto);
		
		if(res == 1) {
			result = true;
		}
		
		return result;
	}

	@Override
	public OrderDTO select(String id) throws Exception {
		return sqlSession.selectOne("orderMapper.selectOrder", id);
	}

	@Override
	public ShopDTO selectShopInfo() throws Exception {
		return sqlSession.selectOne("orderMapper.selectShop");
	}

}
