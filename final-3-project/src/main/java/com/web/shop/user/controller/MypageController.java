package com.web.shop.user.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.service.OrderService;
import com.web.shop.user.dto.UserDTO;
import com.web.shop.user.service.UserService;

@Controller
@RequestMapping(value = "/mypage")
public class MypageController {
	
	@Autowired
	UserService user;
	OrderService order;
	
	// 마이페이지 이동
		@RequestMapping(value = "/mypage", method = RequestMethod.GET)
		public String mypage(HttpSession session, Model m) throws Exception {
			// 세션 객체 안에 있는 id 저장
			String userid = (String) session.getAttribute("userid");
			
			// 서비스의 readUser 호출
			UserDTO dto = user.readUser(userid);
			
			// 정보저장 후 페이지 이동
			m.addAttribute("userData", dto);
			return "user/mypage";
		}
		
		// 마이페이지에서 주문 내역 확인
		@RequestMapping(value = "/orderinfo", method = RequestMethod.GET)
		public String orderinfo(HttpSession session, Model m) throws Exception{
			String userid = (String)session.getAttribute("userid");
			
			// 주문 내역 호출
			List<OrderDTO> orderInfo = service.orderinfo(userid);
			
			m.addAttribute("orderInfo", orderinfo);
			
			return "user/orderinfo";
		}
}