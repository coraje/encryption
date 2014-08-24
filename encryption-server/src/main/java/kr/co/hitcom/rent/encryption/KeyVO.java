package kr.co.hitcom.rent.encryption;

public class KeyVO {
	
	private String admin_id;
	
	private String password;
	
	private String encrypt_key;
	
	private String backup_date;
	
	private String create_date;
	
	private String discard_date;
	
	private String restore_date;
	
	private String state;

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEncrypt_key() {
		return encrypt_key;
	}

	public void setEncrypt_key(String encrypt_key) {
		this.encrypt_key = encrypt_key;
	}

	public String getBackup_date() {
		return backup_date;
	}

	public void setBackup_date(String backup_date) {
		this.backup_date = backup_date;
	}

	public String getCreate_date() {
		return create_date;
	}

	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}

	public String getDiscard_date() {
		return discard_date;
	}

	public void setDiscard_date(String discard_date) {
		this.discard_date = discard_date;
	}

	public String getRestore_date() {
		return restore_date;
	}

	public void setRestore_date(String restore_date) {
		this.restore_date = restore_date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	
}
