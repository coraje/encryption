//rent
package kr.co.hitcom.rent.main;

import java.awt.Color;
import java.awt.Font;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import kr.co.hitcom.rent.inquiry.InquiryService;
import kr.co.hitcom.rent.inquiry.InquiryVO;
import kr.co.hitcom.rent.notice.NoticeService;
import kr.co.hitcom.rent.notice.NoticeVO;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	/** The Constant logger. */
	private static final Log logger = LogFactory.getLog(MainController.class);

	@Resource(name="noticeService")
	private NoticeService noticeService;
	
	@Resource(name="inquiryService")
	private InquiryService inquiryService;
	
	@Value("#{config['image.basePath']}")
	private String IMAGE_FILE_PATH;

	@Value("#{config['main.jsp.path']}")
	private String JSP_FILE_PATH;

	// 메인페이지
	@RequestMapping(value = "/index.htm")
	public String init() throws Exception {
		return "/index.jsp"; // login.jsp 에서 main.do 로 redirection 시킴.
	}

	@RequestMapping(value = "/main.do")
	public String mainPage(Model model) throws Exception {
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setStartrow(0);
		noticeVO.setEndrow(5);
		List<NoticeVO> noticeList = noticeService.noticeList(noticeVO);
		
		for (int i = 0; i < noticeList.size(); i++) {
			noticeVO = noticeList.get(i);
			noticeVO.setRegistration_date(noticeVO.getRegistration_date().split(" ")[0]);
			
			String str = noticeVO.getNotice_title();
			if(10 > str.length()){
				
			}else{
				noticeVO.setNotice_title(str.substring(0, 10));
			}
			
		}	
		model.addAttribute("noticeList", noticeList);
		
		InquiryVO inquiryVO = new InquiryVO();
		inquiryVO.setStartrow(0);
		inquiryVO.setEndrow(5);
		List<InquiryVO> inquiryList = inquiryService.inquiryList(inquiryVO);
		
		for (int i = 0; i < inquiryList.size(); i++) {
			inquiryVO = inquiryList.get(i);
			inquiryVO.setRegistration_date(inquiryVO.getRegistration_date().split(" ")[0]);
			String str = inquiryVO.getInquiry_subject();
			if(10 > str.length()){
				
			}else{
				inquiryVO.setInquiry_subject(str.substring(0, 10));
			}
			
		}	
		model.addAttribute("inquiryList", inquiryList);
		
		
		
		return "/main/main.jsp";
	}

	// 스마트에디터
	@RequestMapping(value = "/smartEditor.lo")
	public String smartEditor() throws Exception {
		System.out.println("==>" + IMAGE_FILE_PATH);

		return "/main/smartEditor.jsp";
	}

	@RequestMapping(value = "/editSave.sm")
	public void introduceSave(HttpServletResponse response,
			@RequestParam(value = "ir1") String body,
			@RequestParam(value = "number") String number) throws Exception {

		int num = Integer.valueOf(number);

		System.out.println(body);

		BufferedWriter out = null;
		if (num == 1) {
			// 회사소개
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "aboutUs.jsp"));
		} else if (num == 2) {
			// 협력업체
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "partner.jsp"));
		} else if (num == 3) {
			// 시리즈소개
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "aboutContent.jsp"));
		} else if (num == 4) {
			// 히스토리
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "record.jsp"));
		} else if (num == 5) {
			// 규정(여행사)
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "travel.jsp"));
		} else if (num == 6) {
			// 일정(오픈후 업그레이드)
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "schedule.jsp"));
		} else if (num == 7) {
			// 이용약관
			out = new BufferedWriter(
					new FileWriter(JSP_FILE_PATH + "terms.jsp"));
		} else if (num == 8) {
			// 개인정보취급방침
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "personalInformation.jsp"));
		} else if (num == 9) {
			// 사업자정보확인
			out = new BufferedWriter(new FileWriter(JSP_FILE_PATH
					+ "operator.jsp"));
		} else if (num == 10) {
			// 스태프모집
			out = new BufferedWriter(
					new FileWriter(JSP_FILE_PATH + "staff.jsp"));
		}

		out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?><%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" isELIgnored=\"false\"%><%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%><%@ taglib prefix=\"spring\" uri=\"http://www.springframework.org/tags\"%><%@ include file=\"/jsp/common/commonAttribute.jsp\" %>");
		out.newLine();
		out.write(body);

		out.close();

		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		pw.println("<script>");
		pw.println("alert('등록되었습니다');");
		if (num == 1) {
			pw.println("location.href='./aboutUs.do';");
		} else if (num == 2) {
			pw.println("location.href='./partner.do';");
		} else if (num == 3) {
			pw.println("location.href='./aboutContent.do';");
		} else if (num == 4) {
			pw.println("location.href='./record.do';");
		} else if (num == 5) {
			pw.println("location.href='./travel.do';");
		} else if (num == 6) {
			pw.println("location.href='./schedule.do';");
		} else if (num == 7) {
			pw.println("location.href='./terms.do';");
		} else if (num == 8) {
			pw.println("location.href='./personalInformation.do';");
		} else if (num == 9) {
			pw.println("location.href='./operator.do';");
		} else if (num == 10) {
			pw.println("location.href='./staff.do';");
		}
		pw.println("</script>");
		pw.close();

	}

	// 회사소개
	@RequestMapping(value = "/aboutUs.do")
	public String aboutUs() {

		return "/main/aboutUs.jsp";
	}

	// 협력업체
	@RequestMapping(value = "/partner.do")
	public String partner() {

		return "/main/partner.jsp";
	}

	// 협력아티스트
	@RequestMapping(value = "/partnerArtist.do")
	public String partnerArtist() {

		return "/main/partnerArtist.jsp";
	}
	
	// 협력아티스트2
		@RequestMapping(value = "/partnerArtist2.do")
		public String partnerArtist2() {

			return "/main/partnerArtist2.jsp";
	}

	// 통째로빌렸다 소개
	@RequestMapping(value = "/aboutContent.do")
	public String aboutContent() {

		return "/main/aboutContent.jsp";
	}

	// 통째로빌렸다 이력
	@RequestMapping(value = "/record.do")
	public String record() {

		return "/main/record.jsp";
	}

	// 규정
	@RequestMapping(value = "/travel.do")
	public String travel() {

		return "/main/travel.jsp";
	}

	// 스케줄
	@RequestMapping(value = "/schedule.do")
	public String schedule() {

		return "/main/schedule.jsp";
	}

	// 이용약관
	@RequestMapping(value = "/terms.do")
	public String terms() {

		return "/main/terms.jsp";
	}

	// 이용약관 팝업
	@RequestMapping(value = "/terms.pop")
	public String termsPopup() {

		return "/main/terms.jsp";
	}

	// 개인정보
	@RequestMapping(value = "/personalInformation.do")
	public String personalInformation() {

		return "/main/personalInformation.jsp";
	}

	// 개인정보 팝업
	@RequestMapping(value = "/personalInformation.pop")
	public String personalInformationPop() {

		return "/main/personalInformation.jsp";
	}

	// 사업자정보
	@RequestMapping(value = "/operator.do")
	public String operator() {

		return "/main/operator.jsp";
	}

	// 스태프모집
	@RequestMapping(value = "/staff.do")
	public String staff() {

		return "/main/staff.jsp";
	}

}