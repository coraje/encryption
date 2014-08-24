package kr.co.hitcom.rent.encryption;


public interface EncryptionService {

	
	void insertGlobalPolicy(PolicyVO policyVO);

	void insertColumnPolicy(PolicyVO policyVO);

	void insertKey(KeyVO keyVO);

	void insertKEK(KeyVO keyVO);

	void insertPolicyAC(AccessControlVO accessControlVO);

	void insertBehaviorAC(AccessControlVO accessControlVO);


}
