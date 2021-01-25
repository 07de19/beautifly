package com.spring.beautifly.member.model.vo;

import java.sql.Date;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	
	private String memberNo;    // 멤버 고유 번호
	private String memberId;    // 아이디
	private String memberPw;    // 비밀번호
	private String memberType;  // 멤버 타입
	private String memberName;  // 이름
	private String address;     // 주소
	private String tel;         // 전화 번호
	private String email;       // 이메일
	private String gender;        // 성별
	private int age;            // 출생년도
	private Date joinDate;      // 가입일
	private int memberPoint;    // 포인트
	private String grade;       // 회원 등급
	private String status;        // 탈퇴 여부
	
	// 주소
	private String address1;     // 주소 1
	private String address2;     // 주소 2
	private String address3;     // 주소 3

}
