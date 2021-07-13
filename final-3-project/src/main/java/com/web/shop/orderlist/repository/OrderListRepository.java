package com.web.shop.orderlist.repository;

import java.util.List;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

public interface OrderListRepository {
	public int totalRow() throws Exception;
	public List<OrderDTO> selectAll(String userid, int year, int page, int list_cnt) throws Exception;
	public List<OrderDetailDTO> selectOrder(String oid) throws Exception;
	public DeliveryDetailDTO selectDelivery(String oid) throws Exception;
}
