package kr.co.hitcom.rent.application;


public class OptionVO {

	//옵션
	private Long application_id;
	
	private Long option_id;
	
	private String option_name;
	
	private int option_price;
	
	private int quantity;

	public Long getOption_id() {
		return option_id;
	}

	public void setOption_id(Long option_id) {
		this.option_id = option_id;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Long getApplication_id() {
		return application_id;
	}

	public void setApplication_id(Long application_id) {
		this.application_id = application_id;
	}

	
	
	
}
