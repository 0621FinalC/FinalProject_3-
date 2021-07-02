package com.web.shop.orderlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;
import com.web.shop.orderlist.repository.OrderListRepository;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	@Autowired
	private OrderListRepository dao;
	
	@Override
	public List<OrderDTO> findAll(String userid) throws Exception {
		return dao.selectAll(userid);
	}

	@Override
	public List<OrderDetailDTO> findOrder(String oid) throws Exception {
		return dao.selectOrder(oid);
	}

	@Override
	public OrderDTO findDetail(String oid) throws Exception {
		return dao.selectDetail(oid);
	}

}
