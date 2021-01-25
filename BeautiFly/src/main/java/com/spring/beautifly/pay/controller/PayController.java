package com.spring.beautifly.pay.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.beautifly.cart.model.vo.Cart;
import com.spring.beautifly.member.model.vo.Member;
import com.spring.beautifly.order.model.service.OrderService;
import com.spring.beautifly.order.model.vo.Order;
import com.spring.beautifly.pay.model.service.PayService;
import com.spring.beautifly.pay.model.vo.Pay;


@Controller
public class PayController {
	
	@Autowired
	PayService payService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping("/pay/insertPay.do")
	public String insertPay(Pay pay, Cart cart, Order order, HttpSession session, Model model) {
		
		
		// ORDER 테이블에 들어가는 INSERT문
		// 주소 API 넣기
		String AddressAPI = order.getAddress1() + ", " + order.getAddress2() + ", " + order.getAddress3();
		order.setOrderAddress(AddressAPI);
		
		// 상품 이름 뒤에 더 붙여서 저장하기
		String productAddName = order.getProductName() + " 등"; 
		order.setProductName(productAddName);
		
		
		if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
	        order.setMemberId(memberId);
	        System.out.println(order);
	        
	        orderService.insertOrder(order);
	        
	        model.addAttribute("order", order);
		}
		
		
		
		// PAY 테이블에 값 INSERT 하기
		String memberId = ((Member)session.getAttribute("member")).getMemberId();
		pay.setMemberId(memberId);
		
		int result = payService.insertPay(pay);
		
		if (result > 0) {
			
			System.out.println(pay);
			model.addAttribute("pay", pay);
			
			// member 테이블에 포인트 적립 해주기
			orderService.updateMemberPoint(memberId);
			
			
			return "redirect:/index";
		} else {
			
		}
		
		return "redirect:/index";
		
	}
	
	@RequestMapping("/pay/paySucess.do")
	public String memberJoin() {
		
		return "views/pay/paySucess";
	}
	
	
	
	

}
