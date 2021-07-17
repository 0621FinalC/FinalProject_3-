package com.web.shop.orderlist.service;

import java.util.List;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

public interface OrderListService {
	public int totalRow() throws Exception;
	public int totalRow(String userid) throws Exception;
	public List<OrderDTO> findAll(String userid, int year, int page, int list_cnt) throws Exception;
	public List<OrderDetailDTO> findOrder(String oid) throws Exception;
	public DeliveryDetailDTO findDelivery(String oid) throws Exception;
}
