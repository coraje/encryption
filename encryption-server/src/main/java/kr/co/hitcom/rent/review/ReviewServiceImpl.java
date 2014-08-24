package kr.co.hitcom.rent.review;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("reviewService")
public class ReviewServiceImpl extends AbstractServiceImpl implements
		ReviewService {
	/** The review dao. */
	@Resource(name = "reviewDAO")
	private ReviewDAO reviewDAO;

	@Override
	public void reviewRegistration(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		reviewDAO.reviewRegistration(reviewVO);
	}

	@Override
	public int reviewListCount() {
		// TODO Auto-generated method stub
		return reviewDAO.reviewListCount();
	}

	@Override
	public ArrayList<ReviewVO> reviewList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewList(reviewVO);
	}

	@Override
	public int reviewTrainListCount() {
		// TODO Auto-generated method stub
		return reviewDAO.reviewTrainListCount();
	}

	@Override
	public ArrayList<ReviewVO> reviewTrainList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewTrainList(reviewVO);
	}

	@Override
	public int reviewVillageListCount() {
		// TODO Auto-generated method stub
		return reviewDAO.reviewVillageListCount();
	}

	@Override
	public ArrayList<ReviewVO> reviewVillageList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewVillageList(reviewVO);
	}

	@Override
	public int retrievalListCount(String retrieval) {
		// TODO Auto-generated method stub
		return reviewDAO.retrievalListCount(retrieval);
	}

	@Override
	public ArrayList<ReviewVO> retrievalList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		return reviewDAO.retrievalList(reviewVO);
	}

	@Override
	public void reviewDelete(Long id) {
		// TODO Auto-generated method stub
		reviewDAO.reviewDelete(id);
	}

	

}
