package com.spring.beautifly.cart.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Cart {
	
	private int cartNo;
	private int productNo;
	private String memberId;
	private int countNum;
	private String memberName; 
	private String productName; 
    private int productPrice; 
    private int money;

}
