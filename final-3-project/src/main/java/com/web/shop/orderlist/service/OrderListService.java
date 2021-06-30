package com.web.shop.orderlist.service;

import java.util.List;

import com.web.shop.orderlist.dto.OrderListDTO;

public interface OrderListService {
	public List<OrderListDTO> findAll(String userid) throws Exception;
}
