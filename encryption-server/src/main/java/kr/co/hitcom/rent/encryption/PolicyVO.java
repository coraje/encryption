package kr.co.hitcom.rent.encryption;

public class PolicyVO {
	// global
	private String algorithm;

	private String operate_mode;

	// column
	private String column_name;

	private String hash_check;

	private String hash_salt;

	private String iv_check;

	private String iv_value;

	private String mask_check;

	private String mask_digit;

	private String mask_value;

	private String owner;

	private String partial_encrypt_check;

	private int partial_encrypt_length;

	private String system_apply_date;

	private String table_name;

	// global
	public String getAlgorithm() {
		return algorithm;
	}

	public void setAlgorithm(String algorithm) {
		this.algorithm = algorithm;
	}

	public String getOperate_mode() {
		return operate_mode;
	}

	public void setOperate_mode(String operate_mode) {
		this.operate_mode = operate_mode;
	}

	// column
	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}

	public String getHash_check() {
		return hash_check;
	}

	public void setHash_check(String hash_check) {
		this.hash_check = hash_check;
	}

	public String getHash_salt() {
		return hash_salt;
	}

	public void setHash_salt(String hash_salt) {
		this.hash_salt = hash_salt;
	}

	public String getIv_check() {
		return iv_check;
	}

	public void setIv_check(String iv_check) {
		this.iv_check = iv_check;
	}

	public String getIv_value() {
		return iv_value;
	}

	public void setIv_value(String iv_value) {
		this.iv_value = iv_value;
	}

	public String getMask_check() {
		return mask_check;
	}

	public void setMask_check(String mask_check) {
		this.mask_check = mask_check;
	}

	public String getMask_digit() {
		return mask_digit;
	}

	public void setMask_digit(String mask_digit) {
		this.mask_digit = mask_digit;
	}

	public String getMask_value() {
		return mask_value;
	}

	public void setMask_value(String mask_value) {
		this.mask_value = mask_value;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getPartial_encrypt_check() {
		return partial_encrypt_check;
	}

	public void setPartial_encrypt_check(String partial_encrypt_check) {
		this.partial_encrypt_check = partial_encrypt_check;
	}

	public int getPartial_encrypt_length() {
		return partial_encrypt_length;
	}

	public void setPartial_encrypt_length(int partial_encrypt_length) {
		this.partial_encrypt_length = partial_encrypt_length;
	}

	public String getSystem_apply_date() {
		return system_apply_date;
	}

	public void setSystem_apply_date(String system_apply_date) {
		this.system_apply_date = system_apply_date;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

}
