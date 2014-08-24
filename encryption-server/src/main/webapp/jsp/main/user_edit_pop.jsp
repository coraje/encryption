<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_l_pop.css" />
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_l_pop_body.css" />
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
    
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfobject.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfComponent.js"></script>
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
            var saveURL = "<c:url value="/main/create.do" />";
            var checkURL = "<c:url value="/portal/user/check.do" />";

            var checkValue = "false";

            /********************************************************************************
             * 초기화
             ********************************************************************************/
            $(document).ready(function() {

                $("#emailAccountNo").change(function() {
                    value = $("#emailAccountNo").val();
                    if(value.length < 1) {
                    	$("#emailAccount").removeAttr("readonly");
                    } else {
                    	$("#emailAccount").attr("readonly", true);
                    }
                    $("#emailAccount").val(value);
                });

                // 중복 버튼
                // 중복 버튼 클릭 이벤트
                $("#checkBtn").click(function(event) {
                    var sendData = $("#userForm").serialize();

                    if($.trim($("#loginId").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="계정 ID" />");
                        $("#loginId").focus();
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
                                alert("<spring:message code="adm.message.use.success" arguments="입력하신 ID" />");
                                $("#checkBtn").attr("disabled", "disabled");
                                checkValue = "true";
                            } else {
                                alert("<spring:message code="adm.warn.use.required" arguments="입력하신 ID" />");
                                $("#loginId").val("");
                                $("#loginId").focus();
                            }
                        },
                        error : function(xhr, textStatus) {
                           //
                        }
                    });
                });

            	$("#saveBtn").click(function(event) {
            		event.preventDefault();
            		
            		var sendData1 = $("#userForm").serialize();
            		var sendData2 = $("#companyForm").serialize();

            		if($.trim($("#loginId").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="계정 ID" />");
                        $("#loginId").focus();
                        return;
                    }

            		if(checkValue == "false") {
                        alert("<spring:message code="adm.warn.check.required" />");
                        return;
                    }

            		if($.trim($("#usrName").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="가입자 명" />");
                        $("#usrName").focus();
                        return;
                    }

            		if($.trim($("#mobile2").val()) == "" || $.trim($("#mobile3").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="핸드폰" />");
                        $("#mobile2").focus();
                        return;
                    }

            		if($.trim($("#usrPw").val()) != $.trim($("#usrPw1").val())) {
                        alert("<spring:message code="adm.warn.match.required" arguments="비밀번호" />");
                        $("#usrPw").focus();
                        return;
                    }

                    $.ajax({
                        type : "post",
                        url : saveURL,
                        dataType : "html",
                        data : sendData1+"&"+sendData2,
                        success : function(data) {
                            eval("var resultData = " + data);
                            
                            if(resultData.resultCode == 200) {
                                alert("<spring:message code="adm.message.save.success" />");
                                location.href = listURL;
                            }
                        },
                        error : function(xhr, textStatus) {
                            alert("<spring:message code="adm.error.save.fail" />");
                            $('#BUTTON_AREA').show();
                        }
                    });
            	});
            });

            /********************************************************************************
             * 상위 메뉴 선택 창 감추기
             ********************************************************************************/
            function hiddenFraemArea() {
                $("#FRAME_AREA").hide();
            }

        //-->
        </script>
    </head>
    <body>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01">
                <div class="sub_title_text_01">
                    <a>기본 정보</a>
                </div>
            </div>
            
            <form id="userForm" name="userForm">
            <table class="info_table_01" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 125px;"/>
                    <col style="width: 250px;"/>
                    <col style="width: 125px;"/>
                    <col style="width: 250px;"/>
                </colgroup>
                <tr>
                    <td class="subject_td_01">계정 ID</td>
                    <td class="content_td_01">
                        <input type="text" id="loginId" name="loginId" maxlength="16" class="input_text_01" style="width: 120px" />
                        <input type="button" id="checkBtn" name="checkBtn" class="check_btn_b" value="중복확인" />
                    </td>
                    <td class="subject_td_01">가입자 명</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="text" id="usrName" name="usrName" maxlength="16" class="input_text_01" style="width: 120px" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">비밀번호</td>
                    <td class="content_td_01">
                        <input type="password" id="usrPw" name="usrPw" maxlength="16" class="input_text_01" style="width: 120px" />
                    </td>
                    <td class="subject_td_01">비밀번호 확인</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="password" id="usrPw1" name="usrPw1" maxlength="16" class="input_text_01" style="width: 120px" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">핸드폰</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <select id="mobile1" name="mobile1" class="input_select_01" style="width: 50px;">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="018">018</option>
                        </select>
                        &nbsp;-&nbsp;
                        <input type="text" id="mobile2" name="mobile2" maxlength="4" class="input_text_01" style="width: 50px" />
                        &nbsp;-&nbsp;
                        <input type="text" id="mobile3" name="mobile3" maxlength="4" class="input_text_01" style="width: 50px" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">E-Mail</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <input type="text" id="emailId" name="emailId" maxlength="16" class="input_text_01" style="width: 120px" />
                        &nbsp;@&nbsp;
                        <input type="text" id="emailAccount" name="emailAccount" class="input_text_01" style="width: 145px" readonly />
                        <select id="emailAccountNo" name="emailAccountNo" class="input_select_01" style="width: 100px;">
                            <option value="">선택</option>
                            <option value="naver.com">네이버</option>
                            <option value="daum.net">다음</option>
                        </select>
                    </td>
                </tr>
            </table>
            </form>
            
            <div class="sub_title_area_01">
                <div class="sub_title_text_01">
                    <a>부가 정보</a>
                </div>
            </div>
            
            <form id="companyForm" name="companyForm">
            <table class="info_table_01" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 125px;"/>
                    <col style="width: 250px;"/>
                    <col style="width: 125px;"/>
                    <col style="width: 250px;"/>
                </colgroup>
                <tr>
                    <td class="subject_td_01">가입사 명</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="text" id="comName" name="comName" class="input_text_01" style="width: 120px" />
                    </td>
                    <td class="content_td_01" style="border-right: 0px;">&nbsp;</td>
                    <td class="content_td_01" style="border-right: 0px;">&nbsp;</td>
                </tr>
                <tr>
                    <td class="subject_td_01">우편번호</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="text" id="zip1" name="zip1" maxlength="3" class="input_text_01" style="width: 35px;" />
                        &nbsp;-&nbsp;
                        <input type="text" id="zip2" name="zip2" maxlength="3" class="input_text_01" style="width: 35px;" />
                        &nbsp;
                        <input type="button" id="searchZip" name="searchZip" class="input_text_01" style="width: 35px;" value="검색"/>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">주소</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="text" id="addr1" name="addr1" class="input_text_01" style="width: 90%;" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">&nbsp;</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="text" id="addr2" name="addr2" class="input_text_01" style="width: 90%;" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">전화 번호</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <input type="text" id="tel1" name="tel1" class="input_text_01" style="width: 40px" />
                        &nbsp;-&nbsp;
                        <input type="text" id="tel2" name="tel2" class="input_text_01" style="width: 40px" />
                        &nbsp;-&nbsp;
                        <input type="text" id="tel3" name="tel3" class="input_text_01" style="width: 40px" />
                    </td>
                </tr>
            </table>
            </form>
            
            <!-- 버튼 영역 ST. -->
            <div class="button_outer_area_01">
                <div class="button_inner_area_02">
                    <input type="button" id="closeBtn" name="closeBtn" class="close_btn_b" />
                </div>
                <div class="button_inner_area_03">
                    <input type="button" id="saveBtn" name="saveBtn" class="save_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
        </div>
        
    </body>
</html>