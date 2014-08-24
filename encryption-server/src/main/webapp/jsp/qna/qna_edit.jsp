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
	        var saveURL = "<c:url value="/information/qna/create.do" />";
	        var listURL = "<c:url value="/information/qna/list.do" />";

	        $(document).ready(function() {
		        if(${searchVO['qnaOid']} != 0) {
			        var subject = "RE : " + "${searchVO['subject']}";
			        $("#subject").val(subject);
		        }
		        
	            // 목록 버튼 클릭 이벤트
	            $("#listBtn").click(function(event) {
	                formSubmit("sendForm", "post", listURL);
	            });
	            
	            // 저장 버튼 클릭 이벤트
	            $("#saveBtn").click(function(event) {
	                var qnaOid = ${searchVO['qnaOid']};
	                
	                event.preventDefault();

	                if($.trim($("#password").val()) != $.trim($("#password1").val())) {
                        alert("<spring:message code="adm.warn.match.required" arguments="비밀번호" />");
                        $("#password1").focus();
                        return;
                    }
	                
	                if($.trim($("#subject").val()) == "") {
	                    alert("<spring:message code="adm.warn.input.required" arguments="제목" />");
	                    $("#subject").focus();
	                    return;
	                }
	
	                if($.trim($("#content").val()) == "") {
	                    alert("<spring:message code="adm.warn.input.required" arguments="내용" />");
	                    $("#content").focus();
	                    return;
	                }

	                if(confirm("<spring:message code="adm.message.save.confirm" />")){
		                $("#BUTTON_AREA").hide();
		                
		                var sendData = $("#qnaForm").serialize();
		                $.ajax({
		                    type : "post",
		                    url : saveURL,
		                    dataType : "html",
		                    data : sendData,
		                    success : function(data) {
		                        eval("var resultData = " + data);
		                        
		                        if(resultData.resultCode == 200) {
		                            alert("<spring:message code="adm.message.save.success" />");
		                        }
		
		                        location.href = listURL;
		                    },
		                    error : function(xhr, textStatus) {
		                        alert("<spring:message code="adm.error.save.fail" />");
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
                Q&A
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 정보 관리 &gt; Q&A
                &gt; <span style="color: #4869AE; font-weight: bold;">Q&A 등록</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>Q&A 등록</a>
                </div>
            </div>
            
            <form id="qnaForm" name="qnaForm" method="post">
            <input type="hidden" id="parentOid" name="parentOid" value="${searchVO['qnaOid']}" />
            <table class="info_table_01" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                </colgroup>
                <tr>
                    <td class="subject_td_01">작성자</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="text" id="creatorName" name="creatorName" value="${sessionScope._ADMIN_INFO.name }" readonly="readonly" maxlength="128" class="input_text_01" style="width: 120px" />
                        <input type="hidden" id="creatorOid" name="creatorOid" value="${sessionScope._ADMIN_INFO.admOid }" />
                        
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">비밀번호</td>
                    <td class="content_td_01">
                        <input type="password" id="password" name="password" maxlength="12" class="input_text_01" style="width: 120px;" />
                    </td>
                    <td class="subject_td_01">비밀번호 확인</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="password" id="password1" name="password1" maxlength="12" class="input_text_01" style="width: 120px;" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">공개 여부</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="radio" id="lockYN" name="lockYN" value="Y" checked="checked" />
                        <label for="lockY" style="cursor: pointer;">공개</label>
                        &nbsp;&nbsp;
                        <input type="radio" id="lockYN" name="lockYN" value="N" />
                        <label for="lockN" style="cursor: pointer;">비공개</label>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">제목</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="text" id="subject" name="subject" maxlength="128" class="input_text_01" style="width: 98%;" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">내용</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <textarea id="content" name="content" style="width: 98%; height: 100px;"></textarea>
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
                <input type="hidden" id="topOid" name="topOid" value="${searchVO['topOid']}" />
                <input type="hidden" id="curPage" name="curPage" value="${searchVO['curPage']}" />
                <input type="hidden" id="rowSize" name="rowSize" value="${searchVO['rowSize']}" />
                <input type="hidden" id="groupSize" name="groupSize" value="${searchVO['groupSize']}" />
                <input type="hidden" id="keywordType" name="keywordType" value="${searchVO['keywordType']}" />
                <input type="hidden" id="keyword" name="keyword" value="${searchVO['keyword']}" />
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="정보 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="6" />
                <input type="hidden" id="subMenu" name="subMenu" value="4" />
            </form>
        </div>
    </body>
</html>