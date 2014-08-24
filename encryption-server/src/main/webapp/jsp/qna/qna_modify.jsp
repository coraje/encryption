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
            var saveURL = "<c:url value="/information/qna/update.do" />";
            var listURL = "<c:url value="/information/qna/list.do" />";
        
            $(document).ready(function() {
              //'팝업 여부' 선택
                $("input[name=lockYN]").filter("input[value=" + "${qna['lockYN']}" + "]").attr("checked", "checked");
                
            	// '목록' 버튼 이벤트
                $("#listBtn").click(function(event) {
                    formSubmit("sendForm", "post", listURL);
                });
                
                // '저장' 버튼 이벤트
                $("#saveBtn").click(function(event) {
                	event.preventDefault();

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
                    	$('#BUTTON_AREA').hide();
	                    var sendData = "qnaOid=" + "${searchVO['qnaOid']}&" + $("#qnaForm").serialize();
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
                &gt; <span style="color: #4869AE; font-weight: bold;">Q&A 수정</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>Q&A 수정</a>
                </div>
            </div>
            
            <form id="qnaForm" name="qnaForm" method="post">
            <table class="info_table_01" cellpadding="0" cellspacing="0">
                <colgroup>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                    <col style="width: 125px;"/>
                    <col style="width: 263px;"/>
                </colgroup>
                <tr>
                    <td class="subject_td_01">작성자</td>
                    <td class="content_td_01" style="border-right: 0px;">
                    <c:choose>
                    	<c:when test="${qna['creatorName'] == null}">
                    		${qna['answerName'] }
                    	</c:when>
                    	<c:otherwise>
                    		${qna['creatorName'] }
                    	</c:otherwise>
                    </c:choose>
                    </td>
                    <td class="content_td_01" style="border-right: 0px;">&nbsp;</td>
                    <td class="content_td_01" style="border-right: 0px;">&nbsp;</td>
                </tr>
                <tr>
                    <td class="subject_td_01">최종 수정자</td>
                    <td class="content_td_01" style="border-right: 0px;" colspan="3">
                        <input type="text" id="amenderName" name="amenderName" value="관리자" readonly="readonly"
                            class="input_text_01" style="width: 120px" />
                        <input type="hidden" id="amenderOid" name="amenderOid" value="1" />
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
                        <input type="text" id="subject" name="subject" maxlength="128" value="${qna['subject']}"
                            class="input_text_01" style="width: 90%;" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">내용</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <textarea id="content" name="content" style="width: 90%; height: 100px;">${qna['content']}</textarea>
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
                <input type="hidden" id="qnaOid" name="qnaOid" value="${searchVO['qnaOid']}" />
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