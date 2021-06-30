package com.web.shop.cart.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.shop.cart.dto.*;
import com.web.shop.cart.repository.*;

@Service
public class CartServiceImpl implements CartService {
 
	@Autowired
    private CartRepository cartRepository;
    
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
    public void update(int cart_id) throws Exception {
    	cartRepository.update(cart_id);
    }
 
    @Override
    public int sumMoney(String userid) throws Exception {
        return cartRepository.sumMoney(userid);
    }
 
    @Override
    public int countCart(String userid, int qty) throws Exception {
        return cartRepository.countCart(userid, qty);
    }
    */
}