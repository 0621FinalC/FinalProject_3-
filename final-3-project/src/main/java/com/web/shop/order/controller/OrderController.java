package com.web.shop.order.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.shop.cart.dto.CartDTO;
import com.web.shop.cart.service.CartService;
import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.service.OrderService;
import com.web.shop.orderlist.dto.DeliveryDetailDTO;
import com.web.shop.orderlist.dto.OrderDetailDTO;
import com.web.shop.user.dto.UserDTO;

/*
 *  < 이 OrderController의 order 함수가 해야할 일! >
 *  1. 여기서 order_t, order_detail, delivery_info 에 값들을 넣어주고,
 *  2. KakaoPayController의 pay 보면 세션값 가져와서 써야하니까, 세션에 oid 값 setAttribute 해주고
 *  3. 카트 비워준 뒤에, /pay 로 forward 해주면 되겠다
 *  
 *  지금 동국씨 이 컨트롤러 코드에는 delivery_info 에 넣어주는 코드가 없고, 
 *  order.xml 매퍼를 확인해보면 orderInfo 코드에는 order_t가아니라 delivery_info에 insert 하는 코드가 적혀있고,
 *  즉 order_t 와 order_detail 에 insert 하는 코드가 아얘 없음. 
 *  그리고 이거 구현하고 나서 session.setAttribute("oid", OrderDTO.getOid()) (OrderDTO는 매개변수 명으로 바꿔서) 코드 추가해줘야함
 *  그리고 카트 전체 삭제하는 코드 구현해야함! 
 */

@Controller
@RequestMapping(value = "/order")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	// 주문 (각 DB들에 정보 넣어주고 /pay 로 forward
	@RequestMapping(value = "/insertOrderInfo", method = RequestMethod.POST)
	public String order(HttpSession session, @ModelAttribute DeliveryDetailDTO deliveryDetail) throws Exception {
		
		OrderDTO order;
		OrderDetailDTO orderDetail;
		List<CartDTO> list = (List<CartDTO>) session.getAttribute("cartList");
		System.out.println(list.get(0).getPrice() + " " + list.size());
		
		UserDTO dto = (UserDTO)session.getAttribute("dto");		
		String userid = dto.getUserid();
		System.out.println(userid);
		
		int qty;
		int totalprice;
		
		for(CartDTO cart1 : list) {
			qty += cart1.getCartqty();
			totalprice += cart1.getTotalprice();
		}
		
		// 주문 DB 생성
		order.setOid();
		order.setProductname(list.get(0).getProductname() + "외 " + (list.size() - 1) + "건");
		order.setQty(qty);
		order.setTotalprice(totalprice >= 4000 ? totalprice : totalprice + 2500);
		order.setUserid(userid);
		
		service.order(order);
		
		// 상세 주문 DB 생성
		for(CartDTO cart2 : list) {
			orderDetail.setOid();
			orderDetail.setProductname(cart2.getProductname());
			orderDetail.setItem_qty(cart2.getCartqty());
			service.orderDetail(orderDetail);
		}
		
		
		
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
		session.setAttribute("order", );
		
		return "redirect:/order/pay";		
	}
}
