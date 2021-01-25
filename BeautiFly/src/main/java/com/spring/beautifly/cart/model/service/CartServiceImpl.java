package com.spring.beautifly.cart.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beautifly.cart.model.dao.CartDAO;
import com.spring.beautifly.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDAO cartDao;

	@Override
	public void insert(Cart cart) {
		cartDao.insert(cart);
	}

	@Override
	public List<Cart> listCart(String memberId) {
		return cartDao.listCart(memberId);
	}

	@Override
	public void delete(int cartNo) {
		cartDao.delete(cartNo);
	}

	@Override
	public void modifyCart(Cart cart) {
		cartDao.modifyCart(cart);
	}

	@Override
	public int sumMoney(String memberId) {
		return cartDao.sumMoney(memberId);
	}

	@Override
	public int countCart(int productNo, String memberId) {
		return cartDao.countCart(productNo, memberId);
	}

	@Override
	public void updateCart(Cart cart) {
		cartDao.updateCart(cart);
	}
	
	

}
