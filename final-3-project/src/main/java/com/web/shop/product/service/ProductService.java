package com.web.shop.product.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.shop.product.dto.ProductDTO;

@Service
public interface ProductService {
	// 01. 상품목록
	public List<ProductDTO> listProduct() throws Exception;
	// 02. 상품상세
	public ProductDTO detailProduct(int pid) throws Exception;
	// 03. 상품수정
	public void updateProduct(ProductDTO dto) throws Exception;
	// 04. 상품삭제
	public void deleteProduct(int pid) throws Exception;

}