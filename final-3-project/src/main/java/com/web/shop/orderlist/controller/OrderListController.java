package com.web.shop.orderlist.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.service.OrderService;
import com.web.shop.orderlist.service.OrderListService;

@Controller
@RequestMapping(value = "/order")
public class OrderListController {
	
	@Autowired
	private OrderListService order;
	
	@RequestMapping(value = "/list")
	public String orderlist(HttpServletRequest req, Model m) throws Exception {
		
		List<OrderDTO> orderlist = null;
		
		// 로그인 세션 userid값 가져와서 일치하는 주문서 가져오기
		HttpSession session = req.getSession();
		// String userid = (String)session.getAttribute("userid");
		orderlist = order.findAll("admin");
		
		// 가져온 주문서 정보 jsp로 보내주기
		m.addAttribute("orderlist", orderlist);
		
		return "orderlist/main";
	}
	
	@RequestMapping(value = "/detail")
	public String orderdetail(@RequestParam String ordno, Model m) throws Exception {
		m.addAttribute("product_list", order.findOrder(ordno));
		m.addAttribute("detail", order.findDetail(ordno));
		return "orderlist/detail";
	}
}
