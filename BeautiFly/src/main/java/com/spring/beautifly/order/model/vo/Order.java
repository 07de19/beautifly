package com.spring.beautifly.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	
	private int orderNo;             // 주문 고유 번호
	private String memberId;         // 멤버 아이디
	private String orderName;        // 주문자 이름
	private String orderAddress;     // 배송 주소
	private String orderEmail;       // 주문자 이메일
	private String orderTel;         // 주문자 전화번호
	private int orderPrice;          // 주문 금액
	private int orderPoint;          // 포인트 사용 금액
	private String orderMessage;     // 배송 메세지
	private String payIsOk;          // 결제 여부
	private String cancelIsOk;       // 주문 취소 여부
	private String productName;      // 상품 이름
	
	private String payDate;      	 // 결제일
	
	// 주소 API
	private String Address1;
	private String Address2;
	private String Address3;

}
