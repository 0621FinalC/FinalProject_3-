package com.web.shop.order.service;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;

public interface OrderService {
	
	public boolean updateInfo(OrderDTO dto) throws Exception;
	public OrderDTO findInfo(String id) throws Exception;
	public ShopDTO shopInfo() throws Exception;
		
}
