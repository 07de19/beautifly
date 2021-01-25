package com.spring.beautifly.review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.beautifly.member.model.vo.Member;
import com.spring.beautifly.product.model.service.ProductService;
import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;
import com.spring.beautifly.review.model.service.ReviewService;
import com.spring.beautifly.review.model.vo.Review;

@Controller
public class ReviewController {

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ProductService productService;
	
	// 상품 상세 페이지에 있는 리뷰 List 조회
	@RequestMapping("/review/reviewList.do")
	public String reviewList(@RequestParam int productNo, Model model) {
		List<Review> reviewList = reviewService.selectReviewList(productNo);
		Product product = productService.selectOneProduct(productNo);
		List<Attachment> attachmentList = productService.selectProductAttachmentList(productNo);
		
		model.addAttribute("product", product);
		model.addAttribute("attachmentList", attachmentList);
		
		model.addAttribute("reviewList", reviewList);
		
		return "views/review/ReviewProductDatail";
	}
	
	// 리뷰 작성 페이지로 이동하기
	@RequestMapping("/review/reviewInsert.do")
	public String reviewInsert(Review review, Product product, HttpSession session, Model model) {
		
		String loc = "/index";
		String msg = "";
		
		// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
	        review.setMemberId(memberId);
	        System.out.println(memberId);
	        
	        
	        reviewService.insertReview(review);
	        reviewService.updateReview(product);
	            
	        loc = "/index";
	        msg = "리뷰 작성 완료";
	        
	        model.addAttribute("review", review);
	        
	        return "views/review/ReviewSucess";
		}
		else {
			msg = "로그인한 사용자만 이용 가능합니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		// 로그인하지 않은 상태이면 로그인 화면으로 이동
		return "views/member/Login";
	}
	
}
