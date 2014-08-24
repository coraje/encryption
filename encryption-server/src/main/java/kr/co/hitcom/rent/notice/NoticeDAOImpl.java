package kr.co.hitcom.rent.notice;

import java.util.ArrayList;

import kr.co.hitcom.common.AbstractDAO;
import kr.co.hitcom.rent.application.ApplicationVO;

import org.springframework.stereotype.Repository;


@Repository("noticeDAO")
public class NoticeDAOImpl extends AbstractDAO implements NoticeDAO{
	
	
	
	
	
	@Override
	public int getNoticeListCount() {
		// TODO Auto-generated method stub
		
		int count= (Integer)this.getSqlMapClientTemplate().queryForObject("Notice.selectNoticeListCount"); 
		
		return count;
	}
	// 공지등록
	@Override
	public void noticeRegistration(NoticeVO noticeVO) {
		Object obj = this.insert("Notice.insertNotice", noticeVO);
		logger.debug(obj);
		
	}
	
	@Override
	public NoticeVO getNotice(int number) {
		NoticeVO noticeVO= (NoticeVO) this.getSqlMapClientTemplate().queryForObject("Notice.selectNotice", number); 
		return noticeVO;
	}
	@Override
	public void noticeModify(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		this.update("Notice.updateNotice", noticeVO);
	}
	@Override
	public void noticeDelete(int number) {
		// TODO Auto-generated method stub
		this.delete("Notice.deleteNotice", number);
	}
	@Override
	public int noticeListCount() {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().queryForObject("Notice.selectNoticeListCount");
	}
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<NoticeVO> noticeList(NoticeVO noticeVO) {
		// TODO Auto-generated method stub
		return (ArrayList<NoticeVO>) this.list("Notice.selectNoticeList", noticeVO);
	}

	
	
}
