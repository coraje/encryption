package kr.co.hitcom.rent.review;

public class ReviewVO {

	// member 일련번호
	private Long member_no;

	// 일련번호
	private Long review_id;

	// 등록일
	private String registration_date;

	// 별점
	private int review_rating;

	private String review_content;

	private String review_title;

	private String image_pass;
	
	private String product_status;

	private String thumb_nail_path;
	
	private Long application_id;
	
	private String review_status;
	
	private int startrow;

	private int endrow;

	private String member_id;
	
	private String content;
	
	private String retrieval;
	
	public Long getMember_no() {
		return member_no;
	}

	public void setMember_no(Long member_no) {
		this.member_no = member_no;
	}

	public Long getReview_id() {
		return review_id;
	}

	public void setReview_id(Long review_id) {
		this.review_id = review_id;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}

	public int getReview_rating() {
		return review_rating;
	}

	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getImage_pass() {
		return image_pass;
	}

	public void setImage_pass(String image_pass) {
		this.image_pass = image_pass;
	}

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}

	public String getThumb_nail_path() {
		return thumb_nail_path;
	}

	public void setThumb_nail_path(String thumb_nail_path) {
		this.thumb_nail_path = thumb_nail_path;
	}

	public Long getApplication_id() {
		return application_id;
	}

	public void setApplication_id(Long application_id) {
		this.application_id = application_id;
	}

	public String getReview_status() {
		return review_status;
	}

	public void setReview_status(String review_status) {
		this.review_status = review_status;
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRetrieval() {
		return retrieval;
	}

	public void setRetrieval(String retrieval) {
		this.retrieval = retrieval;
	}

	

}
