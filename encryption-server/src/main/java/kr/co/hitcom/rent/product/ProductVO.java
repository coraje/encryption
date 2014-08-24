package kr.co.hitcom.rent.product;

public class ProductVO {

	private Long product_id;
	
	// 상품 코멘트
	private String product_comment;

	private String product_date;
	
	// 상품 이미지경로
	private String product_mainimage_path;
	
	private String product_textimage_path;
	
	private String product_subimage_path;
	
	//등록일
	private String registration_date;
	
	// 상품 설명
	private String product_content;

	private String product_title;

	//상품 가격
	private int product_price;
	
	//상품진행상황
	private String progress;
	
	private String product_status;
	
	//옵션
	private String option_name;
	
	private int option_price;
	
	public Long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}

	public String getProduct_comment() {
		return product_comment;
	}

	public void setProduct_comment(String product_comment) {
		this.product_comment = product_comment;
	}

	public String getProduct_date() {
		return product_date;
	}

	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}

	public String getProduct_content() {
		return product_content;
	}

	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_mainimage_path() {
		return product_mainimage_path;
	}

	public void setProduct_mainimage_path(String product_mainimage_path) {
		this.product_mainimage_path = product_mainimage_path;
	}

	public String getProduct_textimage_path() {
		return product_textimage_path;
	}

	public void setProduct_textimage_path(String product_textimage_path) {
		this.product_textimage_path = product_textimage_path;
	}

	public String getProduct_subimage_path() {
		return product_subimage_path;
	}

	public void setProduct_subimage_path(String product_subimage_path) {
		this.product_subimage_path = product_subimage_path;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}

	public String getOption_name() {
		return option_name;
	}

	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	

}
