package com.web.shop.cart.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.shop.cart.dto.CartDTO;

@Service
public interface CartService {
	
	public void insert(CartDTO dto) throws Exception; 	//장바구니 추가
	public void delete(Integer cid) throws Exception; 	// 장바구니 아이템 개별 삭제 
	public void modify(CartDTO dto) throws Exception;
	public void update(CartDTO dto) throws Exception;
	public int countCart(Integer pid, String userid) throws Exception;	//장바구니 상품 갯수
	public List<CartDTO> listCart(String userid) throws Exception; 	//장바구니 목록
	public int sumtotalmoney(String userid) throws Exception;	// 장바구니 금액 합계
	}