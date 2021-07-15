package com.web.shop.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.shop.cart.dto.CartDTO;
import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.service.OrderService;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;
import com.web.shop.user.dto.UserDTO;


@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	// 주문 (각 DB들에 정보 넣어주고 /pay 로 forward
	@RequestMapping(value = "/insertOrderInfo", method = RequestMethod.POST)
	public String order(HttpSession session, @ModelAttribute DeliveryDetailDTO deliveryDetail) throws Exception {

		OrderDTO order = new OrderDTO();
		OrderDetailDTO orderDetail = new OrderDetailDTO();
		List<CartDTO> list = (List<CartDTO>) session.getAttribute("cartList");
//		System.out.println(list.get(0).getPrice() + " " + list.size());
	
		String userid = (String)session.getAttribute("userid");	

		int qty = 0;
		int totalprice = 0;
		// order_detail, delivery_info 에 oid값을 넣어주려면 order_t 에서 현재 oid를 가져올 수 있어야함
		// oid를 order_t 에서 가져오기 위해 temp_num 을 order_t에 넣어주고 temp_num=1 인 oid를 가져오게 구현
		int temp_num = 1; 

		for(CartDTO cart1 : list) {
			qty += cart1.getCartqty();
			totalprice += cart1.getTotalprice();
		}
		
		order.setTemp_num(temp_num);

		// 주문 DB 생성
		service.deleteTemp(temp_num);
		order.setProductname(list.size() > 1 ? list.get(0).getProductname() + " 외 " + (list.size() - 1) + "건" : list.get(0).getProductname());
		order.setQty(qty);
		order.setTotalprice(totalprice >= 40000 ? totalprice : totalprice + 2500);
		order.setUserid(userid);

		service.order(order);
		
		String oid = service.getOid(temp_num);
		
		// 상세 주문 DB 생성
		for(CartDTO cart2 : list) {
			orderDetail.setOid(oid);
			orderDetail.setProductname(cart2.getProductname());
			orderDetail.setItem_qty(cart2.getCartqty());
			service.orderDetail(orderDetail);
		}

		deliveryDetail.setOid(oid);
		service.deliveryDetail(deliveryDetail);
		
		// 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
		service.cartAllDelete(userid);

		// 세션으로 oid 전송
		session.setAttribute("order", oid);

		return "redirect:/pay";		
	}
}
