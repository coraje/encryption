package kr.co.hitcom.rent.application;

import java.util.ArrayList;

import kr.co.hitcom.common.AbstractDAO;
import kr.co.hitcom.rent.notice.NoticeVO;

import org.springframework.stereotype.Repository;

@Repository("applicationDAO")
public class ApplicationDAOImpl extends AbstractDAO implements ApplicationDAO{

	@SuppressWarnings("unchecked")
	public ArrayList<ApplicationVO> applicationList(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		
		return (ArrayList<ApplicationVO>) this.list("Application.selectApplicationList", applicationVO);
	}

	@Override
	public int applicationListCount() {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().queryForObject("Application.selectApplicationListCount");
	}

	@Override
	public ApplicationVO applicationDetail(String id) {
		// TODO Auto-generated method stub
		Long product_id=Long.valueOf(id);
		return (ApplicationVO) getSqlMapClientTemplate().queryForObject("Application.selectApplication", product_id);
	}

	@Override
	public Long applicationRegistration(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub

		Object obj = this.insert("Application.insertApplication", applicationVO);
		logger.debug(obj);
		
		//마지막 application_id 
		Long application_id = (Long) getSqlMapClientTemplate().queryForObject("Application.selectLastApplicationId");
		
		return application_id;

	}

	@Override
	public void insertFriendProfile(ApplicationVO aVO) {
		Object obj = this.insert("Application.insertFriendProfile", aVO);
		logger.debug(obj);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ApplicationVO> applicationRegistrationList(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		return (ArrayList<ApplicationVO>) this.list("Application.selectApplicationRegistrationList", applicationVO);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ApplicationVO> friendList(String application_id) {
		
		Long id = Long.valueOf(application_id);
		
		return (ArrayList<ApplicationVO>) this.list("Application.selectFriendList", id);
	}

	@Override
	public void changeStatus(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		this.update("Application.updatePaymentStatus", applicationVO);
	}

	@Override
	public void cleaning(String x) {
		// TODO Auto-generated method stub
		this.update("Application.cleaning", x);
	}

	@Override
	public int applicationRegistrationListCount() {
		// TODO Auto-generated method stub
		return (Integer)getSqlMapClientTemplate().queryForObject("Application.selectApplicationRegistrationListCount");
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OptionVO> optionList(String id) {
		// TODO Auto-generated method stub
		Long oid = Long.valueOf(id);
		
		return (ArrayList<OptionVO>) this.list("Application.selectOptionList", oid);
	}

	@Override
	public void insertUserOption(OptionVO optionVO) {
		// TODO Auto-generated method stub
		Object obj = this.insert("Application.insertUserOption", optionVO);
		logger.debug(obj);
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OptionVO> userOptionList(Long application_id) {
		// TODO Auto-generated method stub
		return (ArrayList<OptionVO>) this.list("Application.userOptionList", application_id);
	}

	@Override
	public ApplicationVO paymentInformation(Long application_id) {
		// TODO Auto-generated method stub
		return (ApplicationVO) this.getSqlMapClientTemplate().queryForObject("Application.paymentInformation", application_id);
	}

	

}