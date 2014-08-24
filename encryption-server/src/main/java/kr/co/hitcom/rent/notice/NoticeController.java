//rent
package kr.co.hitcom.rent.notice;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.hitcom.rent.application.ApplicationVO;
import kr.co.hitcom.rent.member.MemberVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class NoticeController {

	/** The Constant logger. */
	private static final Log logger = LogFactory.getLog(NoticeController.class);

	/** Notice Service. */
	@Resource(name = "noticeService")
	private NoticeService noticeService;

	// 공지사항
	@RequestMapping(value = "/noticeList.do")
	public String noticeList(HttpServletRequest request) throws Exception {

		int page = 1;
		int limit = 10;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		int startrow = (page - 1) * 10;
		int endrow = limit;
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setStartrow(startrow);
		noticeVO.setEndrow(endrow);
		
		int listcount = noticeService.noticeListCount(); // 총 리스트 수를 받아 옴
		ArrayList<NoticeVO> list = noticeService
				.noticeList(noticeVO); // 리스트를 받아 옴

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
		

		return "/notice/noticeList.jsp";
	}

	@RequestMapping(value = "/noticeRegistrationPage.lo ")
	public String noticeRegistrationPage(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

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
		
		return "/notice/noticeRegistrationPage.jsp";
	}

	@RequestMapping(value = "/noticeRegistration.lo", method = RequestMethod.POST)
	public void noticeRegistration(HttpServletRequest request,
			HttpServletResponse response,

			@RequestParam("notice_subject") String subject,
			@RequestParam("notice_content") String content) throws Exception {

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
		
		NoticeVO noticeVO = new NoticeVO();

		noticeVO.setNotice_title(subject);
		noticeVO.setNotice_content(content);

		noticeService.noticeRegistration(noticeVO);
		response.sendRedirect("./noticeList.do");

	}

	@RequestMapping(value = "/noticeModifyPage.lo")
	public String noticeModifyEdit(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("notice_id") String notice_id) throws Exception {

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
		
		NoticeVO noticeVO = new NoticeVO();

		int number = Integer.parseInt(notice_id);
		noticeVO = noticeService.getNotice(number);

		request.setAttribute("noticeVO", noticeVO);

		return "/notice/noticeModifyPage.jsp";
	}

	@RequestMapping(value = "/noticeModify.lo")
	public String noticeModify(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("notice_id") String number,
			@RequestParam("notice_subject") String subject,
			@RequestParam("notice_content") String content) throws Exception {

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
		
		NoticeVO noticeVO = new NoticeVO();

		noticeVO.setNotice_id(Long.valueOf(number));
		noticeVO.setNotice_title(subject);
		noticeVO.setNotice_content(content);

		noticeService.noticeModify(noticeVO);

		return noticeList(request);
	}

	@RequestMapping(value = "/noticeDelete.lo")
	public String noticeDelete(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("notice_id") String notice_id)
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
		
		int number = Integer.parseInt(notice_id);
		noticeService.noticeDelete(number);

		return noticeList(request);
	}

	@RequestMapping(value = "/noticeDetail.do")
	public String noticeDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam("notice_id") String notice_id)
			throws Exception {


		NoticeVO noticeVO = new NoticeVO();

		int number = Integer.valueOf(notice_id);

		noticeVO = noticeService.getNotice(number);

		request.setAttribute("noticeVO", noticeVO);
		
		return "/notice/noticeDetail.jsp";

	}

}
