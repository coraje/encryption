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
	        var listURL = "<c:url value="/information/qna/list.do" />";
	        var modifyURL = "<c:url value="/information/qna/modify.do" />";
	        var replyURL = "<c:url value="/information/qna/edit.do" />";
	        var removeURL = "<c:url value="/information/qna/remove.do" />";
        
	        // 초기화..
            $(document).ready(function() {
				if($('#adminYN').val() == 'N'){
					$('#modifyBtn').hide();
					
				}
				                
                // '목록' 버튼 이벤트
                $("#listBtn").click(function(event) {
                    formSubmit("sendForm", "post", listURL);
                });

                // '답변' 버튼 이벤트
                $("#replyBtn").click(function(event) {
                    formSubmit("sendForm", "post", replyURL);
                });

                // '수정' 버튼 이벤트
                $("#modifyBtn").click(function(event) {
					formSubmit("sendForm", "post", modifyURL);
                });

                // '삭제' 버튼 이벤트
                $("#removeBtn").click(function(event) {
                    if(confirm("<spring:message code="adm.message.remove.confirm" />")) {
                        $("#BUTTON_AREA").hide();
                        
                        var sendData = "qnaOid=" + ${searchVO['qnaOid']};
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
                Q&A
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 정보 관리 &gt; Q&A
                &gt; <span style="color: #4869AE; font-weight: bold;">Q&A 상세</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    Q&A 상세
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
                    <td class="subject_td_01">No</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${qna['qnaOid']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">작성자</td>
                    <td class="content_td_01">
                    <c:choose>
                    	<c:when test="${qna['creatorName'] == null}">
                    		${qna['answerName'] }
                    	</c:when>
                    	<c:otherwise>
                    		${qna['creatorName'] }
                    	</c:otherwise>
                    </c:choose>
                    </td>
                    <td class="subject_td_01">등록일</td>
                    <td class="content_td_01" style="border-right: 0px;"> 
                        ${qna['created']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">공개 여부</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <c:choose>
					        <c:when test="${qna['lockYN'] eq 'Y'}">
					            공개
					        </c:when>
					        <c:otherwise>
					            비공개
					        </c:otherwise>
					    </c:choose>
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">제목</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        ${qna['subject']}
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_02">내용</td>
                    <td class="content_td_02" colspan="3" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                    </td>
                </tr>
            </table>
            
            <!-- 버튼 영역 ST. -->
            <div class="button_outer_area_01">
                <div class="button_inner_area_02">
                    <input type="button" id="listBtn" name="listBtn" class="list_btn_b" />
                </div>
                <div class="button_inner_area_03">
                    <input type="button" id="replyBtn" name="replyBtn" class="reply_btn_b" />
                    <input type="button" id="modifyBtn" name="modifyBtn" class="modify_btn_b" />
                    <input type="button" id="removeBtn" name="removeBtn" class="remove_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
            
            <form id="sendForm" name="sendForm">
                <input type="hidden" id="qnaOid" name="qnaOid" value="${searchVO['qnaOid']}" />
                <input type="hidden" id="subject" name="subject" value="${qna['subject']}" />
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
        <input type="hidden" id="adminYN" value="${qna['adminYN'] }" />
    </body>
</html>