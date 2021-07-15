package com.web.shop.order.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

public interface OrderRepository {

	public boolean update(OrderDTO dto) throws Exception;
	public OrderDTO select(String id) throws Exception;
	public ShopDTO selectShopInfo() throws Exception;
	public void updateQty(String name, int num) throws Exception;
	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;
	public void order(OrderDTO dto) throws Exception;
	public void orderDetail(OrderDetailDTO dto) throws Exception;
	public void deliveryDetail(DeliveryDetailDTO dto) throws Exception;

}