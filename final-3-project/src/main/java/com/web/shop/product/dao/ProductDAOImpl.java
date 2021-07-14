package com.web.shop.product.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.shop.product.dto.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ProductDTO> listProduct() {
		return sqlSession.selectList("product.list_product");
	}
	
	@Override
	public List<ProductDTO> listSearchProduct(String keyword) {
		// 검색 키워드 저장
//		System.out.println("** keyword(daoImpl) : " + keyword);
		return sqlSession.selectList("product.listSearch", keyword);
	}

	@Override
	public ProductDTO detailProduct(int product_id) {
		return sqlSession.selectOne("product.detail_product", product_id);
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
