package com.web.shop.service;


import java.util.List;

import com.web.shop.dto.ProductVO;

public interface ProductService {
	// 01. 惑前格废
	public List<ProductVO> listProduct();
	// 02. 惑前惑技
	public ProductVO detailProduct(int productId);
	
	
}