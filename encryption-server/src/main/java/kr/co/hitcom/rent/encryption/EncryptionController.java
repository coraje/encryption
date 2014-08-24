//rent
package kr.co.hitcom.rent.encryption;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Locale;
import java.util.SimpleTimeZone;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class EncryptionController {

	/** The Constant logger. */
	private static final Log logger = LogFactory.getLog(EncryptionController.class);

	 /** Member Service. */
	 @Resource(name = "encryptionService")
	 private EncryptionService encryptionService;
	

	// 로그인
	@RequestMapping(value = "/loginPage.do")
	public String encryptionLoginPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/loginPage.jsp";
	}

	// 보안관리자 설정
	@RequestMapping(value = "/")
	public String securityManagerPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 암호키(cryptographic key) 생성
	@RequestMapping(value = "/keyMakePage.do")
	public String keyMakePage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/keyMakePage.jsp";
	}
	
	// 암호키(cryptographic key) 생성
	@ResponseBody
	@RequestMapping(value = "/keyMake.aj")
	public String keyMake(HttpServletRequest request, HttpServletResponse response, @ModelAttribute KeyVO keyVO) throws Exception {

		java.util.Date dateNow = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss", Locale.getDefault());
		keyVO.setCreate_date(formatter.format(dateNow));
		
		encryptionService.insertKey(keyVO);
		
		return "success";
	}

	// 암호키(cryptographic key) 백업 및 복구
	@RequestMapping(value = "/")
	public String keyBackupPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 암호키(cryptographic key) 재생성
	@RequestMapping(value = "/")
	public String keyRemakePage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 키 암호키(key encrypting key, kek) (재)생성
	@RequestMapping(value = "/kekMakePage.do")
	public String kekMakePage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/kekMakePage.jsp";
	}
	// 키 암호키(key encrypting key, kek) (재)생성
	@ResponseBody
	@RequestMapping(value = "/kekMake.aj")
	public String kekMake(HttpServletRequest request, HttpServletResponse response, @ModelAttribute KeyVO keyVO) throws Exception {

		java.util.Date dateNow = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss", Locale.getDefault());
		keyVO.setCreate_date(formatter.format(dateNow));
		
		encryptionService.insertKEK(keyVO);
		
		return "success";
	}

	// 키 암호키(key encrypting key, kek) 백업 및 복구
	@RequestMapping(value = "/")
	public String kekBackupPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 글로벌 암호 정책 설정
	@RequestMapping(value = "/globalPolicyPage.do")
	public String globalPolicyPage(HttpServletRequest request) throws Exception {

		return "/encryption/globalPolicyPage.jsp";
	}

	// 글로벌 암호 정책 설정
	@ResponseBody
	@RequestMapping(value = "/globalPolicy.aj", method = RequestMethod.POST)
	public String globalPolicy(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PolicyVO policyVO) throws Exception {
		
		java.util.Date dateNow = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss", Locale.getDefault());
		policyVO.setSystem_apply_date(formatter.format(dateNow));
		
		encryptionService.insertGlobalPolicy(policyVO);
			
		return "success";
		
//		response.sendRedirect("./globalPolicyPage.do");
//		return null;

	}

	// 컬름별 암호 정책 설정
	@RequestMapping(value = "/columnPolicyPage")
	public String columnPolicyPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		return "/encryption/columnPolicyPage.jsp";
	}
	// 컬름별 암호 정책 설정
	@ResponseBody
	@RequestMapping(value = "/columnPolicy.aj", method = RequestMethod.POST)
	public String columnPolicy(HttpServletRequest request, HttpServletResponse response, @ModelAttribute PolicyVO policyVO) throws Exception {
		
		java.util.Date dateNow = Calendar.getInstance(new SimpleTimeZone(0x1ee6280, "KST")).getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddhhmmss", Locale.getDefault());
		policyVO.setSystem_apply_date(formatter.format(dateNow));
		if(policyVO.getHash_check().equals("N")){
			policyVO.setHash_check(null);
			policyVO.setHash_salt(null);
		}
		if(policyVO.getIv_check().equals("N")){
			policyVO.setIv_check(null);
			policyVO.setIv_value(null);
		}
		if(policyVO.getPartial_encrypt_check().equals("N")){
			policyVO.setPartial_encrypt_check(null);
			policyVO.setPartial_encrypt_length(0);
		}
		if(policyVO.getMask_check().equals("N")){
			policyVO.setMask_check(null);
			policyVO.setMask_digit(null);
			policyVO.setMask_value(null);
		}
		
		encryptionService.insertColumnPolicy(policyVO);
		
		return "success";
	}

	// 정책기반 접근제어 등록 화면
	@RequestMapping(value = "/policyACPage")
	public String policyAccessControlPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/policyACPage.jsp";
	}
	// 정책기반 접근제어 등록 화면
	@ResponseBody
	@RequestMapping(value = "/policyAC.aj")
	public String policyAccessControl(HttpServletRequest request, HttpServletResponse response, @ModelAttribute AccessControlVO accessControlVO) throws Exception {
		String start_time = accessControlVO.getDatepickerStart()+accessControlVO.getPtTimeStart();
		String end_time = accessControlVO.getDatepickerEnd()+accessControlVO.getPtTimeEnd();
		
		StringBuffer sbs = new StringBuffer();
        int length = start_time.length();
        for(int i = 0 ; i < length ; i++){
            char curChar = start_time.charAt(i);
            if(Character.isDigit(curChar)) sbs.append(curChar);
        }
		accessControlVO.setStart_time(sbs.toString()+"00");
		StringBuffer sbe = new StringBuffer();
		length = end_time.length();
	        for(int i = 0 ; i < length ; i++){
	            char curChar = end_time.charAt(i);
	            if(Character.isDigit(curChar)) sbe.append(curChar);
	        }
		accessControlVO.setEnd_time(sbe.toString()+"00");
		
		encryptionService.insertPolicyAC(accessControlVO);
		
		return "success";
	}

	// 정책기반 접근제어 조회 및 삭제 화면
	@RequestMapping(value = "/")
	public String policyAccessControlViewPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 행위 기반 접근제어 등록 화면
	@RequestMapping(value = "/behaviorACPage")
	public String behaviorAccessControlPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/behaviorACPage.jsp";
	}
	// 행위 기반 접근제어 등록 화면
	@ResponseBody
	@RequestMapping(value = "/behaviorAC.aj")
	public String behaviorAccessControl(HttpServletRequest request, HttpServletResponse response, @ModelAttribute AccessControlVO accessControlVO) throws Exception {
		
		encryptionService.insertBehaviorAC(accessControlVO);
		
		return "success";
	}

	// 행위 기반 접근제어 조회 및 삭제 화면
	@RequestMapping(value = "/")
	public String BehaviorAccessControlViewPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 작업승인 요청 및 취소
	@RequestMapping(value = "/")
	public String workApprovedRequestPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

	// 작업승인
	@RequestMapping(value = "/")
	public String workApprovedPage(HttpServletRequest request, HttpServletResponse response) throws Exception {

		return "/encryption/.jsp";
	}

}
