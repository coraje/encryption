<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
        
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfobject.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfComponent.js"></script>

        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
            var listURL = "<c:url value="/portal/menu/list.do" />";
            var modifyURL = "<c:url value="/portal/menu/modify.do" />";
		
            /********************************************************************************
             * 초기화
             ********************************************************************************/
            $(document).ready(function() {
                // '목록' 버튼 이벤트
                $("#listBtn").click(function(event) {
                    formSubmit("sendForm", "post", listURL);
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
                메뉴 관리
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 포탈 관리 &gt; 메뉴 관리
                &gt; <span style="color: #4869AE; font-weight: bold;">메뉴 상세</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>메뉴 상세</a>
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
                    <td class="subject_td_01">등록자</td>
                    <td class="content_td_01">
                        ${menu['creatorName']}&nbsp;
                    </td>
                    <td class="subject_td_01">등록일</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        ${menu['created']}&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">메뉴 명</td>
                    <td class="content_td_01">
                        ${menu['mnuName']}&nbsp;
                    </td>
                    <td class="subject_td_01">상위 메뉴 명</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <c:choose>
                            <c:when test="${menu['parentOid'] eq '0'}">
                                최상위 메뉴
                            </c:when>
                            <c:otherwise>
                                ${menu['parentName']}&nbsp;
                            </c:otherwise>
                        </c:choose> 
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">URL</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${menu['mnuUrl']}&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">순서</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${menu['mnuOrder']}&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">팝업 여부</td>
                    <td class="content_td_02">
                        <c:choose>
                            <c:when test="${menu['popYN'] eq 'Y'}">
                                팝업
                            </c:when>
                            <c:otherwise>
                                페이지
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td class="subject_td_02">활성화 여부</td>
                    <td class="content_td_02" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <c:choose>
                            <c:when test="${menu['actYN'] eq 'Y'}">
                                활성
                            </c:when>
                            <c:otherwise>
                                비활성
                            </c:otherwise>
                        </c:choose>
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
                <input type="hidden" id="mnuOid" name="mnuOid" value="${menu['mnuOid']}" />
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="포탈 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="7" />
                <input type="hidden" id="subMenu" name="subMenu" value="1" />
            </form>
        </div>
    </body>
</html>