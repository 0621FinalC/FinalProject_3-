package com.web.shop.orderlist.service;

import java.util.List;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

public interface OrderListService {
	public List<OrderDTO> findAll(String userid, int year) throws Exception;
	public List<OrderDetailDTO> findOrder(String oid) throws Exception;
	public DeliveryDetailDTO findDelivery(String oid) throws Exception;
}
