package kr.co.hitcom.rent.inquiry;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("inquiryService")
public class InquiryServiceImpl extends AbstractServiceImpl implements InquiryService{
	
	/** The qna dao. */
	@Resource(name="inquiryDAO")
	private InquiryDAO inquiryDAO;

	@Override
	public void inquiryRegistration(InquiryVO inquiryVO) {
		// TODO Auto-generated method stub
		inquiryDAO.inquiryRegistration(inquiryVO);
	}

	@Override
	public InquiryVO getInquiry(int number) {
		// TODO Auto-generated method stub
		return inquiryDAO.getInquiry(number);
	}

	@Override
	public void inquiryModify(InquiryVO inquiryVO) {
		// TODO Auto-generated method stub
		inquiryDAO.inquiryModify(inquiryVO);
	}

	@Override
	public void inquiryDelete(int number) {
		inquiryDAO.inquiryDelete(number);
		
	}

	@Override
	public void answerRegistration(InquiryVO inquiryVO) {
		// TODO Auto-generated method stub
		inquiryDAO.answerRegistration(inquiryVO);
	}

	@Override
	public int inquiryListCount() {
		// TODO Auto-generated method stub
		return inquiryDAO.inquiryListCount();
	}

	@Override
	public ArrayList<InquiryVO> inquiryList(InquiryVO inquiryVO) {
		// TODO Auto-generated method stub
		return inquiryDAO.inquiryList(inquiryVO);
	}

}
