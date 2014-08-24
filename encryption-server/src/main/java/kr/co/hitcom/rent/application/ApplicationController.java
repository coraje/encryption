//rent
package kr.co.hitcom.rent.application;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hitcom.rent.member.MemberVO;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApplicationController {

	@Resource(name = "applicationService")
	private ApplicationService applicationService;

	// 신청하기 리스트
	@RequestMapping(value = "/applicationList.do")
	public String applicationList(Model model) {

		ApplicationVO applicationVO = new ApplicationVO();

		applicationVO.setStartrow(0);

		applicationVO.setEndrow(5);

		ArrayList<ApplicationVO> list = applicationService
				.applicationList(applicationVO);

		model.addAttribute("applicationList", list);

		return "/application/applicationList.jsp";
	}

	// 신청하기 상세
	@RequestMapping(value = "/applicationDetail.do")
	public String applicationDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("product_id") String id, Model model) {

		ApplicationVO applicationVO = applicationService.applicationDetail(id);
		ArrayList<OptionVO> optionList = applicationService.optionList(id);

		model.addAttribute("applicationVO", applicationVO);
		model.addAttribute("optionList", optionList);

		return "/application/applicationDetail.jsp";
	}

	// 신청하기 페이지
	@RequestMapping(value = "/applicationPage.lo")
	public String applicationPage(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("product_id") String id,
			@RequestParam("personnel") String personnel,
			@RequestParam(value="quantity", required=false) String quantity,
			@RequestParam("total_price") String total_price, Model model) {

		ApplicationVO applicationVO = applicationService.applicationDetail(id);
		ArrayList<OptionVO> optionList = applicationService.optionList(id);
		
		applicationVO.setPersonnel(Integer.valueOf(personnel));		
		
		int cnt = 0;
		if(quantity==""||quantity==null){
			
		}else{
			String option_quantity[] = quantity.split(",");
			
			for (int i = 0; i < optionList.size() ; i++) {
				OptionVO OptionVO = optionList.get(i);
				OptionVO.setQuantity(Integer.valueOf(option_quantity[i]));
				System.out.println(option_quantity[i]);
			}
			
			String k = "0"; 
			char c = k.charAt(0); //k의 첫번째 문자를 끌어냄
			int fromIndex = 0;
			while(true){
			int index = quantity.indexOf(c, fromIndex);
			if(index == -1)
			break;
			else{
			System.out.println(index);
			cnt++;
			fromIndex = index + 1;
			}
			}
		}
		int option_price = Integer.valueOf(total_price.replaceAll(",", "")) - applicationVO.getProduct_price() * Integer.valueOf(personnel) ;
		
		model.addAttribute("applicationVO", applicationVO);
		model.addAttribute("personnel", personnel);
		model.addAttribute("optionList", optionList);
		if(quantity==""||quantity==null){
			model.addAttribute("quantity", 0);
			model.addAttribute("quantity_length", 0);
		}else{
		model.addAttribute("quantity", quantity);
		model.addAttribute("quantity_length", quantity.split(",").length - cnt);
		}
		model.addAttribute("option_price", option_price);

		return "/application/applicationPage.jsp";
	}

	// 신청등록
	@RequestMapping(value = "/applicationRegistration.lo", method = RequestMethod.POST)
	public void applicationRegistration(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute ApplicationVO applicationVO,
			@RequestParam("quantity") String quantity) throws IOException {
		
		System.out.println("applicationVO.toString()==="
				+ applicationVO.toString());

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session
				.getAttribute("SESSION_MEMBER_INFO");

//		Date dt = new Date();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//		
//		String a = sdf.format(dt).toString();
//		
//		int b = Integer.valueOf(a);
//		int c = Integer.valueOf(applicationVO.getBirthday().substring(0, 4));
//		
//		applicationVO.setAge(b-c+1);
		
		String friend_name[] = applicationVO.getFriend_name().split(",");
		String friend_msisdn[] = applicationVO.getFriend_msisdn().split(",");
		String friend_age[] = applicationVO.getFriend_age().split(",");
		String friend_gender[] = applicationVO.getFriend_gender().split(",");
		
		for (String str : friend_name) {
			System.out.println("friend_name:" + str);
		}
		
		applicationVO.setMember_no(memberVO.getMember_no());

	
		Long application_id = applicationService
				.applicationRegistration(applicationVO);

		ApplicationVO aVO = new ApplicationVO();
		aVO.setApplication_id(application_id);
		
		System.out.println("인원수=="+applicationVO.getPersonnel());
		
		for (int i = 0; i < applicationVO.getPersonnel()-1 ; i++) {
			aVO.setFriend_name(friend_name[i]);
			aVO.setFriend_age(friend_age[i]);
			aVO.setFriend_msisdn(friend_msisdn[i]);
			aVO.setFriend_gender(friend_gender[i]);
			applicationService.insertFriendProfile(aVO);
		}
		
		//옵션등록
		ArrayList<OptionVO> optionList = applicationService.optionList(String.valueOf(applicationVO.getProduct_id()));

		String option_quantity[] = quantity.split(",");
		
		for (int i = 0; i < optionList.size() ; i++) {
			OptionVO OptionVO = optionList.get(i);
			OptionVO.setApplication_id(application_id);
			OptionVO.setQuantity(Integer.valueOf(option_quantity[i]));
			applicationService.insertUserOption(OptionVO);
		}
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('등록되었습니다');");
		out.println("location.href='./myPage.lo';");
		out.println("</script>");
		out.close();

	}

	// 신청자목록
	@RequestMapping(value = "/applicationRegistrationList.lo")
	public String applicationRegistrationList(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
		
		if (!memberVO.getMember_id().equals("admin")) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('관리자가 아닙니다.');");
			out.println("location.href='./loginPage.do';");
			out.println("</script>");
			out.close();
		}
		
		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;
		
		ApplicationVO applicationVO = new ApplicationVO();
		applicationVO.setStartrow(startrow);
		applicationVO.setEndrow(endrow);
		
		int listcount = applicationService.applicationRegistrationListCount(); // 총 리스트 수를 받아 옴
		ArrayList<ApplicationVO> list = applicationService
				.applicationRegistrationList(applicationVO); // 리스트를 받아 옴
		
		// age 에 값을 입력
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		
		
		
		for (int i = 0; i < list.size(); i++) {
			
			int option_price = 0;
			
			applicationVO =  list.get(i);
			
			String a = sdf.format(dt).toString();
			
			int b = Integer.valueOf(a);
			int c = Integer.valueOf(applicationVO.getBirthday().substring(0, 4));
			
			applicationVO.setAge(b-c+1);
			
			ArrayList<OptionVO> optionList = applicationService.userOptionList(applicationVO.getApplication_id());
			for (int j = 0; j < optionList.size(); j++) {
				OptionVO optionVO = optionList.get(j);
				option_price += optionVO.getOption_price() *  optionVO.getQuantity();
			}
			
			applicationVO.setOption_price(option_price);
		}
		
		// 총 페이지 수
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를
		// 더해서
		// 올림
		// 처리
		// 현재 화면에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 화면에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		request.setAttribute("page", page); // 현재 페이지 번호
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 화면에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 화면에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 개수
		request.setAttribute("list", list);
		
		return "/application/applicationRegistrationList.jsp";
	}
	
	// 결제내역 페이지
	@RequestMapping(value = "/paymentDetail.lo")
	public String paymentDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("application_id") String application_id) throws Exception{

//		HttpSession session = request.getSession();
//		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
		
//		if (!memberVO.getMember_id().equals("admin")) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('관리자가 아닙니다.');");
//			out.println("location.href='./loginPage.do';");
//			out.println("</script>");
//			out.close();
//		}
		
		ApplicationVO applicationVO = applicationService.paymentInformation(Long.valueOf(application_id));
		
		ArrayList<OptionVO> list = applicationService.userOptionList(Long.valueOf(application_id));

		request.setAttribute("list", list);
		
		request.setAttribute("applicationVO", applicationVO);
		
		return "/application/paymentDetail.jsp";
	}

	// 동반자목록 페이지
		@RequestMapping(value = "/applicationFriend.lo")
		public String applicationFriend(HttpServletRequest request,
				HttpServletResponse response, @RequestParam("application_id") String application_id) throws Exception{

			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
			
			if (!memberVO.getMember_id().equals("admin")) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('관리자가 아닙니다.');");
				out.println("location.href='./loginPage.do';");
				out.println("</script>");
				out.close();
			}
			
			ArrayList<ApplicationVO> list = applicationService.friendList(application_id);

			request.setAttribute("list", list);
			
			return "/application/applicationFriend.jsp";
		}
		
	// 결제상태변경 
		@RequestMapping(value = "/changeStatus.lo")
		public String changeStatus(HttpServletRequest request,
				HttpServletResponse response, @RequestParam("application_id") String application_id,
				@RequestParam("yn") String yn,
				 @RequestParam("page") String page)
				throws Exception {

			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
			
			if (!memberVO.getMember_id().equals("admin")) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('관리자가 아닙니다.');");
				out.println("location.href='./loginPage.do';");
				out.println("</script>");
				out.close();
			}
			
			// 전환후 페이지찾아가기
			request.setAttribute("page", page);

			ApplicationVO applicationVO = new ApplicationVO();
			
			applicationVO.setApplication_id(Long.valueOf(application_id));
			applicationVO.setPayment_status(yn);
			
			applicationService.changeStatus(applicationVO);

			return applicationRegistrationList(request,response);
		}
		
		// 3일지난 신청자 정리 PAYMENT_STATUS 의 값을 x로 변경  	주의: 컬럼값이 n(미결제) 인경우만 변경
		@RequestMapping(value = "/cleaning.lo")
		public String cleaning(HttpServletRequest request,
				HttpServletResponse response,
				 @RequestParam("page") String page)
				throws Exception {

			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
			
			if (!memberVO.getMember_id().equals("admin")) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('관리자가 아닙니다.');");
				out.println("location.href='./loginPage.do';");
				out.println("</script>");
				out.close();
			}
			
			String x="x";
			
			// 전환후 페이지찾아가기
			request.setAttribute("page", page);
			System.out.println("실행");
			applicationService.cleaning(x);
			System.out.println("실행완료");
			return applicationRegistrationList(request,response);
		}
}