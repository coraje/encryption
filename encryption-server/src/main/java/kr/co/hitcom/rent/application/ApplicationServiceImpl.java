package kr.co.hitcom.rent.application;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.AbstractServiceImpl;

@Service("applicationService")
public class ApplicationServiceImpl extends AbstractServiceImpl implements ApplicationService{

	/** The qna dao. */
	@Resource(name="applicationDAO")
	private ApplicationDAO applicationDAO;
	
	@Override
	public ArrayList<ApplicationVO> applicationList(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		return applicationDAO.applicationList(applicationVO);
	}

	@Override
	public int applicationListCount() {
		// TODO Auto-generated method stub
		return applicationDAO.applicationListCount();
	}

	@Override
	public ApplicationVO applicationDetail(String id) {
		// TODO Auto-generated method stub
		return applicationDAO.applicationDetail(id);
	}

	@Override
	public Long applicationRegistration(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		Long application_id = applicationDAO.applicationRegistration(applicationVO);
		
		return application_id;
	}

	@Override
	public void insertFriendProfile(ApplicationVO aVO) {
		// TODO Auto-generated method stub
		applicationDAO.insertFriendProfile(aVO);
	}

	@Override
	public ArrayList<ApplicationVO> applicationRegistrationList(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		return applicationDAO.applicationRegistrationList(applicationVO);
	}

	@Override
	public ArrayList<ApplicationVO> friendList(String application_id) {
		// TODO Auto-generated method stub
		return applicationDAO.friendList(application_id);
	}

	@Override
	public void changeStatus(ApplicationVO applicationVO) {
		// TODO Auto-generated method stub
		applicationDAO.changeStatus(applicationVO);
	}

	@Override
	public void cleaning(String x) {
		applicationDAO.cleaning(x);
		
	}

	@Override
	public int applicationRegistrationListCount() {
		// TODO Auto-generated method stub
		return applicationDAO.applicationRegistrationListCount();
	}

	@Override
	public ArrayList<OptionVO> optionList(String id) {
		// TODO Auto-generated method stub
		return applicationDAO.optionList(id);
	}

	@Override
	public void insertUserOption(OptionVO optionVO) {
		// TODO Auto-generated method stub
		applicationDAO.insertUserOption(optionVO);
	}

	@Override
	public ArrayList<OptionVO> userOptionList(Long application_id) {
		// TODO Auto-generated method stub
		return applicationDAO.userOptionList(application_id);
	}

	@Override
	public ApplicationVO paymentInformation(Long application_id) {
		// TODO Auto-generated method stub
		return applicationDAO.paymentInformation(application_id);
	}

	


}