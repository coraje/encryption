package kr.co.hitcom.rent.application;

import java.util.ArrayList;

public class ApplicationVO {

	/* APPLICATION */

	// 신청일련번호
	private Long application_id;
	// 회원일련번호
	private Long member_no;
	// 상품일련번호
	private Long product_id;
	// 입급자명
	private String sender_name;
	// 인원
	private int personnel;
	// 신청일
	private String application_date;

	// 신청자 이름
	private String name;
	// 신청자 성별
	private String gender;
	// 신청자 전화번호
	private String msisdn;
	// 신청자 나이
	private int age;

	private String birthday;
	
	/* FRIEND_PROFILE */

	// 친구이름
	private ArrayList<String> friend_name_list;
	// 친구성별
	private ArrayList<String> friend_gender_list;
	// 친구전화번호
	private ArrayList<String> friend_msisdn_list;
	// 친구이름
	private ArrayList<String> friend_age_list;

	// 친구이름
	private String friend_name;
	// 친구성별
	private String friend_gender;
	// 친구전화번호
	private String friend_msisdn;
	// 친구이름
	private String friend_age;

	/* PRODUCT */

	// 상품 코멘트
	private String product_comment;

	private String product_date;

	// 상품 이미지경로
	private String product_mainimage_path;
	
	private String product_textimage_path;
	
	private String product_subimage_path;

	// 등록일
	private String registration_date;

	// 상품 설명
	private String product_content;

	private String product_title;

	// 상품 가격
	private int product_price;
	
	private String progress;
	
	private String product_status;
	
	//옵션
	private int option_price;

	/* 기타 */

	private int startrow;

	private int endrow;
	
	// 적립금
	private int reserve_fund;
	
	// 결제여부	
	private String payment_status;
	
	// 결제금액 => 나중에 이벤트성(예:동반인원 4명이상일때 한명무료)일때 반영해야함.  현재 db에 컬럽없음	
	private String payment_price;
	
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

	public Long getApplication_id() {
		return application_id;
	}

	public void setApplication_id(Long application_id) {
		this.application_id = application_id;
	}

	public Long getMember_no() {
		return member_no;
	}

	public void setMember_no(Long member_no) {
		this.member_no = member_no;
	}

	public Long getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Long product_id) {
		this.product_id = product_id;
	}

	public String getSender_name() {
		return sender_name;
	}

	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}

	public String getApplication_date() {
		return application_date;
	}

	public void setApplication_date(String application_date) {
		this.application_date = application_date;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public ArrayList<String> getFriend_name_list() {
		return friend_name_list;
	}

	public void setFriend_name_list(ArrayList<String> friend_name_list) {
		this.friend_name_list = friend_name_list;
	}

	public ArrayList<String> getFriend_gender_list() {
		return friend_gender_list;
	}

	public void setFriend_gender_list(ArrayList<String> friend_gender_list) {
		this.friend_gender_list = friend_gender_list;
	}

	public ArrayList<String> getFriend_msisdn_list() {
		return friend_msisdn_list;
	}

	public void setFriend_msisdn_list(ArrayList<String> friend_msisdn_list) {
		this.friend_msisdn_list = friend_msisdn_list;
	}

	public ArrayList<String> getFriend_age_list() {
		return friend_age_list;
	}

	public void setFriend_age_list(ArrayList<String> friend_age_list) {
		this.friend_age_list = friend_age_list;
	}

	public String getFriend_name() {
		return friend_name;
	}

	public void setFriend_name(String friend_name) {
		this.friend_name = friend_name;
	}

	public String getFriend_gender() {
		return friend_gender;
	}

	public void setFriend_gender(String friend_gender) {
		this.friend_gender = friend_gender;
	}

	public String getFriend_msisdn() {
		return friend_msisdn;
	}

	public void setFriend_msisdn(String friend_msisdn) {
		this.friend_msisdn = friend_msisdn;
	}

	public String getFriend_age() {
		return friend_age;
	}

	public void setFriend_age(String friend_age) {
		this.friend_age = friend_age;
	}

	public int getReserve_fund() {
		return reserve_fund;
	}

	public void setReserve_fund(int reserve_fund) {
		this.reserve_fund = reserve_fund;
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


	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}

	public String getPayment_price() {
		return payment_price;
	}

	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
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

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	
	

	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	@Override
	public String toString() {
		return "ApplicationVO [application_id=" + application_id
				+ ", member_no=" + member_no + ", product_id=" + product_id
				+ ", sender_name=" + sender_name + ", personnel=" + personnel
				+ ", application_date=" + application_date + ", name=" + name
				+ ", gender=" + gender + ", msisdn=" + msisdn + ", age=" + age
				+ ", product_comment="
				+ product_comment + ", product_date=" + product_date
				+ ", product_mainimage_path=" + product_mainimage_path
				+ ", product_textimage_path=" + product_textimage_path
				+ ", product_subimage_path=" + product_subimage_path
				+ ", registration_date=" + registration_date
				+ ", product_content=" + product_content + ", product_title="
				+ product_title + ", product_price=" + product_price
				+ ", startrow=" + startrow + ", endrow=" + endrow
				+ ", reserve_fund=" + reserve_fund + "]";
	}

}