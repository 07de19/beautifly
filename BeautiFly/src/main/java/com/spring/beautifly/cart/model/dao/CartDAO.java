package com.spring.beautifly.cart.model.dao;

import java.util.List;

import com.spring.beautifly.cart.model.vo.Cart;

public interface CartDAO {
	
	// 1. 장바구니 추가
    void insert(Cart cart);
    
    // 2. 장바구니 목록
    public List<Cart> listCart(String memberId);
    
    // 3. 장바구니 삭제
    public void delete(int cartNo);
    
    // 4. 장바구니 수정
    public void modifyCart(Cart cart);
    
    // 5. 장바구니 금액 합계
    public int sumMoney(String memberId);
    
    // 6. 장바구니 상품 확인
    public int countCart(int productNo, String memberId);
    
    // 7. 장바구니 상품 수량 변경
    public void updateCart(Cart cart);

}
