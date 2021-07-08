package com.web.shop.orderlist.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.order.service.OrderService;
import com.web.shop.orderlist.dto.PaymentDetailDTO;
import com.web.shop.orderlist.service.OrderListService;

@Controller
@RequestMapping(value = "/order")
public class OrderListController {
	
	@Autowired
	private OrderListService order_detail;
	
	@Autowired
	private OrderService order;
	
	@RequestMapping(value = "/list")
	public String orderlist(HttpServletRequest req, Model m) throws Exception {
		
		List<OrderDTO> orderlist = null;
		
		// 로그인 세션 userid값 가져와서 일치하는 주문서 가져오기
		HttpSession session = req.getSession();
		// String userid = (String)session.getAttribute("userid");
		orderlist = order_detail.findAll("admin");
		
		// 가져온 주문서 정보 jsp로 보내주기
		m.addAttribute("orderlist", orderlist);
		
		return "orderlist/main";
	}
	
	@RequestMapping(value = "/detail")
	public String orderdetail(@RequestParam String ordno, Model m) throws Exception {
		m.addAttribute("product_list", order_detail.findOrder(ordno));		// 상세 상품정보
		m.addAttribute("delivery_info", order_detail.findDelivery(ordno));	// 배송 관련 정보
		
		ShopDTO shop = order.shopInfo();
		OrderDTO dto = order.findInfo(ordno);
		
		// 카카오페이 주문 조회 api
		MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
		param.add("cid", shop.getCid());
		param.add("tid", dto.getTid());
		
		RestTemplate rest =  new RestTemplate();
		rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK " + shop.getApp_admin_key());
		headers.set("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(param, headers);
		
		String url = "https://kapi.kakao.com/v1/payment/order";
		ResponseEntity<String> resp = rest.postForEntity(url, entity, String.class);
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> resp_data = mapper.readValue(resp.getBody(), HashMap.class);
		
		PaymentDetailDTO pay_info = new PaymentDetailDTO();
		
		HashMap amount = new HashMap();
		amount = (HashMap)resp_data.get("amount");
		
		pay_info.setTotal((Integer)amount.get("total"));
		pay_info.setPoint((Integer)amount.get("point"));
		pay_info.setPayment_method_type((String)resp_data.get("payment_method_type"));
		pay_info.setApproved_at((String)resp_data.get("approved_at"));
		
		m.addAttribute("pay_info", pay_info);
		
		return "orderlist/detail";
	}
}
