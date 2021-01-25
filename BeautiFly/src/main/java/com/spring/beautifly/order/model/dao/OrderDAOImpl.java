package com.spring.beautifly.order.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beautifly.order.model.vo.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public void insertOrder(Order order) {
		sqlSession.insert("orderMapper.insertOrder", order);
	}

	@Override
	public List<Order> selectOrderList(String memberId) {
		return sqlSession.selectList("orderMapper.selectOrderList", memberId);
	}

	@Override
	public void updateMemberPoint(String memberId) {
		sqlSession.update("orderMapper.updateMemberPoint", memberId);
	}

	@Override
	public List<Order> selectOrderList2() {
		return sqlSession.selectList("orderMapper.selectOrderList2");
	}
	

}
