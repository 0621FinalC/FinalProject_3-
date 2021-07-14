package com.web.shop.product.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.product.dao.ProductDAO;
import com.web.shop.product.dto.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDAO productDao;

	@Override
	public List<ProductDTO> listProduct() {
		return productDao.listProduct();
	}
	
	
	public List<ProductDTO> listSearchProduct(String keyword) {
		return productDao.listSearchProduct(keyword);
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return productDao.detailProduct(product_id);
	}

	@Override
	public void updateProduct(ProductDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteProduct(int product_id) {
		// TODO Auto-generated method stub

	}

	@Override
	public void insertProduct(ProductDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public String fileInfo(int product_id) {
		// TODO Auto-generated method stub
		return null;
	}

}