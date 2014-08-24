package kr.co.hitcom.rent.member;

import java.util.ArrayList;

import kr.co.hitcom.rent.application.ApplicationVO;

public interface MemberDAO {

	boolean idCheck(String id);

	boolean join(MemberVO memberVO);

	MemberVO login(MemberVO memberVO);

	MemberVO getMember(String member_no);

	boolean informationModify(MemberVO memberVO);

	ArrayList<MemberVO> myPage(MemberVO memberVO);

	int applicationListCount(Long member_no);

	int getReserveFund(Long member_no);

	int getIdCount(String member_id);

	void insertKey(String randomKey);

	void insertMail(MemberVO memberVO);

	MemberVO getMemberPass(String member_id);

	MemberVO keyCheck(String key);

	void secession(String member_no);

	int getEmailCount(String email);


}
