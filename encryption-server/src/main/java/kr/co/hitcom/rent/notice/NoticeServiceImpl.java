package kr.co.hitcom.rent.notice;


import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("noticeService")
public class NoticeServiceImpl extends AbstractServiceImpl implements NoticeService{

	/** The qna dao. */
	@Resource(name="noticeDAO")
	private NoticeDAO noticeDAO;

	@Override
	public int getNoticeListCount() {
		// TODO Auto-generated method stub
		return noticeDAO.getNoticeListCount();
	}

	@Override
	public void noticeRegistration(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDAO.noticeRegistration(noticeVO);
	}

	@Override
	public NoticeVO getNotice(int number) {
		// TODO Auto-generated method stub
		return noticeDAO.getNotice(number);
	}

	@Override
	public void noticeModify(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		noticeDAO.noticeModify(noticeVO);
	}

	@Override
	public void noticeDelete(int number) {
		// TODO Auto-generated method stub
		noticeDAO.noticeDelete(number);
	}

	@Override
	public int noticeListCount() {
		// TODO Auto-generated method stub
		return noticeDAO.noticeListCount();
	}

	@Override
	public ArrayList<NoticeVO> noticeList(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return noticeDAO.noticeList(noticeVO);
	}




}
