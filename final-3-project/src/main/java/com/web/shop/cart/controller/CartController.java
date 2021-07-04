package com.web.shop.cart.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.shop.cart.dto.*;
import com.web.shop.cart.service.*;
 
@Controller
@RequestMapping(value = "/cart")
public class CartController {
 
	@Autowired
    private CartService cartService;
 
    // 장바구니 추가
	@RequestMapping(value = "/insert")
    public String insert(@ModelAttribute CartDTO dto, HttpSession session) throws Exception {
 
        String userid = (String) session.getAttribute("userid");
        dto.setUserid(userid);
        
        // 장바구니 상품 중복 확인
        int count = cartService.countCart(dto.getPid(), userid);
       
        if(count == 0) {
        	cartService.update(dto);
        } else {
        	cartService.insert(dto);
        }
        
        if(count == 0) {
        	cartService.insert(dto);
        } else {
        	cartService.update(dto);
        }
        
        return "redirect:/cart/list";
         
    }
    
    // 장바구니 수정
    @RequestMapping(value = "/update")
    public String update(@RequestParam int[] qty, @RequestParam int[] pid, HttpSession session ) throws Exception {
    	String userid = (String) session.getAttribute("userid");
    	
    	for(int i = 0; i < pid.length; i++) {
    		CartDTO dto = new CartDTO();
    		dto.setUserid(userid);
    		dto.setQty(qty[i]);
    		dto.setPid(pid[i]);
    		cartService.modify(dto);	
    		}
    	
    	return "redirect:/cart/list";
    }
    
    
    
}
