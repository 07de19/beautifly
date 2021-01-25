package com.spring.beautifly.review.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beautifly.product.model.vo.Product;
import com.spring.beautifly.review.model.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Review> selectReviewList(int productNo) {
		return sqlSession.selectList("reviewMapper.selectReviewList", productNo);
	}

	@Override
	public void insertReview(Review review) {
		sqlSession.insert("reviewMapper.insertReview", review);
	}

	@Override
	public void updateReviewCount(Product product) {
		sqlSession.update("reviewMapper.updateReviewCount", product);
	}

	@Override
	public void updateReviewRating(Product product) {
		sqlSession.update("reviewMapper.updateReviewRating", product);
	}

}
