package com.web.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.web.shop.dto.ProductVO;
import com.web.shop.repository.*;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	ProductDAO productDao;
	
	// 01. ��ǰ���
	@Override
	public List<ProductVO> listProduct() {
		return productDao.listProduct();
	}
	// 02. ��ǰ��
	@Override
	public ProductVO detailProduct(int productId) {
		return productDao.detailProduct(productId);
	}
	

}
