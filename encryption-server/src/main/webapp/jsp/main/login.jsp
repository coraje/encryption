<%-- <?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=7" />
        <title>통째로빌렸다</title>
        
        <!-- Common CSS import -->
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_main.css" />
        
        <!-- Common JS import -->
        <script language="javascript" type="text/javascript" src="/whollyrental/js/jquery-1.4.4.js"></script>
        <script language="javascript" type="text/javascript" src="/whollyrental/js/common.js"></script>
    
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--

             var checkURL = "<c:url value="/main/check.do" />";
             var goURL = "<c:url value="/introduce.sm" />";

            // 초기화..
            $(document).ready(function() {
            	
                // Login 버튼 이벤트
                $("#loginBtn").click(function(event) {

                	var sendData = $("#loginForm").serialize();

                	if($.trim($("#loginId").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="ID" />");
                        $("#loginId").focus();
                        return;
                    }

                	if($.trim($("#pw").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="PASSWORD" />");
                        $("#loginPw").focus();
                        return;
                    }

                	$.ajax({
                        type : "post",
                        url : checkURL,
                        dataType : "html",
                        data : sendData,
                        success : function(data) {
                            eval("var resultData = " + data);
                            
                            if(resultData.resultCode == 200) {
                                location.href = goURL;
                            }
                        },
                        error : function(xhr, textStatus) {
                            alert("<spring:message code="adm.warn.login.confirm" />");
                            $('#BUTTON_AREA').show();
                        }
                    });
                });

            });
            
        //-->
        	function main() {
        		location.href = "${_ContextPath}/main.do";
        	}
        </script>
    </head>
    <body onload="main()">
        <div id="LOGIN_AREA">
            <div id="LOGIN_BACK">
	            <div id="LOGIN_WRAP">
	                <div id="login"> 
	                    <form id="loginForm" name="loginForm"> 
	                        <div style="float: left; width: 140px; height:44px;"> 
	                            <input type="text" style="height: 19px;" id="loginId" name="loginId" value="admin" />
	                            <input type="password" style="height: 19px;" id="pw" name="pw" value="1" />
	                        </div>
	                        <div style="float: left; width: 80px;margin-top: 3px;">
	                            <input type="button" id="loginBtn" name="loginBtn" class="login_btn" />
	                        </div>
		                </form>
	                </div>
		        </div>
            </div>	        
        </div>
        
        <form id="sendForm" name="sendForm">
            <input type="hidden" id="mainMenuText" name="mainMenuText" value="상품 관리" />
            <input type="hidden" id="mainMenu" name="mainMenu" value="1" />
            <input type="hidden" id="subMenu" name="subMenu" value="1" />
        </form>
    </body>
</html> --%>