package com.web.shop.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.product.dto.ProductDTO;
import com.web.shop.product.service.ProductService;

@Controller
@RequestMapping("/shop/product/*")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping("list") 
    public ModelAndView list(ModelAndView mav) {
        mav.setViewName("/shop/product_list"); 
        mav.addObject("list", productService.listProduct());  
        return mav;   
    }
	
	// 코드 추가 : 검색
	@RequestMapping("/search") 
    public ModelAndView list(ModelAndView mav, @RequestParam String keyword) {
		List<ProductDTO> list = productService.listSearchProduct(keyword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("keyword", keyword);
//		System.out.println("** keyword(controller) : " + map.get("keyword"));
		mav.addObject("map", map);
        mav.setViewName("/shop/listSearch"); 
     
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
