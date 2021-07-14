package com.web.shop.product.repository;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.web.shop.product.dto.*;


@Repository
public class ProductRepositoryImpl implements ProductRepository {
	
	@Inject
	SqlSession sqlSession;
	
	// 01. 상품목록
	@Override
	public List<ProductDTO> listProduct() {
		return sqlSession.selectList("product.listProduct");
	}
	// 02. 상품상세
	@Override
	public ProductDTO detailProduct(int pid) {
		return sqlSession.selectOne("product.detailProduct", pid);
	}
	// 03. 상품수정
	@Override
	public void updateProduct(ProductDTO dto) {
		sqlSession.update("product.updateProduct", dto);

	}
	// 04. 상품삭제
	@Override
	public void deleteProduct(int pid) {
		sqlSession.delete("product.deleteProduct", pid);
	}
	
}