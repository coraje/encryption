//rent
package kr.co.hitcom.rent.inquiry;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hitcom.rent.member.MemberVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class InquiryController {

	/** The Constant logger. */
	private static final Log logger = LogFactory
			.getLog(InquiryController.class);

	/** Inquiry Service. */
	@Resource(name = "inquiryService")
	private InquiryService inquiryService;

	// Q&A 게시판
	@RequestMapping(value = "/inquiryList.do")
	public String inquiryList(HttpServletRequest request) throws Exception {

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;
		
		InquiryVO inquiryVO = new InquiryVO();
		inquiryVO.setStartrow(startrow);
		inquiryVO.setEndrow(endrow);
		
		int listcount = inquiryService.inquiryListCount(); // 총 리스트 수를 받아 옴
		ArrayList<InquiryVO> list = inquiryService
				.inquiryList(inquiryVO); // 리스트를 받아 옴

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

		return "/inquiry/inquiryList.jsp";

	}

	@RequestMapping(value = "/inquiryRegistrationPage.lo ")
	public String inquiryRegistrationPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {


		return "/inquiry/inquiryRegistrationPage.jsp";
	}

	@RequestMapping(value = "/inquiryRegistration.lo", method = RequestMethod.POST)
	public void inquiryRegistration(HttpServletRequest request,
			HttpServletResponse response,

			@RequestParam("inquiry_subject") String subject,
			@RequestParam("inquiry_content") String content) throws Exception {

		
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session
				.getAttribute("SESSION_MEMBER_INFO");
		

		InquiryVO inquiryVO = new InquiryVO();
		inquiryVO.setMember_no(memberVO.getMember_no());
		inquiryVO.setInquiry_subject(subject);
		inquiryVO.setInquiry_content(content);

		inquiryService.inquiryRegistration(inquiryVO);
		response.sendRedirect("./inquiryList.do");

	}

	@RequestMapping(value = "/inquiryModifyPage.lo")
	public String inquiryModifyEdit(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("inquiry_id") String inquiry_id,
			@RequestParam("member_id") String member_id) throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
		
		if (!memberVO.getMember_id().equals("admin")) {
			if (!memberVO.getMember_id().equals(member_id)) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('권한이 없습니다.');");
				out.println("location.href='./inquiryList.do';");
				out.println("</script>");
				out.close();
				return null;
			}
		}

		InquiryVO inquiryVO = new InquiryVO();

		int number = Integer.parseInt(inquiry_id);
		inquiryVO = inquiryService.getInquiry(number);

		request.setAttribute("inquiryVO", inquiryVO);

		return "/inquiry/inquiryModifyPage.jsp";
	}

	@RequestMapping(value = "/inquiryModify.lo")
	public String inquiryModify(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("inquiry_id") String number,
			@RequestParam("inquiry_subject") String subject,
			@RequestParam("inquiry_content") String content) throws Exception {
		
		InquiryVO inquiryVO = new InquiryVO();

		inquiryVO.setInquiry_id(Long.valueOf(number));
		inquiryVO.setInquiry_subject(subject);
		inquiryVO.setInquiry_content(content);

		inquiryService.inquiryModify(inquiryVO);

		return inquiryList(request);
	}

	@RequestMapping(value = "/inquiryDelete.lo")
	public String inquiryDelete(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("inquiry_id") String inquiry_id,@RequestParam("member_id") String member_id) throws Exception {

		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("SESSION_MEMBER_INFO");
		
		
		if (!memberVO.getMember_id().equals("admin")) {
			if (!memberVO.getMember_id().equals(member_id)) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('권한이 없습니다.');");
				out.println("location.href='./inquiryList.do';");
				out.println("</script>");
				out.close();
				return null;
			}
		}
		
		int number = Integer.parseInt(inquiry_id);
		inquiryService.inquiryDelete(number);

		return inquiryList(request);
	}

	@RequestMapping(value = "/inquiryDetail.do")
	public String inquiryDetail(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("inquiry_id") String inquiry_id, Model model) throws Exception {


		InquiryVO inquiryVO = new InquiryVO();

		int number = Integer.valueOf(inquiry_id);

		inquiryVO = inquiryService.getInquiry(number);
		
		System.out.println("member_id="+inquiryVO.getMember_id());
		
		request.setAttribute("inquiryVO", inquiryVO);
		model.addAttribute("memberid", inquiryVO.getMember_id());

		return "/inquiry/inquiryDetail.jsp";

	}

	// 답글 등록
	@RequestMapping(value = "/answerRegistrationPage.lo")
	public String answerRegistrationPage(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("inquiry_id") String inquiry_id)
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
		
		InquiryVO inquiryVO = new InquiryVO();

		int number = Integer.valueOf(inquiry_id);

		inquiryVO = inquiryService.getInquiry(number);

		request.setAttribute("inquiryVO", inquiryVO);

		return "/inquiry/answerRegistrationPage.jsp";
	}

	@RequestMapping(value = "/answerRegistration.lo", method = RequestMethod.POST)
	public void answerRegistration(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("inquiry_subject") String subject,
			@RequestParam("inquiry_content") String content,
			@RequestParam("re_ref") String ref,
			@RequestParam("re_lev") String lev,
			@RequestParam("re_seq") String seq) throws Exception {
		
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

		InquiryVO inquiryVO = new InquiryVO();
		
		inquiryVO.setMember_no(memberVO.getMember_no());
	
		inquiryVO.setInquiry_subject(subject);
		inquiryVO.setInquiry_content(content);
		inquiryVO.setRe_ref(Long.valueOf(ref));
		inquiryVO.setRe_lev(Integer.valueOf(lev)+1);
		inquiryVO.setRe_seq(Integer.valueOf(seq)+1);

		inquiryService.answerRegistration(inquiryVO);

		response.sendRedirect("./inquiryList.do");

	}

}
