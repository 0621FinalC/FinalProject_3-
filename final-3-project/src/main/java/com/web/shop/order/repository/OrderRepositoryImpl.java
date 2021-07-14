package com.web.shop.order.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

@Repository
public class OrderRepositoryImpl implements OrderRepository {
	
	@Autowired
	private SqlSession sql;
	
	private static String namespace = "orderMapper";
	
	// 주문 정보
		@Override
		public void orderInfo(OrderDTO order) throws Exception {
			sql.insert(namespace + ".orderInfo", order);
		}
		
		// 주문 상세 정보
		@Override
		public void orderInfo_Details(OrderDetailDTO orderDetail) throws Exception {
			sql.insert(namespace + ".orderInfo_Details", orderDetail);
		}
		
		// 주문 목록
		@Override
		public List<OrderDTO> orderList(OrderDTO order) throws Exception {
			return sql.selectList(namespace + ".orderList", order);
		}
		
		// 카트 비우기
		@Override
		public void cartAllDelete(String userid) throws Exception {
			sql.delete(namespace + ".cartAllDelete", userid);
		}

}