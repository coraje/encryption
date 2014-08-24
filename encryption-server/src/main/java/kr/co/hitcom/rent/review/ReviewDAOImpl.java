package kr.co.hitcom.rent.review;

import java.util.ArrayList;

import kr.co.hitcom.common.AbstractDAO;
import kr.co.hitcom.rent.notice.NoticeVO;

import org.springframework.stereotype.Repository;

@Repository("reviewDAO")
public class ReviewDAOImpl extends AbstractDAO implements ReviewDAO {

	@Override
	public void reviewRegistration(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		Object obj = this.insert("Review.insertReview", reviewVO);
		logger.debug(obj);

		Long maxCnt = (Long) getSqlMapClientTemplate().queryForObject(
				"Review.selectLastReview");
		reviewVO.setReview_id(maxCnt);

		// image insert
		this.insert("Review.insertReviewImage", reviewVO);

		// application 테이블에 reviewStatus 에 y 를 업데이트한다.
		this.update("Review.insertReviewStatus", reviewVO);
	}

	@Override
	public int reviewListCount() {
		String status = "a";
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Review.selectReviewListCount", status);

		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ReviewVO> reviewList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return (ArrayList<ReviewVO>) this.list("Review.selectReviewList", reviewVO);
	}

	@Override
	public int reviewTrainListCount() {
		String status = "b";
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Review.selectReviewTrainListCount", status);

		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ReviewVO> reviewTrainList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return (ArrayList<ReviewVO>) this.list("Review.selectReviewTrainList", reviewVO);
	}

	@Override
	public int reviewVillageListCount() {
		String status = "c";
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Review.selectReviewVillageListCount", status);

		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ReviewVO> reviewVillageList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return (ArrayList<ReviewVO>) this.list("Review.selectReviewVillageList", reviewVO);
	}

	@Override
	public int retrievalListCount(String retrieval) {
		// TODO Auto-generated method stub
		int count = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"Review.selectRetrievalListCount", retrieval);

		return count;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ReviewVO> retrievalList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return (ArrayList<ReviewVO>) this.list("Review.selectRetrievalList", reviewVO);
	}

	@Override
	public void reviewDelete(Long id) {
		this.update("Review.deleteReview", id);
		
	}

}
