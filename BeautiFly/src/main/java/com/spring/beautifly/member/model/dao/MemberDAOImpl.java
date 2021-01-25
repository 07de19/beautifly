package com.spring.beautifly.member.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.beautifly.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}

	@Override
	public Member selectOneMember(String memberId) {
		return sqlSession.selectOne("memberMapper.loginMember", memberId);
	}

	@Override
	public int updateMember(Member member) {
		return sqlSession.update("memberMapper.updateMember", member);
	}

	@Override
	public int checkIdDuplicate(HashMap<String, Object> hmap) {
		
		sqlSession.selectOne("memberMapper.checkIdDuplicate", hmap);
		
		return (Integer)hmap.get("result");
	}

	@Override
	public int deleteMember(String memberId) {
		return sqlSession.delete("memberMapper.deleteMember", memberId);
	}

	@Override
	public List<Map<String, String>> selectMemberList() {
		return sqlSession.selectList("memberMapper.selectMemberList");
	}

	

}
