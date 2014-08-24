//package kr.co.hitcom.rent.common;
//
//import java.io.BufferedWriter;
//import java.io.FileWriter;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//
//@Controller
//public class IntroduceController {
//	
//    private static final String FILE_PATH = "D:\\download\\eclipse-jee-juno-SR2-win32\\workspace\\whollyrental\\src\\main\\webapp\\jsp\\";
//    
//	/** The Constant logger. */
//    private static final Log logger = LogFactory.getLog(IntroduceController.class);
//    
//    @RequestMapping(value = "/introduce.sm")
//    public String introduceEdit()
//        throws Exception {
//
//        return "/introduceEdit.html";
//    }
//    
//    @RequestMapping(value = "/introduce_save.sm")
//    public String introduceSave(@RequestParam(value="ir1") String body)
//        throws Exception {
//    	
//    	System.out.println(body);
//    	
//    	BufferedWriter out = new BufferedWriter(new FileWriter(FILE_PATH + "introduce.jsp"));
//        out.write("<?xml version=\"1.0\" encoding=\"UTF-8\" ?><%@ page language=\"java\" contentType=\"text/html; charset=UTF-8\" pageEncoding=\"UTF-8\" isELIgnored=\"false\"%><%@ taglib prefix=\"c\" uri=\"http://java.sun.com/jsp/jstl/core\"%><%@ taglib prefix=\"spring\" uri=\"http://www.springframework.org/tags\"%><%@ include file=\"/jsp/common/commonAttribute.jsp\" %>");
//        out.newLine();
//        out.write(body);
//
//        out.close();
//    	
//
//        return "/introduceEdit.html";
//    }
//    
//    @RequestMapping(value = "/introduce.do")
//    public String loginAdmin()
//        throws Exception {
//
//        return "/introduce.jsp";
//    }
//}
