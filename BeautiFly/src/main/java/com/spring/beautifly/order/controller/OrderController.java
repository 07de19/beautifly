package com.spring.beautifly.order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.beautifly.cart.model.service.CartService;
import com.spring.beautifly.cart.model.vo.Cart;
import com.spring.beautifly.member.model.vo.Member;
import com.spring.beautifly.order.model.service.OrderService;
import com.spring.beautifly.order.model.vo.Order;
import com.spring.beautifly.product.model.service.ProductService;
import com.spring.beautifly.product.model.vo.Attachment;
import com.spring.beautifly.product.model.vo.Product;


@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService productService;
	
	// 주문 작성하기
	@RequestMapping("/order/orderInsert.do")
	public String orderInsert(HttpSession session, Model model) {
		Map<String, Object> map = new HashMap<>();
                
        if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
        
            //로그인한 상태이면 실행
	        Map<String, Object> cmap = new HashMap<String, Object>();
            List<Cart> list = cartService.listCart(memberId); // 장바구니 정보
            int sumMoney = cartService.sumMoney(memberId); // 장바구니 전체 금액 호출
            
            //배송료 계산
            //50000원이 넘으면 배송료가 0원, 안넘으면 2500원
            int fee = sumMoney >= 50000 ? 0 : 2500; 
            
            //hash map에 장바구니에 넣을 각종 값들을 저장함
            cmap.put("list", list);                // 장바구니 정보를 map에 저장
            cmap.put("count", list.size());        // 장바구니 상품의 유무
            cmap.put("sumMoney", sumMoney);        // 장바구니 전체 금액
            cmap.put("fee", fee);                 // 배송금액
            cmap.put("allSum", sumMoney+fee);    // 주문 상품 전체 금액
            
            model.addAttribute("cmap", cmap); //데이터 저장

            //return "views/cart/cartList"; //화면 이동

        } else { //로그인하지 않은 상태

            return "views/member/Login";
            //로그인을 하지 않았으면 로그인 페이지로 이동시킨다.
        }
		
		
		return "views/order/orderInsert";
	}
	
	
	// 주문 작성한 거 db에 저장하기
	@RequestMapping("/order/orderInsertEnd.do")
	public String orderInsert(Cart cart, Order order, HttpSession session, Model model) {
		
		// 주소 API 넣기
		String AddressAPI = order.getAddress1() + ", " + order.getAddress2() + ", " + order.getAddress3();
		
		order.setOrderAddress(AddressAPI);
		
		// productNo int 배열에 넣기
//		int[] pnoArr = null;
//		for (int i = 0; i < pnoArr.length; i++) {
//			pnoArr[i].
//			
//		}
		
		String loc = "/index";
		String msg = "";
		
		// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
	        order.setMemberId(memberId);
	        System.out.println(memberId);
	        
	        
	        orderService.insertOrder(order);
	            
	        msg = "주문 완료";
	        
	        model.addAttribute("order", order);
			
	        return "views/pay/Pay";
	        
		}
		else {
			msg = "로그인한 사용자만 이용 가능합니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		// 로그인하지 않은 상태이면 로그인 화면으로 이동
		return "views/member/Login";
	}
	
	
	/*
	// 결제 정보를 저장하기 위해 오더 정보 넘겨주는 페이지
	@RequestMapping("/order/orderList.do")
	@ResponseBody
	public List<Order> orderList(Order order, Model model) {
		
		List<Order> orderList = orderService.selectOrderList();
		
		model.addAttribute("orderList", orderList);
		
		
		return orderList;
		
	}
	*/
	
	// 결제 정보를 저장하기 위해 오더 정보 넘겨주는 페이지
	@RequestMapping("/order/orderList.do")
	public String orderList(@RequestParam String memberId, Model model, HttpSession session) {
		
		memberId = ((Member)session.getAttribute("member")).getMemberId();
		
		List<Order> orderList = orderService.selectOrderList(memberId);
		
		model.addAttribute("orderList", orderList);
		
		
		return "views/mypage/user/ProductOrderView";
		
	}
	
	// 결제 정보를 저장하기 위해 오더 정보 넘겨주는 페이지
	@RequestMapping("/order/delivery.do")
	public String delivery() {
		
		return "views/mypage/user/DeliveryView";
		
	}
	
	// 결제 정보를 저장하기 위해 오더 정보 넘겨주는 페이지
	@RequestMapping("/order/directOrderInsertView.do")
	public String directOrderInsertView(@RequestParam int productNo, Model model, HttpSession session) {
		
		if((Member)session.getAttribute("member")!=null) { 
		
			Product product = productService.selectOneProduct(productNo);
			
			model.addAttribute("product", product);
		
		} else {
			String msg = "로그인한 사용자만 이용 가능 합니다.";
			
			model.addAttribute("msg", msg);
			
			return "views/member/Login";
		}
		
		return "views/order/DirectOrderInsert";
		
	}
	
	// 관리자 페이지에서 결제 정보를 저장하기 위해 오더 정보 넘겨주는 페이지
	@RequestMapping("/order/AdminOrderList.do")
	public String orderList2( Model model, HttpSession session) {
		
		List<Order> orderList = orderService.selectOrderList2();
		
		model.addAttribute("orderList", orderList);
		
		
		return "views/mypage/admin/AdminProductOrderView";
		
	}
	

}
