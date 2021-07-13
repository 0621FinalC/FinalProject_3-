package com.web.shop.order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.web.shop.order.dto.OrderDTO;
import com.web.shop.order.dto.ShopDTO;
import com.web.shop.order.service.OrderService;

@Controller
@RequestMapping(value = "/pay")
public class KakapPayController {
	
	@Autowired
	private OrderService order;
	
	@RequestMapping(value = "")
	public String payment_init(HttpServletRequest req, Model m) throws Exception {
		String forward = "kakaopay/payment";
		
		// 세션에서 orderid 받아오기. 수정 필요.
		HttpSession session = req.getSession();
		session.setAttribute("order_id", "1"); //order_detail 주문번호
		
		OrderDTO dto = order.findInfo((String)session.getAttribute("order_id"));
		
		m.addAttribute("order", dto);
		
		return forward;
	}
	
	@RequestMapping(value = "/payment")
	public String payment_ing(HttpServletRequest req) throws Exception {
		String forward = "";
		// 주문자가 결제 요청한 상품의 정보를 확인 후 카카오페이 서버에 상품관련 결제준비 정보 전송
		
		// 상품 정보를 확인하기 위한 코드 작성 시작
		
		// 세션에서 받아온 orderid로 주문서db 정보조회
		HttpSession session = req.getSession();
		OrderDTO dto = order.findInfo((String)session.getAttribute("order_id"));
		
		// 결제요청한 데이터(주문db)랑 실제 전달된 결제 데이터가 같은지 확인?
		
		// 상품 정보를 확인하기 위한 코드 작성 끝
		
		ShopDTO shop = order.shopInfo();
		
		// 카카오페이 서버 결제준비 정보 전송 시작
		MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
		param.add("cid", shop.getCid());				// 별도로 저장(가맹점 코드)
		param.add("partner_order_id", dto.getOid());		// order_t에 orderid 추가해야함
		param.add("partner_user_id", dto.getUserid());	
		param.add("item_name", dto.getProductname());
		param.add("quantity", Integer.toString(dto.getQty()));
		param.add("total_amount", Integer.toString(dto.getTotalprice()));
		param.add("tax_free_amount", "0");		// 상품 비과세 금액 일단 0으로 설정
		param.add("approval_url", "http://localhost:8080/shop/pay/success");
		param.add("cancel_url", "http://localhost:8080/shop/pay/cancel");
		param.add("fail_url", "http://localhost:8080/shop/pay/fail");
		
		System.out.println("요청 데이터 : " + param.toString());
		
		// REST API를 사용하여 카카오페이 서버에 위의 데이터 전송
		RestTemplate rest =  new RestTemplate();
		rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK " + shop.getApp_admin_key());		// APP_ADMIN_KEY 별도 저장 필요
		headers.set("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(param, headers);
		
		String url = "https://kapi.kakao.com/v1/payment/ready";
		ResponseEntity<String> resp = rest.postForEntity(url, entity, String.class);
		
		System.out.println("응답 데이터 : " + resp.getBody());
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> resp_data = mapper.readValue(resp.getBody(), HashMap.class);
		
		String tid = (String)resp_data.get("tid");	// 데이터 베이스에 저장해야 함(결제 고유 번호, 20자)
		String redirect_pc = (String)resp_data.get("next_redirect_pc_url");
		// String created_at = (String)resp_data.get("created_at");	// 결제 준비 요청 시간 -> db저장 필요?
		
		dto.setTid(tid);
		dto.setOrderstat("결제대기");
		
		order.updateInfo(dto);	// 주문서db정보 수정(tid, 주문상태)
		
		// 임시로 작성한 코드(WAS 전역 메모리에 저장). 반드시 데이터베이스로 저장하도록 해야함
		// db에 저장 후 삭제
		// req.getServletContext().setAttribute("tid", tid);
		
		forward = "redirect:" + redirect_pc;
		// 카카오페이 서버 결제준비 정보 전송 끝
		
		return forward;
	}
	
	@RequestMapping(value = "/success")
	public String success(@RequestParam String pg_token, HttpServletRequest req, Model m) throws Exception {
		String forward = "";
		
		// 세션의 oid로 주문서db조회
		HttpSession session = req.getSession();
		OrderDTO dto = order.findInfo((String)session.getAttribute("order_id"));
		// shop정보 가져옴
		ShopDTO shop = order.shopInfo();
		
		MultiValueMap<String, String> param = new LinkedMultiValueMap<String, String>();
		param.add("cid", shop.getCid());
		param.add("tid", dto.getTid());	
		param.add("partner_order_id", dto.getOid());
		param.add("partner_user_id", dto.getUserid());
		param.add("pg_token", pg_token);
		
		RestTemplate rest =  new RestTemplate();
		rest.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
		
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK " + shop.getApp_admin_key());	// APP_ADMIN_KEY 별도 저장 필요
		headers.set("Content-type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=utf-8");
		
		HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(param, headers);
		
		String url = "https://kapi.kakao.com/v1/payment/approve";
		ResponseEntity<String> resp = rest.postForEntity(url, entity, String.class);
		
		System.out.println("결제 데이터 : " + resp.getBody());
		
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> resp_data = mapper.readValue(resp.getBody(), HashMap.class);
		
		if(resp.getStatusCode() == HttpStatus.OK) {
			// 데이터베이스 저장을 위한 추가 작업
			// resp_data에서 필요한 정보 가져와서 db에 저장
			String payment_method_type = (String)resp_data.get("payment_method_type");
			String approved_at = (String)resp_data.get("approved_at");	// 결제 승인 시간 -> db저장 필요?
			
			dto.setPaymentmethod(payment_method_type);
			dto.setOrderstat("결제완료");
			dto.setApproved_at(approved_at);
			
			order.updateInfo(dto);	// 주문서db정보 수정(결제 수단, 주문 상태, 결제 승인 시각)
			
			m.addAttribute("info", dto);
			
			forward = "kakaopay/success";
		} else if(resp.getStatusCode() == HttpStatus.BAD_REQUEST) {
			forward = "kakaopay/fail";
		}
		
		return forward;
	}
	
	@RequestMapping(value = "/cancel")
	public String cancel(){
		String forward = "kakopay/cancel";
		return forward;
	}
	
	@RequestMapping(value = "/fail")
	public String fail(){
		String forward = "kakaopay/fail";
		return forward;
	}
	
}
