package com.spring.beautifly.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.beautifly.common.exception.MemberException;
import com.spring.beautifly.member.model.service.MemberService;
import com.spring.beautifly.member.model.vo.Member;


@SessionAttributes(value= { "member","memberId" }) // 모델에 멤버라고 담으면 자동으로 세션에 담음
@Controller
public class MemberController {
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/member/memberJoin.do")
	public String memberJoin() {
		
		return "views/member/Join";
	}
	
	@RequestMapping("/member/memberJoinEnd.do")
	public String memberJoinEnd(Member member, Model model) { // 멤버는 CommandMap 객체로 가져오는 것(jsp의 네임값을 세터로 가져옴)
		
		// 주소 API 넣기
		String AddressAPI = member.getAddress1() + ", " + member.getAddress2() + ", " + member.getAddress3();
		
		member.setAddress(AddressAPI);
		
		
		System.out.println("memberEnroll : " + member);
		
		String plainPassword = member.getMemberPw(); // 원문을 가져오기(이 원문을 바탕으로 암호화를 할 것)
		
		String encryptPassword = bcryptPasswordEncoder.encode(plainPassword); // 암호화 해주기
		
		System.out.println("원문 : " + plainPassword);
		System.out.println("암호문 : " +  encryptPassword);
		
		member.setMemberPw(encryptPassword); // 암호화 된 비밀번호 멤버 vo에 저장하기
		
		try {
			// 1. 서비스를 통한 비즈니스 로직 수행
			int result = memberService.insertMember(member);
			
			// 2. 처리 결과에 따라 view 분기 처리
			String loc = "/index";
			String msg = "";
			
			if (result > 0) {
				msg = "회원가입 성공!";
			} else {
				msg = "회원가입 실패!";
			}
			
			model.addAttribute("loc", loc); // Model addAttribute(String name, Object value)
			// value객체를 name이름으로 추가한다. 즉, loc를 "loc"라는 이름으로 추가한다.
			// 뷰 코드에서는 name으로 지정한 이름을 통해서 value를 사용한다.
			model.addAttribute("msg", msg);
			
		} catch(Exception e) {
			System.out.println("회원 가입 에러 발생!!");
			
			// 기존의 예외를 우리만의 지정한 예외 형식으로 
			// 바꾸어 보내기 위해 MemberException을 호출한다.
			throw new MemberException(e.getMessage());
		}
		
		return "views/common/msg";
	}
	
