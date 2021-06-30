package com.web.shop.cart.service;

import com.web.shop.cart.dto.CartDTO;

public interface CartService {
	
	public void insert(CartDTO dto) throws Exception; 	//장바구니 추가

	/*
	public List<CartDTO> listCart(String userid) throws Exception; 	//장바구니 목록
	public void delete(int cart_id) throws Exception; 	// 장바구니 아이템 개별 삭제 
	public void update(int cart_id) throws Exception;
	public int sumMoney(String userid) throws Exception;	// 장바구니 금액 합계
	public int countCart(String userid, int qty) throws Exception;	//장바구니 상품 갯수
	 */
	}