package kr.co.hitcom.rent.inquiry;

import java.util.ArrayList;

public interface InquiryService {

	void inquiryRegistration(InquiryVO inquiryVO);

	InquiryVO getInquiry(int number);

	void inquiryModify(InquiryVO inquiryVO);
	
	void inquiryDelete(int number);

	void answerRegistration(InquiryVO inquiryVO);

	int inquiryListCount();

	ArrayList<InquiryVO> inquiryList(InquiryVO inquiryVO);

}
