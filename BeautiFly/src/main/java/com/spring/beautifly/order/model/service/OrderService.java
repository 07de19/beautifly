package com.spring.beautifly.order.model.service;

import java.util.List;

import com.spring.beautifly.order.model.vo.Order;

public interface OrderService {

	/**
	 * 상품 주문 페이지에서 주문서 작성 후 데이터 베이스에 들어가는 코드
	 * @param order
	 */
	void insertOrder(Order order);

	/**
	 * 결제 db에 넣기 위해 오더 테이블 정보 조회
	 * @return
	 */
	List<Order> selectOrderList(String memberId);

	/**
	 * member 테이블에 포인트 적립 해주기
	 * @param memberId
	 */
	void updateMemberPoint(String memberId);

	/**
	 * 관리자 페이지에서 결제 목록 조회
	 * @return
	 */
	List<Order> selectOrderList2();

}
