package com.web.shop.order.service;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public interface OrderService {
	
	// 주문 정보
	public void orderInfo(OrderDTO order) throws Exception;
		
	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailDTO orderDetail) throws Exception;
	
	// 주문 목록
	public List<OrderDTO> orderList(OrderDTO order) throws Exception;
	
	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;
}
