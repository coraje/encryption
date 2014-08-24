package kr.co.hitcom.rent.encryption;

public class AccessControlVO {

	private String connect_ip;
	
	private String connect_db_user;
	
	private String start_time;
	
	private String end_time;
	
	private String connect_program_name;
	
	private String small_time;
	
	private String small_time_count;
	
	private String big_time;
	
	private String big_time_count;
	
	private String datepickerStart;
	
	private String ptTimeStart;
	
	private String datepickerEnd;
	
	private String ptTimeEnd;

	public String getDatepickerStart() {
		return datepickerStart;
	}

	public void setDatepickerStart(String datepickerStart) {
		this.datepickerStart = datepickerStart;
	}

	public String getPtTimeStart() {
		return ptTimeStart;
	}

	public void setPtTimeStart(String ptTimeStart) {
		this.ptTimeStart = ptTimeStart;
	}

	public String getDatepickerEnd() {
		return datepickerEnd;
	}

	public void setDatepickerEnd(String datepickerEnd) {
		this.datepickerEnd = datepickerEnd;
	}

	public String getPtTimeEnd() {
		return ptTimeEnd;
	}

	public void setPtTimeEnd(String ptTimeEnd) {
		this.ptTimeEnd = ptTimeEnd;
	}

	public String getConnect_ip() {
		return connect_ip;
	}

	public void setConnect_ip(String connect_ip) {
		this.connect_ip = connect_ip;
	}

	public String getConnect_db_user() {
		return connect_db_user;
	}

	public void setConnect_db_user(String connect_db_user) {
		this.connect_db_user = connect_db_user;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public String getConnect_program_name() {
		return connect_program_name;
	}

	public void setConnect_program_name(String connect_program_name) {
		this.connect_program_name = connect_program_name;
	}

	public String getSmall_time() {
		return small_time;
	}

	public void setSmall_time(String small_time) {
		this.small_time = small_time;
	}

	public String getSmall_time_count() {
		return small_time_count;
	}

	public void setSmall_time_count(String small_time_count) {
		this.small_time_count = small_time_count;
	}

	public String getBig_time() {
		return big_time;
	}

	public void setBig_time(String big_time) {
		this.big_time = big_time;
	}

	public String getBig_time_count() {
		return big_time_count;
	}

	public void setBig_time_count(String big_time_count) {
		this.big_time_count = big_time_count;
	}
	
	
	
}
