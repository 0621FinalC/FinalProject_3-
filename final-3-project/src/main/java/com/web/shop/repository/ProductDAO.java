package com.web.shop.repository;

import java.util.List;
import com.web.shop.dto.ProductVO;

public interface ProductDAO {
	// 01. ��ǰ���
	public List<ProductVO> listProduct();
	// 02. ��ǰ��
	public ProductVO detailProduct(int productId);

}

