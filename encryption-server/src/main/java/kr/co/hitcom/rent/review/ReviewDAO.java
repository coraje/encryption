package kr.co.hitcom.rent.review;

import java.util.ArrayList;

public interface ReviewDAO {

	void reviewRegistration(ReviewVO reviewVO);

	int reviewListCount();

	ArrayList<ReviewVO> reviewList(ReviewVO reviewVO);

	int reviewTrainListCount();

	ArrayList<ReviewVO> reviewTrainList(ReviewVO reviewVO);

	int reviewVillageListCount();

	ArrayList<ReviewVO> reviewVillageList(ReviewVO reviewVO);

	int retrievalListCount(String retrieval);

	ArrayList<ReviewVO> retrievalList(ReviewVO reviewVO);

	void reviewDelete(Long id);

}
