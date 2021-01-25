package com.spring.beautifly.cart.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beautifly.cart.model.vo.Cart;

@Repository
public class CartDAOImpl implements CartDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insert(Cart cart) {
		sqlSession.insert("cart.insertCart", cart);
	}

	@Override
	public List<Cart> listCart(String memberId) {
		return sqlSession.selectList("cart.listCart", memberId);
	}

	@Override
	public void delete(int cartNo) {
		sqlSession.delete("cart.deleteCart", cartNo);
	}

	@Override
	public void modifyCart(Cart cart) {
		sqlSession.update("cart.modifyCart", cart);
	}

	@Override
	public int sumMoney(String memberId) {
		sqlSession.selectOne("cart.sumMoney", memberId);
        return sqlSession.selectOne("cart.sumMoney", memberId);
	}

	@Override
	public int countCart(int productNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
        map.put("productId", productNo);
        map.put("userId", memberId);
        return sqlSession.selectOne("cart.countCart", map);
	}

	@Override
	public void updateCart(Cart cart) {
		sqlSession.update("cart.sumCart", cart);
	}
	
	

}
