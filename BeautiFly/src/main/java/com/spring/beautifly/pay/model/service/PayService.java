package com.spring.beautifly.pay.model.service;

import com.spring.beautifly.pay.model.vo.Pay;

public interface PayService {

	/**
	 * 결제 완료 후 페이 테이블에 정보 넣기
	 * @param orderNo
	 * @return views/pay/paySucess
	 */
	int insertPay(Pay pay);

}
