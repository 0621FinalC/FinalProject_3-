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
		int temp_num = 1;

		for(CartDTO cart1 : list) {
			qty += cart1.getCartqty();
			totalprice += cart1.getTotalprice();
		}
		
		order.setTemp_num(temp_num);

		// 주문 DB 생성
//		order.setOid(service.getOid(temp_num));
		System.out.print("* service.getOid(temp_num) : " + service.getOid(temp_num));
		service.deleteTemp(temp_num);
		order.setProductname(list.size() > 1 ? list.get(0).getProductname() + " 외 " + (list.size() - 1) + "건" : list.get(0).getProductname());
		order.setQty(qty);
		order.setTotalprice(totalprice >= 40000 ? totalprice : totalprice + 2500);
		order.setUserid(userid);

		service.order(order);
		
		String oid = service.getOid(temp_num);
		
//		System.out.print("* order.getOid()" + order.getOid());
		
		// 상세 주문 DB 생성
		for(CartDTO cart2 : list) {
			orderDetail.setOid(oid);
			orderDetail.setProductname(cart2.getProductname());
			orderDetail.setItem_qty(cart2.getCartqty());
			service.orderDetail(orderDetail);
		}

		
		deliveryDetail.setOid(oid);
		service.deliveryDetail(deliveryDetail);

		/*
		// 주문번호 생성을 위한 캘린더 호출
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);  // 연도 추출
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);  // 월 추출
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));  // 일 추출
		String subNum = "";  // 랜덤 숫자를 저장할 문자열 변수
		
		for(int i = 1; i <= 6; i ++) {  // 6회 반복
			subNum += (int)(Math.random() * 10);  // 0~9까지의 숫자를 생성하여 subNum에 저장
		}
		
		String oid = ymd + "_" + subNum;  // [연월일]_[랜덤숫자] 로 구성된 문자
		
		order.setOid(oid);
		order.setUserid(userid);
		 */

		// 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
		service.cartAllDelete(userid);

		// 세션으로 oid 전송
		session.setAttribute("order", oid);

		return "redirect:/pay";		
	}
}
