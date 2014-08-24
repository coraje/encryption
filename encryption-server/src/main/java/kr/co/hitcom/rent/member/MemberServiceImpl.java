package kr.co.hitcom.rent.member;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.hitcom.rent.application.ApplicationVO;
import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
@Service("memberService")
public class MemberServiceImpl extends AbstractServiceImpl implements MemberService{

	/** The qna dao. */
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub
		return memberDAO.idCheck(id);
	}

	@Override
	public boolean join(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.join(memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.login(memberVO);
	}

	@Override
	public MemberVO getMember(String member_no) {
		// TODO Auto-generated method stub
		return memberDAO.getMember(member_no);
	}

	@Override
	public boolean informationModify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.informationModify(memberVO);
	}

	@Override
	public ArrayList<MemberVO> myPage(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.myPage(memberVO);
	}

	@Override
	public int applicationListCount(Long member_no) {
		// TODO Auto-generated method stub
		return memberDAO.applicationListCount(member_no);
	}

	@Override
	public int getReserveFund(Long member_no) {
		// TODO Auto-generated method stub
		return memberDAO.getReserveFund(member_no);
	}

	@Override
	public int getIdCount(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.getIdCount(member_id);
	}

	@Override
	public void insertKey(String randomKey) {
		memberDAO.insertKey(randomKey);
		
	}

	@Override
	public void insertMail(MemberVO memberVO) {
		memberDAO.insertMail(memberVO);
		
	}

	@Override
	public MemberVO getMemberPass(String member_id) {
		// TODO Auto-generated method stub
		return memberDAO.getMemberPass(member_id);
	}

	@Override
	public MemberVO keyCheck(String key) {
		// TODO Auto-generated method stub
		return memberDAO.keyCheck(key);
	}

	@Override
	public void secession(String member_no) {
		// TODO Auto-generated method stub
		memberDAO.secession(member_no);
	}

	@Override
	public int getEmailCount(String email) {
		// TODO Auto-generated method stub
		return memberDAO.getEmailCount(email);
	}

	





}