	/*
	@RequestMapping("/member/checkIdDuplicate.do")
    @ResponseBody
    public Map<String, Object> checkIdDuplicate(@RequestParam String memberId){
      
       Map<String, Object> map = new HashMap<String, Object>();
       boolean isUsable
          = memberService.checkIdDuplicate(memberId) == 0 ? true : false;
      
       map.put("isUsable", isUsable);
            
       return map; // list면 list 그냥 통쨰로 넘겨주면 알아서 ajax로 바꿔줌 (@ResponseBody라는 어노테이션만 있다면)
    }
    */
	
	
	@RequestMapping("/member/Login.do")
	public String memberLogin() {
		return "views/member/Login";
	}
	
	
	@RequestMapping("/member/memberLogin.do")
	public String memberLogin(  // modelAndView는 옛날 거니까 String으로 model 사용하는 걸로 사용하기
				@RequestParam String memberId,
				@RequestParam String memberPw, HttpSession session, Model model) { 
		
		String loc = "/index";
		String msg = "";
		
		Member m = memberService.selectOneMember(memberId); 
		// 안에 코드는 세션 쓰는 것 빼고는 1번 방법과 동일함
		
		if(m == null) {
			msg = "존재하지 않는 아이디입니다.";
		} else {
			if(bcryptPasswordEncoder.matches(memberPw, m.getMemberPw())) {
				msg = "로그인 성공";
				model.addAttribute("member", m); // 멤버라는 이름으로 저장을 하면
				// @SessionAttributes 어노테이션에 등록된 'member'로 인식하면서
				System.out.println(m);
				//System.out.println(((Member)session.getAttribute("member")).getMemberId());
				// System.out.println((String)session.getAttribute("member"));
				// 자동으로 세션 영역에 해당 객체를 저장한다.
			} else {
				msg = "비밀번호가 일치하지 않습니다.";
				// 여기에 카운트를 넣어서 비밀번호 몇 회 이상 틀렸을 때 계정을 정지시키는 기능을 넣어도 됨.
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc); // 확장 가능성 때문에 적은 것 (만약 개인페이지로 가게 할 거면 String loc="/member/mypage.do" 등 코드를 수정하면 된다.)
		
		//model.setViewName("views/common/msg");
		
		return "views/common/msg";
		
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String memberLogout(SessionStatus sessionStatus) {
		
		// 현재 세션이 만료되었음을 HttpSession에서 invalidate()메소드로 구현했다면
		// SessionStatus는 .setComplete() 메소드로 구현한다.
		
		// 세션이 끝났다는 건 연결이 끝났다는 것 -> 더 이상 연결을 하지 않겠다
		if (!sessionStatus.isComplete()) { // 세션 연결이 끝나지 않았다면
			sessionStatus.setComplete(); // 끝내라
		}
		return "redirect:/index"; // 홈화면으로 돌아가라
	}
	
	@RequestMapping("/member/memberView.do")
	public String memberView(@RequestParam String memberId, Model model, HttpSession session) {
		
		memberId = ((Member)session.getAttribute("member")).getMemberId();
		if (memberId==null) {
			return "redirect:/member/Login.do";
		}
		
		Member m = memberService.selectOneMember(memberId); // 회원 정보 조회하기
		
		// 조회한 정보를 넣어주기
		model.addAttribute("member", m);
		
		return "views/mypage/user/memberView";
	}
	
	@RequestMapping("/member/memberViewUpdate.do")
	public String memberViewUpdate(@RequestParam String memberId, Model model) {
		
		Member m = memberService.selectOneMember(memberId); // 회원 정보 조회하기
		
		// 조회한 정보를 넣어주기
		model.addAttribute("member", m);
		
		return "views/mypage/user//memberViewUpdate";
	}
	
	@RequestMapping("/member/memberUpdate.do")
	public String memberUpdate(Member member, Model model) {
		
		// 1. 서비스 로직 수행
		int result = memberService.updateMember(member); // 받아와서 member를 수정할 수 있게 해주고
		
		// 2. 처리 결과에 따른 화면 분리
		String loc = "/index";
		String msg = "";
		
		if (result > 0) {
			// 성공
			msg = "회원 정보 수정";
			// 모델에 수정된 정보 넣어주기 (그래야 세션에서 갱신된 최신 정보를 가지고 있음)
			model.addAttribute("member", member);
		} else {
			msg = "회원 정보 수정 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "views/common/msg";
	}
	
	@RequestMapping("/member/memberDelete.do")
	public String memberDelete(SessionStatus sessionStatus, Model model, Member member) {
		// 이 전 페이지에서 member가 없는 데도 불러와 진다
		// -> jsp 화면에서 던져주는 게 없다는 건 리퀘스트 겟 파라미터가 없다는 뜻. 그래서 세션 어트리뷰트에서 있던 멤버 정보를 가져옴
		
		int result = memberService.deleteMember(member.getMemberId());
		
		if (result > 0) {
			sessionStatus.setComplete(); // 끝이라는 처리(회원 탈퇴했는데 로그인이 되어 있으면 안되기 때문에 세션도 만료처리 해줌)
		}
		
		// 2. 처리 결과에 따른 화면 분리
		String loc = "/index";
		String msg = "";
		
		if (result > 0) {
			msg = "회원 탈퇴 성공";
		} else {
			msg = "회원 탈퇴 실패";
		}
		
		//model.addAttribute("loc", loc).addAttribute("msg", msg); // 어차피 반환 자료형이 model이라서 이렇게 이어서 작성해도 됨
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "views/common/msg";
	}
	
	// 관리자 페이지
	@RequestMapping("/member/AdminMemberView.do")
	public String AdminMemberView(Model model) {
		
		List<Map<String, String>> memberList = memberService.selectMemberList();
		
		model.addAttribute("memberList", memberList);
		
		return "views/mypage/admin/AdminMemberView";
	}
	
	
}
