package com.spring.beautifly.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beautifly.product.model.vo.Product;
import com.spring.beautifly.review.model.dao.ReviewDAO;
import com.spring.beautifly.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public List<Review> selectReviewList(int productNo) {
		return reviewDAO.selectReviewList(productNo);
	}

	@Override
	public void insertReview(Review review) {
		reviewDAO.insertReview(review);
	}

	@Override
	public void updateReview(Product product) {
		reviewDAO.updateReviewCount(product);
		reviewDAO.updateReviewRating(product);
	}

}
