package com.spring.beautifly.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.beautifly.cart.model.service.CartService;
import com.spring.beautifly.cart.model.vo.Cart;
import com.spring.beautifly.member.model.vo.Member;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	// 제품 상세 페이지에서 제품 정보를 장바구니로 추가해주는 부분
	@RequestMapping("/cart/insertCart.do")
	public String insertCart(Cart cart, HttpSession session, Model model) {
		
		// 로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
	        cart.setMemberId(memberId);
	        System.out.println(memberId);
	        
	        // 장바구니에 기존 상품이 있는지 검사
	        int count = cartService.countCart(cart.getProductNo(), memberId);
	        if(count == 0){
	            // 없으면 insert
	            cartService.insert(cart); // 장바구니 테이블에 저장됨
	        } else {
	            // 있으면 update
	            cartService.updateCart(cart);
	        }
	        
	        System.out.println(cart);
	        
	        model.addAttribute("cart", cart);
	        
	        return "views/cart/cartSucess"; // 성공 화면으로 이동
		}

		// 로그인하지 않은 상태이면 로그인 화면으로 이동
		//return "redirect:views/member/Login";
		return "views/cart/cartFailNotUser";
	}
	
	
	// header 에서 장바구니를 누르면 넘어가는 부분
    @RequestMapping("/cart/cartList.do")
    public String list(HttpSession session, Model model) { // modelAndView는 옛날 거니까 String으로 model 사용하는 걸로 사용하기 
        Map<String, Object> map = new HashMap<>();

        //hashmap은 map(key,value)로 이뤄져 있고,
        //key값은 중복이 불가능 하고 value는 중복이 가능하다.
        //value에 null값도 사용이 가능하다.
        //전달할 정보가 많을 경우에는 HashMap<>을 사용하는 것이 좋다.
        //장바구니에 담을 값들이 많기 때문에 여기선 HashMap<>를 사용한다.
                
        if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
	
	        //session에 저장된 userid를 getAttribute()메소드를 사용해서 얻어오고 오브젝트 타입이기 때문에
	        //String 타입으로 타입변환한다.
        
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

            return "views/cart/cartList"; //화면 이동

        } else { //로그인하지 않은 상태

            return "views/member/Login";
            //로그인을 하지 않았으면 로그인 페이지로 이동시킨다.
        }
    }
    
    // 3. 장바구니 삭제
    @RequestMapping("/cart/cartDelete.do")
    public String delete(@RequestParam int cartNo){
        cartService.delete(cartNo);
        return "redirect:/cart/cartList.do";
    }
    
    // 4. 장바구니 수정
    @RequestMapping("/cart/cartUpdate.do")
    public String update(@RequestParam int[] amount, @RequestParam int[] productNo, HttpSession session) {
        // session의 id
    	if((Member)session.getAttribute("member")!=null) { 
	        String memberId = ((Member)session.getAttribute("member")).getMemberId();
	        System.out.println(memberId);
	        
	        // 레코드의 갯수 만큼 반복문 실행
	        for(int i=0; i<productNo.length; i++){
	            Cart cart = new Cart();
	            cart.setMemberId(memberId);
	            cart.setCountNum(amount[i]);
	            cart.setProductNo(productNo[i]);
	            cartService.modifyCart(cart);
	        }
    	}

        return "views/cart/cartList";
    }

}
