package com.spring.beautifly.review.model.dao;

import java.util.List;

import com.spring.beautifly.product.model.vo.Product;
import com.spring.beautifly.review.model.vo.Review;

public interface ReviewDAO {


	/**
	 * 상품 상세 페이지에서 리뷰 목록을 볼 수 있게 조회
	 * @param productNo
	 * @return views/product/ProductDetailView
	 */
	List<Review> selectReviewList(int productNo);

	/**
	 * 상품 상세 페이지에서 리뷰 목록을 볼 수 있게 조회
	 * @param review
	 */
	void insertReview(Review review);

	/**
	 * 리뷰 작성 후 product 테이블에 리뷰 횟수 증가
	 * @param review
	 */
	void updateReviewCount(Product product);

	/**
	 * 리뷰 작성 후 product 테이블에 평점 증가
	 * @param review
	 */
	void updateReviewRating(Product product);

}
