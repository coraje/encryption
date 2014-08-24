<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
        
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfobject.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfComponent.js"></script>
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
	        var listURL = "<c:url value="/portal/user/list.do" />";
	        var modifyURL = "<c:url value="/portal/user/modify.do" />";
	        var acceptURL = "<c:url value="/portal/user/accept.do" />";

	        // 초기화..
	        $(document).ready(function() {
	            // '목록' 버튼 이벤트
	            $("#listBtn").click(function(event) {
	                formSubmit("sendForm", "post", listURL);
	            });

	            // '승인' 버튼 이벤트
	            $("#acceptBtn").click(function(event) {
	            	var sendData = $("#sendForm").serialize();

	            	$.ajax({
                        type : "post",
                        url : acceptURL,
                        dataType : "html",
                        data : sendData,
                        success : function(data) {
                            eval("var resultData = " + data);
                            
                            if(resultData.resultCode == 200) {
                            	alert("<spring:message code="adm.message.accept.success" />");
                                document.getElementById("actColumn").innerHTML = "활성";
                                document.getElementById("acceptColumn").innerHTML = "승인";
                            }
                        },
                        error : function(xhr, textStatus) {
                        	alert("<spring:message code="adm.error.accept.fail" />");
                        }
                    });
                });
	
	            // '수정' 버튼 이벤트
	            $("#modifyBtn").click(function(event) {
	                formSubmit("sendForm", "post", modifyURL);
	            });
	        });
	    //-->
        </script>
    </head>
    <body>
        <div id="TITLE_AREA">
            <div id="TITLE_TEXT">
                <img src="../../images/icon/icon_title.png" alt="" />
                고객 관리
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 포탈 관리 &gt; 고객 관리
                &gt; <span style="color: #4869AE; font-weight: bold;">고객 상세</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>고객 상세</a>
                </div>
            </div>
            
            <table class="info_table_01" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                </colgroup>
                <tr>
                    <td class="subject_td_01">계정 ID</td>
                    <td class="content_td_01">
                        ${user['loginId']}
                    </td>
                    <td class="subject_td_01">가입자 명</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        ${user['usrName']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">핸드폰</td>
                    <td class="content_td_01" id="actColumn">
                        ${user['mobile1']}&nbsp;-&nbsp;${user['mobile2']}&nbsp;-&nbsp;${user['mobile3']}
                    </td>
                    <td class="subject_td_01">활성화 여부</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <c:choose>
                            <c:when test="${user['actYN'] == 'Y'}">
                                활성
                            </c:when>
                            <c:otherwise>
                                비활성
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">E-Mail</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        ${user['emailId']}@${user['emailAccount']}
                    </td>
                </tr>
            </table>
            
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>고객 부가 정보</a>
                </div>
            </div>
            
            <table class="info_table_01" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                </colgroup>
                <tr>
                    <td class="subject_td_01">가입사 명</td>
                    <td class="content_td_01">
                        ${company['comName']}
                    </td>
                    <td class="subject_td_01">가입 승인 여부</td>
                    <td class="content_td_01" id="acceptColumn" style="border-right: 0px;" >
                        <c:choose>
                            <c:when test="${company['acceptYN'] == 'Y'}">
                                &nbsp;승인
                            </c:when>
                            <c:otherwise>
                                &nbsp;승인 대기&nbsp;
                                <input type="button" id="acceptBtn" name="acceptBtn" class="accept_btn_b" value="승인 처리" />
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">우편번호</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${company['zip1']}&nbsp;-&nbsp;${company['zip2']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">주소</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${company['addr1']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">&nbsp;</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${company['addr2']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">전화 번호</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        ${company['tel1']}&nbsp;-&nbsp;${company['tel2']}&nbsp;-&nbsp;${company['tel3']}
                    </td>
                </tr>
            </table>
            
            <!-- 버튼 영역 ST. -->
            <div class="button_outer_area_01">
                <div class="button_inner_area_02">
                    <input type="button" id="listBtn" name="listBtn" class="list_btn_b" />
                </div>
                <div class="button_inner_area_03">
                    <input type="button" id="modifyBtn" name="modifyBtn" class="modify_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
            
            <form id="sendForm" name="sendForm">
                <input type="hidden" id="usrOid" name="usrOid" value="${searchVO['usrOid']}" />
                <input type="hidden" id="curPage" name="curPage" value="${searchVO['curPage']}" />
                <input type="hidden" id="rowSize" name="rowSize" value="${searchVO['rowSize']}" />
                <input type="hidden" id="groupSize" name="groupSize" value="${searchVO['groupSize']}" />
                <input type="hidden" id="keywordType" name="keywordType" value="${searchVO['keywordType']}" />
                <input type="hidden" id="keyword" name="keyword" value="${searchVO['keyword']}" />
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="고객  관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="7" />
                <input type="hidden" id="subMenu" name="subMenu" value="3" />
            </form>
        </div>
    </body>
</html>