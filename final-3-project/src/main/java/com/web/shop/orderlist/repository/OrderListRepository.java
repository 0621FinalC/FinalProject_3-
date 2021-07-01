package com.web.shop.orderlist.repository;

import java.util.List;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.OrderListDTO;

public interface OrderListRepository {
	public List<OrderDTO> selectAll(String userid) throws Exception;
}
