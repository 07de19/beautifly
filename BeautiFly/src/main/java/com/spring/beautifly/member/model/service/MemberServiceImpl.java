package com.spring.beautifly.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.beautifly.member.model.dao.MemberDAO;
import com.spring.beautifly.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

	@Override
	public Member selectOneMember(String memberId) {
		return memberDAO.selectOneMember(memberId);
	}

	@Override
	public int updateMember(Member member) {
		return memberDAO.updateMember(member);
	}

	@Override
	public int checkIdDuplicate(String memberId) {
		// 콜러블 스테이트먼트 사용하는 방법
		HashMap<String, Object> hmap = new HashMap<String, Object>();
		hmap.put("memberId", memberId);
		
		return memberDAO.checkIdDuplicate(hmap);
	}

	@Override
	public int deleteMember(String memberId) {
		return memberDAO.deleteMember(memberId);
	}

	@Override
	public List<Map<String, String>> selectMemberList() {
		return memberDAO.selectMemberList();
	}

	

}
