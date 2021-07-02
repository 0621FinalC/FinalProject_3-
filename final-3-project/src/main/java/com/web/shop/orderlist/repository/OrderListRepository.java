package com.web.shop.orderlist.repository;

import java.util.List;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

public interface OrderListRepository {
	public List<OrderDTO> selectAll(String userid) throws Exception;
	public List<OrderDetailDTO> selectOrder(String oid) throws Exception;
	public OrderDTO selectDetail(String oid) throws Exception;
}
