package com.web.shop.order.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.service.OrderService;
import com.web.shop.orderlist.dto.OrderDetailDTO;
import com.web.shop.user.dto.UserDTO;

@Controller
@RequestMapping
public class OrderController {
	
	@Inject
	OrderService service;
	
		// 주문
		@RequestMapping(value = "/cart/list", method = RequestMethod.POST)
		public String order(HttpSession session, OrderDTO order, OrderDetailDTO orderDetail) throws Exception {
		
			
			UserDTO dto = (UserDTO)session.getAttribute("dto");		
			String userid = dto.getUserid();
			System.out.println(userid);
			
			/*
			// 캘린더 호출
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
			service.orderInfo(order);		
			service.orderInfo_Details(orderDetail);
			
			// 주문 테이블, 주문 상세 테이블에 데이터를 전송하고, 카트 비우기
			service.cartAllDelete(userid);
			
			
			return "redirect:/order/list";		
		}
		
		// 주문 목록
		@RequestMapping(value = "/order/list", method = RequestMethod.GET)
		public void getOrderList(HttpSession session, OrderDTO order, Model model) throws Exception {
		
			UserDTO member = (UserDTO)session.getAttribute("member");
			String userid = member.getUserid();
			
			order.setUserid(userid);
			
			List<OrderDTO> orderList = service.orderList(order);
			
			model.addAttribute("orderList", orderList);
		}	
}
