package com.web.shop.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
 
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import com.web.shop.cart.dto.*;
import com.web.shop.cart.service.*;
 
@Controller
@RequestMapping(value = "/cart")
public class CartController {
 
	@Autowired
    private CartService cartService;
 
    @RequestMapping("/insert")
    
    // 로그인시 장바구니 기능 이용 가능
    public String insert(@ModelAttribute CartDTO dto, HttpSession session) throws Exception {
 
        String userid = (String) session.getAttribute("userid");
 
        if (userid == null) {
            return "";
            // 로그인 페이지로 이동
        }
        
        dto.setUserid(userid);
        cartService.insert(dto);
 
        return "";
        // 장바구니 리스트로 이동
    }
}
