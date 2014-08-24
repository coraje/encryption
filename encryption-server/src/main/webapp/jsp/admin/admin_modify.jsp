<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
            var saveURL = "<c:url value="/portal/admin/update.do" />";
            var listURL = "<c:url value="/portal/admin/list.do" />";
        
            $(document).ready(function() {
            	initForm();

            	$("#emailSelect").change(function() {
                    value = $("#emailSelect option:selected").text();
                    if($("#emailSelect option:selected").val() == ""){
                    	$("#emailDomain").val("");
                    }else{
                        $("#emailDomain").val(value);
                    }
                });
                
                // '권한' 선택
                $("#powerOid > option[value="+ "${admin['powerOid']}" +"]").attr("selected", "true");
                
                // '목록' 버튼 이벤트
                $("#listBtn").click(function(event) {
                    formSubmit("sendForm", "post", listURL);
                });
                
                // '저장' 버튼 이벤트
                $("#saveBtn").click(function(event) {
                    event.preventDefault();

                 // 비밀번호
                    if($.trim($("#pw").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="비밀번호" />");
                        $("#pw").focus();
                        return;
                    }
                    if($.trim($("#pw").val()) != $.trim($("#pwCfm").val())){
                         alert("<spring:message code="adm.warn.match.required" arguments="비밀번호" />");
                         $("#pwCfm").focus();
                         return;
                    }
                    
                    // 권한
                    if($.trim($("#powerOid").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="권한" />");
                        $("#powerOid").focus();
                        return;
                    }
                    // E-Mail
                    if($.trim($("#emailId").val()) == "" || $.trim($("#emailDomain").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="Email" />");
                        if($.trim($("#emailId").val()) == ""){
                            $("#emailId").focus();
                        }else{
                            $("#emailDomain").focus();
                        }
                        return;
                    }
                    // 핸드폰
                    if($.trim($("#mobile1").val()) == "" || $.trim($("#mobile2").val()) == "" || $.trim($("#mobile3").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="핸드폰" />");
                        if($.trim($("#mobile1").val()) == ""){
                            $("#mobile1").focus();
                        }else if($.trim($("#mobile2").val()) == ""){
                            $("#mobile2").focus();
                        }else{
                            $("#mobile3").focus();
                        }
                        return;
                    }
                    // 연락처
                    if($.trim($("#tel1").val()) == "" || $.trim($("#tel2").val()) == "" || $.trim($("#tel3").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="연락처" />");
                        if($.trim($("#tel1").val()) == ""){
                            $("#tel1").focus();
                        }else if($.trim($("#tel2").val()) == ""){
                            $("#tel2").focus();
                        }else{
                            $("#tel3").focus();
                        }
                        return;
                    }
                    if(confirm("<spring:message code="adm.message.modify.confirm" />")){
	                    $('#BUTTON_AREA').hide();
	                    
	                    var sendData = "admOid=" + "${searchVO['admOid']}&" + $("#adminForm").serialize();
	                    
	                    $.ajax({
	                        type : "POST",
	                        url : saveURL,
	                        data : sendData,
	                        dataType : "html",
	                        success : function(data) {
	                            eval("var resultData = " + data);
	                            
	                            if(resultData.resultCode == 200) {
	                                alert("<spring:message code="adm.message.save.success" />");
	                            }
	
	                            formSubmit("sendForm", "post", listURL);
	                        },
	                        error : function(xhr, textStatus) {
	                            alert("<spring:message code="adm.error.save.fail" />");
	                            $('#BUTTON_AREA').show();
	                        }
	                    });
                    }
                });
            }); 

            function initForm() {
                // 핸드폰 설정
                subCodeListByValueForSelectBox("<%= GROUP_CODE.ETC_CAT_E %>", "emailSelect");
            }
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
                &gt; <span style="color: #4869AE; font-weight: bold;">관리자 정보 수정</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    관리자 정보 수정
                </div>
            </div>
            
            <form id="adminForm" name="adminForm" method="post">
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
                        <input type="text" id="loginId" name="loginId" class="input_text_01" style="width: 120px;" value="${admin['loginId']}" readonly="readonly"/>
                    </td>
                    <td class="subject_td_01">관리자 명</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="text" id="name" name="name" class="input_text_01" style="width: 120px" value="${admin['name']}" readonly="readonly"/>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">비밀번호</td>
                    <td class="content_td_01">
                        <input type="password" id="pw" name="pw" class="input_text_01" style="width: 120px" value="${admin['pw']}"/>
                    </td>
                    <td class="subject_td_01">비밀번호확인</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="password" id="pwCfm" name="pwCfm" class="input_text_01" style="width: 120px" value="${admin['pw']}"/>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">권한</td>
                    <td class="content_td_01">
                        <select id="powerOid" name="powerOid" class="input_select_01">
                            <option value="">선택 하세요.</option>
                            <option value="1">Administrator</option>
                            <option value="2">Access Only</option>
                        </select>
                    </td>
                    <td class="subject_td_01">E-Mail</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="text" id="emailId" name="emailId" class="input_text_01" style="width: 50px" value="${admin['emailId']}"/>@
                        <input type="text" id="emailDomain" name="emailDomain" class="input_text_01" style="width: 80px" value="${admin['emailDomain']}"/>
                        <select id="emailSelect" name="emailSelect" class="input_select_01" >
                             <option value="" selected="selected">직접입력</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">핸드폰</td>
                    <td class="content_td_01">
                        <input type="text" id="mobile1" name="mobile1" class="input_text_01" style="width: 35px" value="${admin['mobile1']}"/>-
                        <input type="text" id="mobile2" name="mobile2" class="input_text_01" style="width: 35px" value="${admin['mobile2']}"/>-
                        <input type="text" id="mobile3" name="mobile3" class="input_text_01" style="width: 35px" value="${admin['mobile3']}"/>
                    </td>
                    <td class="subject_td_01">연락처</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="text" id="tel1" name="tel1" class="input_text_01" style="width: 35px" value="${admin['tel1']}"/>-
                        <input type="text" id="tel2" name="tel2" class="input_text_01" style="width: 35px" value="${admin['tel2']}"/>-
                        <input type="text" id="tel3" name="tel3" class="input_text_01" style="width: 35px" value="${admin['tel3']}"/>
                    </td>                   
                </tr>
                <tr>
                    <td class="subject_td_02">메모</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <textarea id="summary" name="summary" style="width: 98%; height: 100px;" >${admin['summary']}</textarea>
                    </td>
                </tr>
            </table>
            </form>
            
            <!-- 버튼 영역 ST. -->
            <div id="BUTTON_AREA" class="button_outer_area_01">
                <div class="button_inner_area_02">
                    <input type="button" id="listBtn" name="listBtn" class="list_btn_b" />
                </div>
                <div class="button_inner_area_03">
                    <input type="button" id="saveBtn" name="saveBtn" class="save_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
            <form id="sendForm" name="sendForm">
                <input type="hidden" id="curPage" name="curPage" value="${searchVO['curPage']}" />
                <input type="hidden" id="rowSize" name="rowSize" value="${searchVO['rowSize']}" />
                <input type="hidden" id="groupSize" name="groupSize" value="${searchVO['groupSize']}" />
                <input type="hidden" id="keywordType" name="keywordType" value="${searchVO['keywordType']}" />
                <input type="hidden" id="keyword" name="keyword" value="${searchVO['keyword']}" />
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="포탈 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="7" />
                <input type="hidden" id="subMenu" name="subMenu" value="2" />
            </form>
        </div>
    </body>
</html>