//rent
package kr.co.hitcom.rent.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hitcom.rent.application.ApplicationService;
import kr.co.hitcom.rent.application.OptionVO;
import kr.co.hitcom.rent.mail.MyAuthenticator;
import kr.co.hitcom.util.PostOpenApiClient;
import kr.co.hitcom.util.postcd.Item;
import kr.co.hitcom.util.postcd.Post;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

	/** The Constant logger. */
	private static final Log logger = LogFactory.getLog(MemberController.class);

	/** Member Service. */
	@Resource(name = "memberService")
	private MemberService memberService;

	@Resource(name = "applicationService")
	private ApplicationService applicationService;
	
	@Resource(name = "postService")
	private PostOpenApiClient postOpenApiClient;

	/**
	 * 로그인 페이지로 이동
	 * 
	 * @return
	 */
//	@RequestMapping(value = "/loginPage.do")
//	public String loginPage() {
//		return "/member/loginPage.jsp";
//	}

	/**
	 * 로그인
	 * 
	 * @param request
	 * @param response
	 * @param id
	 * @param pw
	 * @return
	 * @throws Exception
	 */
//	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
//	public String login(HttpServletRequest request, HttpServletResponse response, @RequestParam("member_id") String id, @RequestParam("member_pw") String pw)
//			throws Exception {
//
//		System.out.println(id);
//		System.out.println(pw);
//
//		// 세션에 이미 값이 있다면 지운다.
//		request.getSession().removeAttribute("SESSION_MEMBER_INFO");
//
//		MemberVO memberVO = new MemberVO();
//		memberVO.setMember_id(id);
//		memberVO.setPasswd(pw);
//
//		// memberVO.setName("히트콤");
//
//		// TODO 넘어온 파라메터로 회원 정보 확인 조회(형진)
//
//		MemberVO resultVO = memberService.login(memberVO);
//
//		if (resultVO == null) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('아이디가 존재하지 않습니다.');");
//			out.println("location.href='./loginPage.do';");
//			out.println("</script>");
//			out.close();
//			return null;
//
//		}
//		if (!resultVO.getPasswd().equals(memberVO.getPasswd())) {
//			response.setContentType("text/html;charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.println("<script>");
//			out.println("alert('비밀번호가 일치하지 않습니다.');");
//			out.println("location.href='./loginPage.do';");
//			out.println("</script>");
//			out.close();
//			return null;
//		}
//		/*
//		 * MemberVO memberVO = memberService.selectMemberInfo(id, pw);
//		 * if(memberVO == null || memberVO.getId() == null) { throw new
//		 * Exception(); }
//		 */
//		request.getSession().setAttribute("SESSION_MEMBER_INFO", resultVO);
//		// request.getSession().setAttribute("SESSION_MEMBER_INFO",
//		// resultVO.getMember_id());
//		response.sendRedirect("./main.do");
//		return null;
//	}

	/**
	 * 회원가입 페이지로
	 * 
	 * @return
	 */
	// 이메일 가입용
	@RequestMapping(value = "/joinPage.do")
	public String joinPage(@RequestParam(value = "key") String key, HttpServletResponse response, Model model) throws Exception {
		
		//url 체크 
		MemberVO memberVO = memberService.keyCheck(key);
		int count = memberService.getEmailCount(memberVO.getEmail());
		if(count!=0){
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('사용할수없는 URL입니다.');");
			out.println("location.href='./main.do';");
			out.println("</script>");
			out.close();
			return null;
		}
		if (memberVO!=null) {
			model.addAttribute("memberVO", memberVO);
			return "/member/joinPage.jsp";
		} else {
			response.sendRedirect("./main.do");
			return null;
		}
	}
