package kr.co.hitcom.rent.inquiry;

import java.util.ArrayList;

import kr.co.hitcom.common.AbstractDAO;
import kr.co.hitcom.rent.notice.NoticeVO;

import org.springframework.stereotype.Repository;

@Repository("inquiryDAO")
public class InquiryDAOImpl extends AbstractDAO implements InquiryDAO{

	@Override
	public void inquiryRegistration(InquiryVO inquiryVO) {

			Object obj = this.insert("Inquiry.insertInquiry", inquiryVO);	
			logger.debug(obj);
			Long maxCnt = (Long) getSqlMapClientTemplate().queryForObject("Inquiry.selectLastInquiry");
			inquiryVO.setRe_ref(maxCnt);
			inquiryVO.setRe_lev(0);
			inquiryVO.setRe_seq(0);
			inquiryVO.setInquiry_id(maxCnt);
			this.update("Inquiry.updateRe", inquiryVO);		
		
	}

	@Override
	public InquiryVO getInquiry(int number) {
		InquiryVO inquiryVO= (InquiryVO) this.getSqlMapClientTemplate().queryForObject("Inquiry.selectInquiry", number); 
		return inquiryVO;
	}

	@Override
	public void inquiryModify(InquiryVO inquiryVO) {
		// TODO Auto-generated method stub
		this.update("Inquiry.updateInquiry", inquiryVO);
	}

	@Override
	public void inquiryDelete(int number) {
		// TODO Auto-generated method stub
		this.update("Inquiry.deleteInquiry", number);

	}

	@Override
	public void answerRegistration(InquiryVO inquiryVO) {
		Object obj = this.insert("Inquiry.insertAnswer", inquiryVO);
		logger.debug(obj);
		
	}

	@Override
	public int inquiryListCount() {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().queryForObject("Inquiry.selectInquiryListCount");
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<InquiryVO> inquiryList(InquiryVO inquiryVO) {
		// TODO Auto-generated method stub
		return (ArrayList<InquiryVO>) this.list("Inquiry.selectInquiryList", inquiryVO);
	}

}
