package com.web.shop.order.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.order.repository.OrderRepository;
import com.web.shop.orderlist.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository dao;
	
	// 주문 정보
	@Override
	public void orderInfo(OrderDTO order) throws Exception {
		dao.orderInfo(order);
	}

	// 주문 상세 정보
	@Override
	public void orderInfo_Details(OrderDetailDTO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	// 주문 목록
	@Override
	public List<OrderDTO> orderList(OrderDTO order) throws Exception {
		return dao.orderList(order);
	}
	
	// 카트 비우기 
	@Override
	public void cartAllDelete(String userid) throws Exception {
		dao.cartAllDelete(userid);
	}
	
}