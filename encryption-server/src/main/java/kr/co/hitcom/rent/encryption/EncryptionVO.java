package kr.co.hitcom.rent.encryption;

public class EncryptionVO {
	// 일련번호
	private Long member_no;
	// 아이디
	private String member_id;

	private String passwd;

	// 주민번호
	private String social_security_number;

	private String name;

	private String msisdn;

	private String email;
	// 가입일자
	private String join_date;
	// 탈퇴일자
	private String withraw_date;
	// 적립금
	private int reserve_fund;
	// 성별
	private String gender;
	// 나이
	private int age;
	// 기혼여부
	private String marriage;
	// 기념일
	private String anniversary;
	// 서브 핸드폰번호
	private String msisdn_sub;
	// sms 수신동의
	private String sms_opt_in;
	// email 수신동의
	private String email_opt_in;

	// 우편번호
	private String post_code;

	// 주소 (시,구,동)
	private String address_main;

	// 주소 상세
	private String address_detail;

	// 생일
	private String birthday;

	// 관리자 여부
	private String isadmin;
	
	//인원
	private int personnel;
	
	private String review_status;
	
	//상품
	private String product_status;
	
	private String product_title;
	
	private int product_price;
	
	private String product_date;
	
	private String payment_status;
	
	private String progress;
	
	private Long application_id;
	
	// 리스트
	private int startrow;

	private int endrow;
	
	private String mail_key;
	
	//옵션
	private int option_price;
	
	public Long getMember_no() {
		return member_no;
	}

	public void setMember_no(Long member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getSocial_security_number() {
		return social_security_number;
	}

	public void setSocial_security_number(String social_security_number) {
		this.social_security_number = social_security_number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMsisdn() {
		return msisdn;
	}

	public void setMsisdn(String msisdn) {
		this.msisdn = msisdn;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJoin_date() {
		return join_date;
	}

	public void setJoin_date(String join_date) {
		this.join_date = join_date;
	}

	public String getWithraw_date() {
		return withraw_date;
	}

	public void setWithraw_date(String withraw_date) {
		this.withraw_date = withraw_date;
	}

	public int getReserve_fund() {
		return reserve_fund;
	}

	public void setReserve_fund(int reserve_fund) {
		this.reserve_fund = reserve_fund;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMarriage() {
		return marriage;
	}

	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}

	public String getAnniversary() {
		return anniversary;
	}

	public void setAnniversary(String anniversary) {
		this.anniversary = anniversary;
	}

	public String getMsisdn_sub() {
		return msisdn_sub;
	}

	public void setMsisdn_sub(String msisdn_sub) {
		this.msisdn_sub = msisdn_sub;
	}

	public String getSms_opt_in() {
		return sms_opt_in;
	}

	public void setSms_opt_in(String sms_opt_in) {
		this.sms_opt_in = sms_opt_in;
	}

	public String getEmail_opt_in() {
		return email_opt_in;
	}

	public void setEmail_opt_in(String email_opt_in) {
		this.email_opt_in = email_opt_in;
	}

	public String getPost_code() {
		return post_code;
	}

	public void setPost_code(String post_code) {
		this.post_code = post_code;
	}

	public String getAddress_main() {
		return address_main;
	}

	public void setAddress_main(String address_main) {
		this.address_main = address_main;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getIsadmin() {
		return isadmin;
	}

	public void setIsadmin(String isadmin) {
		this.isadmin = isadmin;
	}

	public int getPersonnel() {
		return personnel;
	}

	public void setPersonnel(int personnel) {
		this.personnel = personnel;
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

	public String getProduct_date() {
		return product_date;
	}

	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}

	public String getPayment_status() {
		return payment_status;
	}

	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
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

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}

	public String getReview_status() {
		return review_status;
	}

	public void setReview_status(String review_status) {
		this.review_status = review_status;
	}

	public String getProduct_status() {
		return product_status;
	}

	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}

	public Long getApplication_id() {
		return application_id;
	}

	public void setApplication_id(Long application_id) {
		this.application_id = application_id;
	}

	public String getMail_key() {
		return mail_key;
	}

	public void setMail_key(String mail_key) {
		this.mail_key = mail_key;
	}

	
	
	public int getOption_price() {
		return option_price;
	}

	public void setOption_price(int option_price) {
		this.option_price = option_price;
	}

	@Override
	public String toString() {
		return "MemberVO [member_no=" + member_no + ", member_id=" + member_id
				+ ", passwd=" + passwd + ", social_security_number="
				+ social_security_number + ", name=" + name + ", msisdn="
				+ msisdn + ", email=" + email + ", join_date=" + join_date
				+ ", withraw_date=" + withraw_date + ", reserve_fund="
				+ reserve_fund + ", gender=" + gender + ", age=" + age
				+ ", marriage=" + marriage + ", anniversary=" + anniversary
				+ ", msisdn_sub=" + msisdn_sub + ", sms_opt_in=" + sms_opt_in
				+ ", email_opt_in=" + email_opt_in + ", post_code=" + post_code
				+ ", address_main=" + address_main + ", address_detail="
				+ address_detail + ", birthday=" + birthday + ", isadmin="
				+ isadmin + "]";
	}
}
