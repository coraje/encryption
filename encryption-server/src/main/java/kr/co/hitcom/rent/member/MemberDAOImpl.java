package kr.co.hitcom.rent.member;

import java.util.ArrayList;

import kr.co.hitcom.common.AbstractDAO;
import kr.co.hitcom.rent.application.ApplicationVO;

import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAOImpl extends AbstractDAO implements MemberDAO {

	@Override
	public boolean idCheck(String id) {
		// TODO Auto-generated method stub

		boolean result = false;
		System.out.println("id==========================" + id);
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Member.selectMemberCount", id);

		if (count == 0) {
			result = true;
		}

		return result;
	}

	// 회원가입
	@Override
	public boolean join(MemberVO memberVO) {

		boolean result = false;

		Object obj = this.insert("Member.insertMember", memberVO);
		logger.debug(obj);
		
		Long maxCnt = (Long) getSqlMapClientTemplate().queryForObject("Member.selectLastMember");
		
		memberVO.setMember_no(maxCnt);
		
		this.insert("Member.insertAddress", memberVO);
		
		result = true;
	

		return result;
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
		String id = memberVO.getMember_id();
		
		memberVO = (MemberVO) this.getSqlMapClientTemplate().queryForObject(
				"Member.selectMember", id);
		
//		if(memberVO!=null){
//			result = 1;
//		}
//		if(!memberVO.getPasswd().equals(resultVO.getPasswd())){
//			result = 0;
//		}
		return memberVO;
	}
	
	@Override
	public MemberVO getMember(String member_no) {
		Long no = Long.valueOf(member_no);
		// TODO Auto-generated method stub
		
		MemberVO memberVO = (MemberVO) this.getSqlMapClientTemplate().queryForObject(
				"Member.getMember", no);
		return memberVO;
	}
	// 회원정보변경
	@Override
	public boolean informationModify(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
		boolean result = false;

		Object obj = this.update("Member.updateMember", memberVO);
		logger.debug(obj);

		this.update("Member.updateAddress", memberVO);
	
		result = true;

		return result;
	}
	// 마이페이지
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<MemberVO> myPage(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return (ArrayList<MemberVO>) this.list("Member.selectMyPage", memberVO);
	}

	@Override
	public int applicationListCount(Long member_no) {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().queryForObject("Member.selectMyApplicationListCount", member_no);
	}

	@Override
	public int getReserveFund(Long member_no) {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().queryForObject("Member.selectReserveFund", member_no);
	}

	@Override
	public int getIdCount(String member_id) {
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Member.selectIdCount", member_id);
		return count;
	}

	@Override
	public void insertKey(String randomKey) {
		this.insert("Member.insertKey", randomKey);
		
	}

	@Override
	public void insertMail(MemberVO memberVO) {
		this.update("Member.updatetMail", memberVO);
	
		
	}

	@Override
	public MemberVO getMemberPass(String member_id) {
		MemberVO memberVO = (MemberVO) this.getSqlMapClientTemplate().queryForObject(
				"Member.getMemberPass", member_id);
		return memberVO;
	}

	@Override
	public MemberVO keyCheck(String key) {
		MemberVO MemberVO = (MemberVO) this.getSqlMapClientTemplate().queryForObject(
				"Member.selectMail", key);
		return MemberVO;
	}

	@Override
	public void secession(String member_no) {
		this.update("Member.secession", member_no);
		
	}

	@Override
	public int getEmailCount(String email) {
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Member.selectEmailCount", email);
		return count;
	}
	

}
