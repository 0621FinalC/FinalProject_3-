package com.web.shop.product.controller;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.product.service.ProductService;

@Controller
@RequestMapping("/shop/product/*")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("list.do") 
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("/shop/product_list"); 
        mav.addObject("list", productService.listProduct());  
    
        return mav;   
    }
    
    @RequestMapping("/detail/{product_id}")
    public ModelAndView detail(
    		@PathVariable("product_id") int product_id, ModelAndView mav) {
    	mav.setViewName("/shop/product_detail");
    	mav.addObject("dto", productService.detailProduct(product_id));
    	return mav;
    }
}
