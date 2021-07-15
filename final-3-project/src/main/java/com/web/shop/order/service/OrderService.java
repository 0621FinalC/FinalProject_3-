package com.web.shop.order.service;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

public interface OrderService {
	
	public boolean updateInfo(OrderDTO dto) throws Exception;
	public OrderDTO findInfo(String id) throws Exception;
	public ShopDTO shopInfo() throws Exception;
	public void updateInven(String productnum, int qty) throws Exception;
	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;
	public void order(OrderDTO dto) throws Exception;
	public void orderDetail(OrderDetailDTO dto) throws Exception; 
	public void deliveryDetail(DeliveryDetailDTO dto) throws Exception; 
}