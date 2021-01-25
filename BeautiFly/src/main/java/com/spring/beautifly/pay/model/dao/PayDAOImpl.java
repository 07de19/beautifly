package com.spring.beautifly.pay.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beautifly.pay.model.vo.Pay;

@Repository
public class PayDAOImpl implements PayDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertPay(Pay pay) {
		return sqlSession.insert("payMapper.insertPay", pay);
	}

}
