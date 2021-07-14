package com.web.shop.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.shop.product.repository.*;
import com.web.shop.product.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductRepository productrepository;
	
	// 01. 상품목록
	@Override
	public List<ProductDTO> listProduct() {
		return productrepository.listProduct();
	}
	// 02. 상품상세
	@Override
	public ProductDTO detailProduct(int pid) {
		return productrepository.detailProduct(pid);
	}
	// 03. 상품수정
	@Override
	public void updateProduct(ProductDTO dto) {
		productrepository.updateProduct(dto);
	}
	// 04. 상품삭제
	@Override
	public void deleteProduct(int pid) {
		productrepository.deleteProduct(pid);
	}
}