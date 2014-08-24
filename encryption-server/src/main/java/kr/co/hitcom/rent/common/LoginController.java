//package kr.co.hitcom.rent.common;
//
//import java.io.IOException;
//import java.io.Writer;
//
//import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import kr.co.hitcom.rent.admin.AdminService;
//import kr.co.hitcom.rent.admin.AdminVO;
//import kr.co.hitcom.rent.user.UserVO;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.ModelMap;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//
//@Controller
//public class LoginController {
//    
//    /** The Constant logger. */
//    private static final Log logger = LogFactory.getLog(LoginController.class);
//    
//    @Resource(name="adminService")
//    private AdminService adminService;
//    
//    /**
//     * 로그인 화면 이동.
//     *
//     * @return 로그인 화면 경로
//     * @throws Exception the exception
//     */
//    @RequestMapping(value = "/admin.do")
//    public String loginAdmin()
//        throws Exception {
//
//        return "/main/login.jsp";
//    }
//    
//    /**
//     * Admin 체크
//     *
//     * @param adminVO the admin vo
//     * @param model the model
//     * @param response the response
//     * @param request the request
//     * @throws IOException Signals that an I/O exception has occurred.
//     */
//    @RequestMapping(value = "/main/check.do")
//    public void checkAdmin(@ModelAttribute AdminVO adminVO, ModelMap model, HttpServletResponse response, HttpServletRequest request)
//        throws IOException {
//    	
//        if (logger.isDebugEnabled()) {
//            logger.debug(adminVO);
//        }
//
//        String resultStr = "";
//        Writer out = response.getWriter();
//
////        AdminVO loginUser = adminService.searchAdminCheck(adminVO);
//        AdminVO loginUser = adminVO;	// TODO 임시
//        
//        if(loginUser != null) {
//			HttpSession session = request.getSession();
//			session.setAttribute("_ADMIN_INFO", loginUser);
//			resultStr = "{resultCode : 200, resultStatus : 'SUCCESS'}";
//		} else {
//			resultStr = "{resultCode : 500, resultStatus : 'FAIL'}"; 
//		}
//        
//        out.write(resultStr);
//        out.flush();
//    }
//    
//	/**
//	 * Login out admin.
//	 *
//	 * @param request the request
//	 * @return the string
//	 * @throws Exception the exception
//	 */
//	@RequestMapping(value = "/main/logout.do")
//    public String loginOutAdmin(HttpServletRequest request)
//        throws Exception {
//		
//		HttpSession session = request.getSession();
//		
//		session.invalidate();
//		
//        return "/main/login.jsp";
//    }
//    
//	@RequestMapping(value = "/applicatoin.sm")
//    public String frameSet()
//        throws Exception {
//
//        return "/application.jsp";
//    }
//    	
//}
