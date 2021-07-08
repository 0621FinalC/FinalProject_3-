package com.web.shop.cart.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.web.shop.cart.dto.*;
import com.web.shop.cart.repository.*;

@Service
public class CartServiceImpl implements CartService {
	

	@Inject
    private CartRepository cartRepository;
	
	public CartServiceImpl(){}
	
	public CartServiceImpl(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}
    
    @Override
    public void insert(CartDTO dto) throws Exception {
    	cartRepository.insert(dto);
    }
    
    @Override
    public void delete(int cart_id) throws Exception {
    	cartRepository.delete(cart_id);
    }
    
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
    
    @Override
    public List<CartDTO> listCart(String userid) throws Exception {
    	return cartRepository.listCart(userid);
    }
    
    @Override
    public int sumtotalmoney(String userid) throws Exception {
    	return cartRepository.sumtotalmoney(userid);
    }
}
