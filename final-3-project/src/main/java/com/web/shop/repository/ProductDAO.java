package com.web.shop.repository;

import java.util.List;
import com.web.shop.dto.ProductVO;

public interface ProductDAO {
	// 01. 상품목록
	public List<ProductVO> listProduct();
	// 02. 상품상세
	public ProductVO detailProduct(int productId);

}

