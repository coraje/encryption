package kr.co.hitcom.rent.notice;

import java.util.ArrayList;
import java.util.List;

public interface NoticeDAO {

	int getNoticeListCount();

	void noticeRegistration(NoticeVO noticeVO);

	NoticeVO getNotice(int number);

	void noticeModify(NoticeVO noticeVO);

	void noticeDelete(int number);

	int noticeListCount();

	ArrayList<NoticeVO> noticeList(NoticeVO noticeVO);

	
	
	
	
	
	

}