//	@RequestMapping(value = "/joinPage.do")
//	public String joinPage() throws Exception {
//
//
//		return "/member/joinPage.jsp";
//	}

	/**
	 * 아이디 중복체크 Ajax
	 * 
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/idCheck.aj")
	public String idCheck(HttpServletResponse response, @RequestParam(value = "member_id") String id) throws Exception {

		boolean result = false;
		if (id.equals("")) {

			return result ? "true" : "false";
		}

		// TODO id 중복 확인 구현(형진)
		result = memberService.idCheck(id);

		return result ? "true" : "false";
	}

	@RequestMapping(value = "/getMember.aj")
	public ResponseEntity<String> getMember(@RequestParam(value = "member_no") String no) {

		MemberVO memberVO = memberService.getMember(no);

		String result = "{name:'" + memberVO.getName() + "', msisdn:'" + memberVO.getMsisdn() + "', birthday:'" + memberVO.getBirthday() + "', gender:'"
				+ memberVO.getGender() + "'}";

		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
		return new ResponseEntity<String>(result, responseHeaders, HttpStatus.CREATED);
	}

	/**
	 * 회원가입 Ajax
	 * 
	 * @param request
	 * @param response
	 * @param memberVO
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/join.aj", method = RequestMethod.POST)
	public String join(HttpServletRequest request, HttpServletResponse response, @ModelAttribute MemberVO memberVO) throws Exception {

		if (logger.isDebugEnabled()) {
			logger.debug(memberVO);
		}

		boolean result = false;

		for (int i = 0; i < memberVO.getMember_id().length(); i++) {
			if ((( memberVO.getMember_id().charAt(i) > 0x3130 &&  memberVO.getMember_id().charAt(i) < 0x318F) || 
					( memberVO.getMember_id().charAt(i) >= 0xAC00 &&  memberVO.getMember_id().charAt(i) <= 0xD7A3))) {
				
				return result ? "success" : "fail"; // 한글 포함이면
			
			} else {
				// 한글 미포함이면
			}
		}

		if (memberService.idCheck(memberVO.getMember_id())) {

			System.out.println("===>" + memberVO);

//			Date dt = new Date();
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
//			
//			String a = sdf.format(dt).toString();
//			
//			int b = Integer.valueOf(a);
//			int c = Integer.valueOf(memberVO.getBirthday().substring(0, 4));
//			
//			memberVO.setAge(b-c+1);
			
			memberService.join(memberVO);

			result = true;

			return result ? "success" : "fail";

		} else {
			return "duplicate";

		}

	}

	@RequestMapping(value = "/addressPopup.aj")
	public String addressPopup() {
		return "/member/addressPopup.jsp";
	}

	/**
	 * 주소록 조회.
	 * 
	 * @param address
	 * @return
	 */
	@RequestMapping(value = "/postcd.aj", method = RequestMethod.POST)
	public ResponseEntity<String> searchAddress(@RequestParam(value = "search_address", required = true) String address) {
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=UTF-8");

		String responseStr = "";
		Post post = postOpenApiClient.query(address);

		int cnt = post.getItemWrap().getItemList().size();

		for (int i = 0; i < cnt; i++) {
			Item item = post.getItemWrap().getItemList().get(i);
			responseStr += "{postcd : \"" + item.getPostcd() + "\", address:\"" + item.getAddress() + "\"}";
			if (i != (cnt - 1)) {
				responseStr += ", ";
			}
		}

		responseStr = "{postcdList : [" + responseStr + "]}";

		return new ResponseEntity<String>(responseStr, responseHeaders, HttpStatus.CREATED);
	}

	@RequestMapping(value = "/logout.lo")
	public void logOut(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.getSession().invalidate();

		response.sendRedirect("./loginPage.do");
	}

	// 마이페이지
	@RequestMapping(value = "/myPage.lo")
	public String myPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");

		if (memberVO.getMember_id() == null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인이 필요한 서비스입니다..');");
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

		memberVO.setStartrow(startrow);
		memberVO.setEndrow(endrow);

		int listcount = memberService.applicationListCount(memberVO.getMember_no()); // 총
																						// 리스트
																						// 수를
																						// 받아
																						// 옴

		ArrayList<MemberVO> list = memberService.myPage(memberVO); // 리스트를 받아 옴

		int reserve_fund = memberService.getReserveFund(memberVO.getMember_no());

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
		
		for (int i = 0; i < list.size(); i++) {
			
			int option_price = 0;
			
			memberVO =  list.get(i);
			
			ArrayList<OptionVO> optionList = applicationService.userOptionList(memberVO.getApplication_id());
			for (int j = 0; j < optionList.size(); j++) {
				OptionVO optionVO = optionList.get(j);
				option_price += optionVO.getOption_price() *  optionVO.getQuantity();
			}
			
			memberVO.setOption_price(option_price);
		}

		request.setAttribute("page", page); // 현재 페이지 번호
		request.setAttribute("maxpage", maxpage); // 최대 페이지 수
		request.setAttribute("startpage", startpage); // 현재 화면에 표시할 첫 페이지 수
		request.setAttribute("endpage", endpage); // 현재 화면에 표시할 끝 페이지 수
		request.setAttribute("listcount", listcount); // 글 개수
		request.setAttribute("list", list);
		request.setAttribute("reserve_fund", reserve_fund);

		return "/member/myPage.jsp";
	}

	// 회원정보수정
	@RequestMapping(value = "/informationModifyPage.lo")
	public String informationModify(HttpServletRequest request, @RequestParam("member_no") String member_no, Model model) {

		System.out.println("member_no~~~~~~~~~~~~~~~~~~~~~~~~~~" + member_no);

		MemberVO memberVO = memberService.getMember(member_no);

		model.addAttribute("memberVO", memberVO);

		return "/member/informationModifyPage.jsp";
	}

	@ResponseBody
	@RequestMapping(value = "/informationModify.lo", method = RequestMethod.POST)
	public String informationModify(HttpServletRequest request, HttpServletResponse response, @ModelAttribute MemberVO memberVO) throws Exception {

		if (logger.isDebugEnabled()) {
			logger.debug(memberVO);
		}
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + memberVO.toString());
		boolean result = false;

		System.out.println("===>" + memberVO);

		result = memberService.informationModify(memberVO);

		result = true;

		return result ? "true" : "false";
	}

	@ResponseBody
	@RequestMapping(value = "/passCheck.aj")
	public String passCheck(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "passwd") String passwd, Model model)
			throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");

		boolean result = false;
		if (passwd.equals("")) {

			return result ? "true" : "false";
		}

		MemberVO resultVO = memberService.login(memberVO);

		if (resultVO.getPasswd().equals(passwd)) {
			result = true;
			// return
			// "./informationModifyPage.lo?member_no="+memberVO.getMember_no();
		}
		return result ? "true" : "false";
	}

	@RequestMapping(value = "/mailPopup.aj")
	public String mailPopup() {
		return "/member/mailPopup.jsp";
	}

	// 회원가입전 메일입력
	@ResponseBody
	@RequestMapping(value = "/mailTransfer.aj")
	public String inputMail(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "email") String email) throws Exception {

		// 메일체크

		int count = memberService.getEmailCount(email);

		if (count == 0) {

			// 키생성 / 저장
			String randomKey = generateData(20);
			System.out.println("randomkey=" + randomKey);

			memberService.insertKey(randomKey);

			// 메일방송
			String host = "smtp.gmail.com";// smtp 서버
			String subject = "통째로빌렸다 회원가입 URL";
			String from = "info@hitcom.co.kr"; // 보내는 메일
			String fromName = "히트콤";
			String to = email;
			String content = "http://www.tong12th.com/joinPage.do?key=" + randomKey;
			try {
				// 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
				Properties props = new Properties();

				// G-Mail SMTP 사용시
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.auth", "true");

				MyAuthenticator auth = new MyAuthenticator("info@hitcom.co.kr", "infoofhitcom");

				Session mailSession = Session.getDefaultInstance(props, auth);

				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));// 보내는
																										// 사람
																										// 설정
				InternetAddress[] address = { new InternetAddress(to) };

				msg.setRecipients(Message.RecipientType.TO, address);// 받는 사람설정

				msg.setSubject(subject);// 제목 설정
				msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
				// msg.setContent(content,"text/html;charset=utf-8"); // 내용 설정
				// (HTML 형식)
				msg.setText(content);

				Transport.send(msg); // 메일 보내기

				System.out.println("메일 발송을 완료하였습니다.");

				// 발송성공 => db에 메일저장

				MemberVO memberVO = new MemberVO();
				memberVO.setEmail(email);
				memberVO.setMail_key(randomKey);

				memberService.insertMail(memberVO);
				return "success";
				// 발송실패
			} catch (MessagingException ex) {
				System.out.println("mail send error : " + ex.getMessage());
				return "mail send error : " + ex.getMessage();
			} catch (Exception e) {
				System.out.println("error : " + e.getMessage());
				return "error : " + e.getMessage();
			}

		}

		return "duplicate";
	}

	// 랜덤키생성
	final String dummyString = "1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijlmnopqrstuvwxyz";
	final Random random = new Random();

	public String generateData(int loopCount) {
		// char 48=0 65=A 90=Z 97=a 122=z
		StringBuilder tempBuilder = new StringBuilder(100);
		int randomInt;
		char tempChar;
		for (int loop = 0; loop < loopCount; loop++) {
			randomInt = random.nextInt(61);
			tempChar = dummyString.charAt(randomInt);
			tempBuilder.append(tempChar);
		}
		// System.out.println(tempBuffer);
		return tempBuilder.toString();
	}

	// password 찾기
	@RequestMapping(value = "/passPopup.aj")
	public String passPopup() {
		return "/member/passPopup.jsp";
	}

	// password 찾기

	@ResponseBody
	@RequestMapping(value = "/passSearch.aj")
	public String passSearch(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "member_id") String member_id) throws Exception {

		
		int count = memberService.getIdCount(member_id);

		if (count !=0) {

			MemberVO memberVO = memberService.getMemberPass(member_id);

			// 메일방송
			String host = "smtp.gmail.com";// smtp 서버
			String subject = "통째로빌렸다 비밀번호";
			String from = "info@hitcom.co.kr"; // 보내는 메일
			String fromName = "히트콤";
			String to = memberVO.getEmail();
			String content = "회원님의 비밀번호는 [" + memberVO.getPasswd() + "] 입니다.";
			try {
				// 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
				Properties props = new Properties();

				// G-Mail SMTP 사용시
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.transport.protocol", "smtp");
				props.put("mail.smtp.host", host);
				props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
				props.put("mail.smtp.port", "465");
				props.put("mail.smtp.auth", "true");

				MyAuthenticator auth = new MyAuthenticator("info@hitcom.co.kr", "infoofhitcom");

				Session mailSession = Session.getDefaultInstance(props, auth);

				Message msg = new MimeMessage(mailSession);
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));// 보내는
																										// 사람
																										// 설정
				InternetAddress[] address = { new InternetAddress(to) };

				msg.setRecipients(Message.RecipientType.TO, address);// 받는 사람설정

				msg.setSubject(subject);// 제목 설정
				msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
				// msg.setContent(content,"text/html;charset=utf-8"); // 내용 설정
				// (HTML 형식)
				msg.setText(content);

				Transport.send(msg); // 메일 보내기

				System.out.println("메일 발송을 완료하였습니다.");

				return "success";

				// 발송실패
			} catch (MessagingException ex) {
				System.out.println("mail send error : " + ex.getMessage());
				return "mail send error : " + ex.getMessage();
			} catch (Exception e) {
				System.out.println("error : " + e.getMessage());
				return "error : " + e.getMessage();
			}

		}

		return "duplicate";
	}
	
	// 탈퇴
	@RequestMapping(value = "/secession.lo")
	public String secession(HttpServletRequest request, HttpServletResponse response, @RequestParam("member_no") String member_no) throws Exception {
		
		memberService.secession(member_no);
		
		request.getSession().invalidate();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.');");
		out.println("location.href='./main.do';");
		out.println("</script>");
		out.close();
		return null;
	}
}
