package com.spring.beautifly.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beautifly.pay.model.dao.PayDAO;
import com.spring.beautifly.pay.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDAO payDAO;

	@Override
	public int insertPay(Pay pay) {
		return payDAO.insertPay(pay);
	}

}
