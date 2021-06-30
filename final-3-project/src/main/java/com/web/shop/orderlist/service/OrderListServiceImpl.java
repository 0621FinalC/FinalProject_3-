package com.web.shop.orderlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.orderlist.dto.OrderListDTO;
import com.web.shop.orderlist.repository.OrderListRepository;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	@Autowired
	private OrderListRepository dao;
	
	@Override
	public List<OrderListDTO> findAll(String userid) throws Exception {
		return dao.selectAll(userid);
	}

}
