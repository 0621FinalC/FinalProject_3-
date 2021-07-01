package com.web.shop.orderlist.service;

import java.util.List;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.OrderListDTO;

public interface OrderListService {
	public List<OrderDTO> findAll(String userid) throws Exception;
}
