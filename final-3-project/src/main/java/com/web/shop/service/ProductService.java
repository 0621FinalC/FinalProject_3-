package com.web.shop.service;


import java.util.List;

import com.web.shop.dto.ProductVO;

public interface ProductService {
	// 01. ��ǰ���
	public List<ProductVO> listProduct();
	// 02. ��ǰ��
	public ProductVO detailProduct(int productId);
	
	
}