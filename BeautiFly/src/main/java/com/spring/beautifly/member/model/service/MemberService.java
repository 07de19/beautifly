package com.spring.beautifly.member.model.service;

import java.util.List;
import java.util.Map;

import com.spring.beautifly.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member member);

	Member selectOneMember(String memberId);

	int updateMember(Member member);

	int checkIdDuplicate(String memberId);

	int deleteMember(String memberId);
	
	List<Map<String, String>> selectMemberList();
}
