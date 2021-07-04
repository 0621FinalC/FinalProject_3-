package com.web.shop.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.cart.dto.*;
import com.web.shop.cart.repository.*;

@Service
public class CartServiceImpl implements CartService {
	

	@Autowired
    private CartRepository cartRepository;
	
	public CartServiceImpl(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}
    
    @Override
    public void insert(CartDTO dto) throws Exception {
    	cartRepository.insert(dto);
    }
    
    /*
    @Override
    public List<CartDTO> listCart(String userid) throws Exception {
        return cartRepository.listCart(userid);
    }
 
    @Override
    public void delete(int cart_id) throws Exception {
    	cartRepository.delete(cart_id);
    }
 
 
    @Override
    public int sumMoney(String userid) throws Exception {
        return cartRepository.sumMoney(userid);
    }
     */
    @Override
    public void modify(CartDTO dto) throws Exception {
    	cartRepository.modify(dto);
    }
    
    @Override
    public void update(CartDTO dto) throws Exception {
    	cartRepository.update(dto);
    }
    
 	// 장바구니 상품 확인하기
    @Override
    public int countCart(int pid, String userid) throws Exception {
        return cartRepository.countCart(pid, userid);
    }
}