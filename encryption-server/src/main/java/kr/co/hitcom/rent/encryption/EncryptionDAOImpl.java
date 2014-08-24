package kr.co.hitcom.rent.encryption;

import kr.co.hitcom.common.AbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("encryptionDAO")
public class EncryptionDAOImpl extends AbstractDAO implements EncryptionDAO {


	
	@Override
	public void insertGlobalPolicy(PolicyVO policyVO) {
		// TODO Auto-generated method stub
		this.insert("Encryption.insertGlobalPolicy", policyVO);
	}

	@Override
	public void insertColumnPolicy(PolicyVO policyVO) {
		// TODO Auto-generated method stub
		this.insert("Encryption.insertColumnPolicy", policyVO);
	}

	@Override
	public void insertKey(KeyVO keyVO) {
		// TODO Auto-generated method stub
		this.insert("Encryption.insertKey", keyVO);
	}
	
	@Override
	public void insertKEK(KeyVO keyVO) {
		// TODO Auto-generated method stub
		this.insert("Encryption.insertKEK", keyVO);
	}

	@Override
	public void insertPolicyAC(AccessControlVO accessControlVO) {
		// TODO Auto-generated method stub
		this.insert("Encryption.insertPolicyAC", accessControlVO);
	}

	@Override
	public void insertBehaviorAC(AccessControlVO accessControlVO) {
		// TODO Auto-generated method stub
		this.insert("Encryption.insertBehaviorAC", accessControlVO);
	}
	

}
