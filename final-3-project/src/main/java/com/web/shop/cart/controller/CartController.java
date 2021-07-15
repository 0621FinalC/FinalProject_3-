package com.web.shop.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.cart.dto.CartDTO;
import com.web.shop.cart.service.*;
 
@Controller
@RequestMapping(value = "/cart")
public class CartController {
 
	@Autowired
    CartService cartService;
 
    // 장바구니 추가
	@RequestMapping(value = "/insert")
    public String insert(@ModelAttribute CartDTO dto, HttpSession session) throws Exception {
 
		
        String userid = (String) session.getAttribute("userid");
        
        // 로그인하지 않으면 로그인 하도록 하고, 로그인 후에는 자동으로 장바구니에 상품이 들어가있도록 구현
//        if(userid == null) {
//        	
//        }
        	
        dto.setUserid(userid);
        
        // 장바구니 상품 중복 확인
        int count = cartService.countCart(dto.getPid(), userid);

        if(count == 0) {
        	cartService.insert(dto);
        } else {
        	cartService.update(dto);
        }
        
        return "redirect:/cart/list.do";
         
    }
	
	//  장바구니 목록
		@RequestMapping(value = "/list")
		public ModelAndView list(HttpSession session, ModelAndView mav) throws Exception{
			Map<String, Object> map = new HashMap<String, Object>();
			String userid = (String) session.getAttribute("userid"); // session에 저장된 userid
			List<CartDTO> list = cartService.listCart(userid); // 장바구니 정보 
			int sumtotalmoney = cartService.sumtotalmoney(userid); // 장바구니 전체 금액 호출
			// 장바구니 전체 긍액에 따라 배송비 구분
			// 배송료(4만원이상 => 무료, 미만 => 2500원)
			int charge = sumtotalmoney >= 40000 ? 0 : 2500;
			// OrderController에서 사용할 정보
			session.setAttribute("cartList", list);
			map.put("list", list);				// 장바구니 정보를 map에 저장
			map.put("count", list.size());		// 장바구니 상품의 유무
			map.put("sumtotalmoney", sumtotalmoney);		// 장바구니 전체 금액
			map.put("charge", charge); 				// 배송금액
			map.put("allsummoney", sumtotalmoney+charge);	// 주문 상품 전체 금액 
			mav.setViewName("shop/cartList");	// view(jsp)의 이름 저장
			mav.addObject("map", map);			// map 변수 저장
			return mav;
		}
	
	// 장바구니 삭제
	@RequestMapping(value = "/delete")
	public String delete(@RequestParam int cid) throws Exception {
		cartService.delete(cid);
		return "redirect:/cart/list";
	}
    
    // 장바구니 수정
    @RequestMapping(value = "/update")
    public String update(@RequestParam int[] cartqty, @RequestParam int[] pid, HttpSession session ) throws Exception {
    	
    	String userid = (String) session.getAttribute("userid");
    	
    	for(int i = 0; i < pid.length; i++) {
    		CartDTO dto = new CartDTO();
    		dto.setUserid(userid);
    		dto.setCartqty(cartqty[i]);
    		dto.setPid(pid[i]);
    		cartService.modify(dto);	
    		}
    	
    	return "redirect:/cart/list";
    }
    
    
    
}
