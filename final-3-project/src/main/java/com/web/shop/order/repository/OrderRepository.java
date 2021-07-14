package com.web.shop.order.repository;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;

public interface OrderRepository {
	public boolean update(OrderDTO dto) throws Exception;
	public OrderDTO select(String id) throws Exception;
	public ShopDTO selectShopInfo() throws Exception;
	public void updateQty(String name, int num) throws Exception;
}
