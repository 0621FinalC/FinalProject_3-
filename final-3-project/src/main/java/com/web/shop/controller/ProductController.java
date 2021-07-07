package com.web.shop.controller;

import java.io.File;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.dto.ProductVO;
import com.web.shop.service.ProductService;

@Controller
@RequestMapping("shop/product/*")
public class ProductController {
	@Inject
	ProductService productService;
	
	// 1. ��ǰ ��ü ���
	@RequestMapping("/list.do")
	public ModelAndView list(ModelAndView mav) {
		mav.setViewName("shop/productList");
		mav.addObject("list", productService.listProduct());
		return mav;
	}
	// 2. ��ǰ �󼼺���
	@RequestMapping("detail/{productId}")
	public ModelAndView detail(@PathVariable("productId") int productId, ModelAndView mav){
		mav.setViewName("/shop/productDetail");
		mav.addObject("vo", productService.detailProduct(productId));
		return mav;
	}
	
	
}	
