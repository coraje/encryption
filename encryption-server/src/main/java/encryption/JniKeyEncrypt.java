package encryption;

public class JniKeyEncrypt {
	public native String generateKeyEncryptKey();

	public native String generateEncryptKey(String encrypt_key);
	
	static {
		System.load("/svc/libJniKeyEncrypt.so");
	}
	
	public static void main(String[] args) {
		JniKeyEncrypt encrypt = new JniKeyEncrypt();
		String kek = encrypt.generateKeyEncryptKey();
		System.out.println("kek:" + kek);
		
		System.out.println("encryptKey:" + encrypt.generateEncryptKey(kek));
	}
}
