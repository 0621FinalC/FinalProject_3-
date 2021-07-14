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
	public List<OrderDTO> selectAll(String userid, int year, int page, int list_cnt) throws Exception {
		int total = totalRow();
		int startNum = total - (list_cnt * (page - 1)) - list_cnt + 1;
		int endNum = total - (list_cnt * (page - 1));
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("userid", userid);
		params.put("year", year);
		params.put("startNum", startNum);
		params.put("endNum", endNum);
		
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
	
	@Override
	public int totalRow() throws Exception {
		return sqlSession.selectOne("orderlistMapper.totalRow");
	}

}
