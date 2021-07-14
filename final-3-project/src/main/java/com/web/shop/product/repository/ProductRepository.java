package com.web.shop.product.repository;

import java.util.List;

import com.web.shop.product.dto.*;

public interface ProductRepository {
	// 01. 상품목록
	public List<ProductDTO> listProduct();
	// 02. 상품상세
	public ProductDTO detailProduct(int pid);
	// 03. 상품수정
	public void updateProduct(ProductDTO dto);
	// 04. 상품삭제
	public void deleteProduct(int pid);
	
}