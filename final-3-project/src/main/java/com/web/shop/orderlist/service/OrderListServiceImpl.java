package com.web.shop.orderlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;
import com.web.shop.orderlist.repository.OrderListRepository;

@Service
public class OrderListServiceImpl implements OrderListService {
	
	@Autowired
	private OrderListRepository dao;
	
	@Override
	public List<OrderDTO> findAll(String userid, int year, int page, int list_cnt) throws Exception {
		return dao.selectAll(userid, year, page, list_cnt);
	}

	@Override
	public List<OrderDetailDTO> findOrder(String oid) throws Exception {
		return dao.selectOrder(oid);
	}

	@Override
	public DeliveryDetailDTO findDelivery(String oid) throws Exception {
		return dao.selectDelivery(oid);
	}

	@Override
	public int totalRow() throws Exception {
		return dao.totalRow();
	}
	
	@Override
	public int totalRow(String userid) throws Exception {
		return dao.totalRow(userid);
	}
	
}
