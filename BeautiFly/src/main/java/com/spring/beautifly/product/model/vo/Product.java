package com.spring.beautifly.product.model.vo;

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
public class Product {
	
	private int productNo;				// 상품 고유 번호
	private String productName;         // 상품명
	private String companyName;         // 회사명
	private String productType;         // 상품 카테고리
	private int productPrice;           // 상품 가격
	private int productPoint;           // 적립 포인트
	private String originCountry;       // 원산지
	private String productState;        // 상품 상태
	private int productWeight;          // 용량
	private int productPayConut;		// 상품 구매 횟수
	private String skinType;            // 피부 타입
	private String hairType;            // 헤어 케어 타입
	private String renameFileName;		// 변경 파일 이름
	private int productRating;			// 상품 총 평점
	private int reviewCount;			// 상품 리뷰 총 개수

}
