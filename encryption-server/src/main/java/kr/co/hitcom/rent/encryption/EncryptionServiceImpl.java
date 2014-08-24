package kr.co.hitcom.rent.encryption;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;
import encryption.JniKeyEncrypt;
@Service("encryptionService")
public class EncryptionServiceImpl extends AbstractServiceImpl implements EncryptionService{

	/** The qna dao. */
	@Resource(name="encryptionDAO")
	private EncryptionDAO encryptionDAO;
	
	@Override
	public void insertGlobalPolicy(PolicyVO policyVO) {
		// TODO Auto-generated method stub
		encryptionDAO.insertGlobalPolicy(policyVO);
	}

	@Override
	public void insertColumnPolicy(PolicyVO policyVO) {
		// TODO Auto-generated method stub
		encryptionDAO.insertColumnPolicy(policyVO);
	}

	@Override
	public void insertKey(KeyVO keyVO) {
		// TODO Auto-generated method stub
//		JniKeyMake jniKeyMake = new JniKeyMake();
//		String encrypt_key = jniKeyMake.generateKeyEncryptKey();
//		String eck = jniKeyMake.generateEncryptKey(encrypt_key);
//		keyVO.setEncrypt_key(eck);
//		encryptionDAO.insertKey(keyVO);
		
		JniKeyEncrypt jniKeyEncrypt = new JniKeyEncrypt();
		String encrypt_key = jniKeyEncrypt.generateKeyEncryptKey();
		String eck = jniKeyEncrypt.generateEncryptKey(encrypt_key);
		keyVO.setEncrypt_key(eck);
		encryptionDAO.insertKey(keyVO);
	}
	
	@Override
	public void insertKEK(KeyVO keyVO) {
//		JniKeyMake jniKeyMake = new JniKeyMake();
//		String KEK = jniKeyMake.generateKeyEncryptKey();
//		keyVO.setEncrypt_key(KEK);
//		encryptionDAO.insertKEK(keyVO);
		
		JniKeyEncrypt jniKeyEncrypt = new JniKeyEncrypt();
		String KEK = jniKeyEncrypt.generateKeyEncryptKey();
		keyVO.setEncrypt_key(KEK);
		encryptionDAO.insertKEK(keyVO);
		
	}

	@Override
	public void insertPolicyAC(AccessControlVO accessControlVO) {
		// TODO Auto-generated method stub
		encryptionDAO.insertPolicyAC(accessControlVO);
	}

	@Override
	public void insertBehaviorAC(AccessControlVO accessControlVO) {
		// TODO Auto-generated method stub
		encryptionDAO.insertBehaviorAC(accessControlVO);
	}

	





}
