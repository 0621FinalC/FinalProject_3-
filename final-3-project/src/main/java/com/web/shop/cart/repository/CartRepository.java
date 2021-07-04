package com.web.shop.cart.repository;

import com.web.shop.cart.dto.*;
 
public interface CartRepository {
	
	public void insert(CartDTO dto) throws Exception; 	//장바구니 추가
	
	/*
	public List<CartDTO> listCart(String userid) throws Exception; 	//장바구니 목록
	public void delete(int cart_id) throws Exception; 	// 장바구니 아이템 개별 삭제 
	public int sumMoney(String userid) throws Exception;	// 장바구니 금액 합계
	 */
	public void modify(CartDTO dto) throws Exception;
	public void update(CartDTO dto) throws Exception;
	public int countCart(int pid, String userid) throws Exception;	//장바구니 상품 갯수
}
