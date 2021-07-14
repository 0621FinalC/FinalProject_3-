package com.web.shop.order.repository;

import java.util.HashMap;

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
	
	@Override
	public void updateQty(String name, int num) throws Exception {

		HashMap<String, Object> params = new HashMap<>();
		params.put("productname", name);
		params.put("qty", num);

		sqlSession.update("orderMapper.inventory", params);
	}
	
	// 카트 비우기
	@Override
	public void cartAllDelete(String userid) throws Exception {
		sqlSession.delete("orderMapper.cartAllDelete", userid);
	}
}
