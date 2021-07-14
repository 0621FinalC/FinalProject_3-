package com.web.shop.product.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.cart.dto.*;
import com.web.shop.product.service.ProductService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	// 1. 상품 전체 목록
	@RequestMapping(value = "/list")
	public ModelAndView list(ModelAndView mav) throws Exception {
		mav.setViewName("shop/productList");
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	// 2. 상품 상세보기
	@RequestMapping(value = "/detail/{pid}")
	public ModelAndView detail(@PathVariable("pid") int pid, ModelAndView mav) throws Exception{
		mav.setViewName("/shop/productDetail");
		mav.addObject("dto", productService.detailProduct(pid));
		return mav;
	}
}	
