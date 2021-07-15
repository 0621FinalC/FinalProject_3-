package com.web.shop.order.service;

import java.sql.Date;
import java.util.HashMap;
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
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	private OrderRepository dao;
	
	@Override
	public boolean updateInfo(OrderDTO dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public OrderDTO findInfo(String id) throws Exception {
		return dao.select(id);
	}

	@Override
	public ShopDTO shopInfo() throws Exception {
		return dao.selectShopInfo();
	}
	
	@Override
	public void updateInven(String productname, int qty) throws Exception {
		dao.updateQty(productname, qty);
	}
	
	// 카트 비우기 : 아직 구현x
	@Override
	public void cartAllDelete(String userid) throws Exception {
		dao.cartAllDelete(userid);
	}
	
	public void order(OrderDTO dto) throws Exception {
		dao.order(dto);
	}
	
	public void orderDetail(OrderDetailDTO dto) throws Exception {
		dao.orderDetail(dto);
	}
	
	public void deliveryDetail(DeliveryDetailDTO dto) throws Exception {
		dao.deliveryDetail(dto);
	}
	

	@Override
	public String getOid(int temp_num) throws Exception {
		return dao.getOid(temp_num);
	}

	@Override
	public void deleteTemp(int temp_num) throws Exception {
		dao.deleteTemp(temp_num);
	}
	
	@Override
	public void setTemp(int temp_num) throws Exception {
		dao.setTemp(temp_num);
	}
}
