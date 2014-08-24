package kr.co.hitcom.rent.inquiry;

public class InquiryVO {

	private Long member_no;
	
	private Long inquiry_id;
	
	private Long re_ref;
	
	private int re_lev;
	
	private int re_seq;
	
	private String registration_date;
	
	private String inquiry_content;
	
	private String inquiry_subject;
	
	private int startrow;

	private int endrow;
	
	private String name;
	
	private String delete_date;
	
	private String member_id;
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Long getMember_no() {
		return member_no;
	}

	public void setMember_no(Long member_no) {
		this.member_no = member_no;
	}

	public Long getInquiry_id() {
		return inquiry_id;
	}

	public void setInquiry_id(Long inquiry_id) {
		this.inquiry_id = inquiry_id;
	}

	public Long getRe_ref() {
		return re_ref;
	}

	public void setRe_ref(Long re_ref) {
		this.re_ref = re_ref;
	}

	public int getRe_lev() {
		return re_lev;
	}

	public void setRe_lev(int re_lev) {
		this.re_lev = re_lev;
	}

	public int getRe_seq() {
		return re_seq;
	}

	public void setRe_seq(int re_seq) {
		this.re_seq = re_seq;
	}

	public String getRegistration_date() {
		return registration_date;
	}

	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}

	public String getInquiry_content() {
		return inquiry_content;
	}

	public void setInquiry_content(String inquiry_content) {
		this.inquiry_content = inquiry_content;
	}

	public String getInquiry_subject() {
		return inquiry_subject;
	}

	public void setInquiry_subject(String inquiry_subject) {
		this.inquiry_subject = inquiry_subject;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDelete_date() {
		return delete_date;
	}

	public void setDelete_date(String delete_date) {
		this.delete_date = delete_date;
	}

	
	
	
	
}
