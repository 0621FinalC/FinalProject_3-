package com.web.shop.order.repository;

import com.web.shop.order.dto.OrderDTO;

public interface OrderRepository {
	// 주문 내역
	public OrderDTO orderList(OrderDTO dto) throws Exception;
	
}