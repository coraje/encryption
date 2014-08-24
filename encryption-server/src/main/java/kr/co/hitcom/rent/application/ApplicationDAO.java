package kr.co.hitcom.rent.application;

import java.util.ArrayList;

public interface ApplicationDAO {

	ArrayList<ApplicationVO> applicationList(ApplicationVO applicationVO);

	int applicationListCount();

	ApplicationVO applicationDetail(String id);

	Long applicationRegistration(ApplicationVO applicationVO);

	void insertFriendProfile(ApplicationVO aVO);

	ArrayList<ApplicationVO> applicationRegistrationList(ApplicationVO applicationVO);

	ArrayList<ApplicationVO> friendList(String application_id);

	void changeStatus(ApplicationVO applicationVO);

	void cleaning(String x);

	int applicationRegistrationListCount();

	ArrayList<OptionVO> optionList(String id);

	void insertUserOption(OptionVO optionVO);

	ArrayList<OptionVO> userOptionList(Long application_id);

	ApplicationVO paymentInformation(Long application_id);


}