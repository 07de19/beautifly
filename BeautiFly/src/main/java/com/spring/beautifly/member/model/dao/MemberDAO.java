package com.spring.beautifly.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.beautifly.member.model.vo.Member;

public interface MemberDAO {
	
	int insertMember(Member member);

	Member selectOneMember(String memberId);

	int updateMember(Member member);

	int checkIdDuplicate(HashMap<String, Object> hmap);

	int deleteMember(String memberId);
	
	List<Map<String, String>> selectMemberList();
}
