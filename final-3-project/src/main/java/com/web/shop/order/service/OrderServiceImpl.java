package com.web.shop.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.repository.OrderRepositoryImpl;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderRepositoryImpl dao;
	
	public void orderList(OrderDTO dto) throws Exception{
		OrderDTO data = dao.checkOrder(dto);
		if(data != null) {
			// 주문 상품 존재
			dto.setOid(data.getOid());
			dto.setProductname(data.getProductname());
			dto.setQty(data.getQty());
			dto.setTotalprice(data.getTotalprice());
		}else {
			// 주문 상품 없음
			
		}
	}
}
