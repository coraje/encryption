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
        var listURL = "<c:url value="/portal/admin/list.do" />";
        var modifyURL = "<c:url value="/portal/admin/modify.do" />";
        var removeURL = "<c:url value="/portal/admin/remove.do" />";
    
        // 초기화..
        $(document).ready(function() {
            // '목록' 버튼 이벤트
            $("#listBtn").click(function(event) {
                formSubmit("sendForm", "post", listURL);
            });

            // '수정' 버튼 이벤트
            $("#modifyBtn").click(function(event) {
                formSubmit("sendForm", "post", modifyURL);
            });

            // '삭제' 버튼 이벤트
            $("#removeBtn").click(function(event) {
                if(confirm("<spring:message code="adm.message.remove.confirm" />")) {
                    $("#BUTTON_AREA").hide();
                    
                    var sendData = "admOid=" + ${searchVO['admOid']};
                    $.ajax({
                        type : "post",
                        url : removeURL,
                        dataType : "html",
                        data : sendData,
                        success : function(data) {
                            eval("var resultData = " + data);
                            
                            if(resultData.resultCode == 200) {
                                alert("<spring:message code="adm.message.remove.success" />");
                            }

                            formSubmit("sendForm", "post", listURL);
                        },
                        error : function(xhr, textStatus) {
                            alert("<spring:message code="adm.error.remove.fail" />");
                            $('#BUTTON_AREA').show();
                        }
                    });
                }
            });
        });
    //-->
        </script>
    </head>
    <body>
        <div id="TITLE_AREA">
            <div id="TITLE_TEXT">
                <img src="../../images/icon/icon_title.png" alt="" />
                관리자 관리
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 포탈 관리 &gt; 관리자 관리
                &gt; <span style="color: #4869AE; font-weight: bold;">관리자 기본 정보</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    관리자 기본 정보
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
                    <td class="subject_td_01">관리자 ID</td>
                    <td class="content_td_01">
                        ${admin['loginId']}
                    </td>
                    <td class="subject_td_01">등록일</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                         ${admin['created']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">관리자 명</td>
                    <td class="content_td_01">
                        ${admin['name']}
                    </td>
                    <td class="subject_td_01">권한</td>
                    <td class="content_td_01" style="border-right: 0px;">
	                    <c:if test="${admin['powerOid'] == '1'}" >Administrator</c:if>
	                    <c:if test="${admin['powerOid'] == '2'}" >Access Only</c:if>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">E-Mail</td>
                    <td class="content_td_01">
                        ${admin['emailId']}@${admin['emailDomain']}
                    </td>
                    <td class="subject_td_01">연락처</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        ${admin['tel1']}-${admin['tel2']}-${admin['tel3']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">메모</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        ${admin['summary']}
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
                    <input type="button" id="removeBtn" name="removeBtn" class="remove_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
            
            <form id="sendForm" name="sendForm">
                <input type="hidden" id="admOid" name="admOid" value="${searchVO['admOid']}" />
                <input type="hidden" id="curPage" name="curPage" value="${searchVO['curPage']}" />
                <input type="hidden" id="rowSize" name="rowSize" value="${searchVO['rowSize']}" />
                <input type="hidden" id="groupSize" name="groupSize" value="${searchVO['groupSize']}" />
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="포탈 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="7" />
                <input type="hidden" id="subMenu" name="subMenu" value="2" />
            </form>
        </div>
    </body>
</html>