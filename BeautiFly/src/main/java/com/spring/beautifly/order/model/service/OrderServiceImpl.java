package com.spring.beautifly.order.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beautifly.order.model.dao.OrderDAO;
import com.spring.beautifly.order.model.vo.Order;


@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public void insertOrder(Order order) {
		orderDAO.insertOrder(order);
	}

	@Override
	public List<Order> selectOrderList(String memberId) {
		return orderDAO.selectOrderList(memberId);
	}

	@Override
	public void updateMemberPoint(String memberId) {
		orderDAO.updateMemberPoint(memberId);
	}

	@Override
	public List<Order> selectOrderList2() {
		return orderDAO.selectOrderList2();
	}

}
