package kr.co.hitcom.rent.notice;

import java.util.ArrayList;



public interface NoticeService {

	public int getNoticeListCount();

	public void noticeRegistration(NoticeVO noticeVO);

	public NoticeVO getNotice(int number);

	public void noticeModify(NoticeVO noticeVO);

	public void noticeDelete(int number);

	public int noticeListCount();

	public ArrayList<NoticeVO> noticeList(NoticeVO noticeVO);


	
}
