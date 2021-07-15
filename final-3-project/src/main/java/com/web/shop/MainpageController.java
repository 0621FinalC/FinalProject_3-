package com.web.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.web.shop.product.service.ProductService;

@Controller
public class MainpageController {
	
	@Autowired
	ProductService productService;
		
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main(ModelAndView m) {
		m.setViewName("main"); 
        m.addObject("list", productService.listProduct());  
        return m;   
    }
}
