package com.spring.beautifly.review.model.vo;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Review {

	private int reviewNo;           // 리뷰 고유 번호
	private String memberId;   		// 멤버 아이디
	private int productNo;          // 상품 고유 번호
	private int rating;             // 평점
	private String reviewContent;   // 리뷰 내용
	
}
