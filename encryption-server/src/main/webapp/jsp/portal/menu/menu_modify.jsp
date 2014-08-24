<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
        
        <style type="text/css">
        <!--
            #FRAME_AREA {
                border: 1px #000000 solid;
                position: absolute;
                top: 100px;
                left: 150px;
                display: none;
            }
        //-->
        </style>
        
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfobject.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfComponent.js"></script>
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
            var saveURL = "<c:url value="/portal/menu/update.do" />";
            var listURL = "<c:url value="/portal/menu/list.do" />";
        
            /********************************************************************************
             * 초기화
             ********************************************************************************/
            $(document).ready(function() {
                var parentOid = "${menu['parentOid']}";

                if(parentOid == "0") {
                	$("#top_level").attr("checked", "checked");
                    $("#PARENT_MENU").hide();
                    $("#parentMenuName").val("");
                    $("#parentOid").val("0");
                } else {
                	$("#sub_level").attr("checked", "checked");
                    $("#PARENT_MENU").show();
                    $("#parentMenuName").val("${menu['parentName']}");
                    $("#parentOid").val("${menu['parentOid']}");
                }

                $("input[name=popYN]").filter("input[value=" + "${menu['popYN']}" + "]").attr("checked", "checked");
                $("input[name=actYN]").filter("input[value=" + "${menu['actYN']}" + "]").attr("checked", "checked");
                
            	// 목록 버튼 클릭 이벤트
                $("#listBtn").click(function(event) {
                    formSubmit("sendForm", "post", listURL);
                });
                
                // 상위 메뉴 선택 이벤트
                $("input[name=menuLevel]").change(function(event) {
                    if($("#top_level").attr("checked")) {
                    	$("#PARENT_MENU").hide();
                    	$("#parentMenuName").val("");
                    	$("#parentOid").val("0");
                    	return;
                    }

                    if($("#sub_level").attr("checked")) {
                        $("#PARENT_MENU").show();
                        $("#parentMenuName").val("${menu['parentName']}");
                        $("#parentOid").val("${menu['parentOid']}");
                        return;
                    }
                });

                // 상위 메뉴 조회 버튼 클릭 이벤트
                $("#searchBtn").click(function() {
                    $("#FRAME_AREA").show();
                });
                
                // 저장 버튼 클릭 이벤트
                $("#saveBtn").click(function(event) {
                	event.preventDefault();

                	if($.trim($("#mnuName").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="메뉴 명" />");
                        $("#mnuName").val("");
                        $("#mnuName").focus();
                        return;
                    }

                	if($.trim($("#mnuUrl").val()) == "") {
                        alert("<spring:message code="adm.warn.input.required" arguments="URL" />");
                        $("#mnuUrl").val("${menu['mnuUrl']}");
                        $("#mnuUrl").focus();
                        return;
                    }

                	if($("#sub_level").attr("checked")) {
                    	var parentOid = $("#parentOid").val();
                    	if(parentOid == "0" || parentOid == "") {
                    		alert("<spring:message code="adm.warn.option.selected" arguments="상위 메뉴" />");
                    		$("#parentMnuName").focus();
                    		return;
                    	}
                	}
                    if(confirm("<spring:message code="adm.message.modify.confirm" />")){
	                	$("#BUTTON_AREA").hide();
	                	var sendData = "mnuOid=" + "${menu['mnuOid']}&" + $("#menuForm").serialize();
	
	                	$.ajax({
	                        type : "post",
	                        url : saveURL,
	                        dataType : "html",
	                        data : sendData,
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
                    }
                });
            });

            /********************************************************************************
             * 상위 메뉴 선택 창 감추기
             ********************************************************************************/
            function hiddenFraemArea() {
                $("#FRAME_AREA").hide();
            }

            /********************************************************************************
             * 상위 메뉴 설정
             ********************************************************************************/
            function setParentMenu(parentOid, parentMenuName) {
                $("#parentOid").val(parentOid);
                $("#parentMenuName").val(parentMenuName);
                hiddenFraemArea();
            }
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
                &gt; <span style="color: #4869AE; font-weight: bold;">메뉴 수정</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>메뉴 수정</a>
                </div>
            </div>
            
            <form id="menuForm" name="menuForm">
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
                        <input type="text" id="creatorName" name="creatorName" value="${menu['creatorName']}" 
                            readonly="readonly" class="input_text_01" style="width: 120px" />
                    </td>
                    <td class="subject_td_01">상위 메뉴 선택</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="radio" id="top_level" name="menuLevel" value="Y" checked="checked" />
                        <label for="top_level" style="cursor: pointer">최 상위 메뉴</label>
                        <input type="radio" id="sub_level" name="menuLevel" value="N" />
                        &nbsp;
                        <label for="sub_level" style="cursor: pointer">메뉴 선택</label>
                        <div id="PARENT_MENU" style="display: none;">
                            <input type="text" id="parentMenuName" name="parentMenuName" value="${menu['parentName']}"
                                readonly="readonly" class="input_text_01" style="width: 150px;" />
                            <input type="button" id="searchBtn" name="searchBtn" class="search_btn_s" />
                        </div>
                        <input type="hidden" id="parentOid" name="parentOid" value="${menu['parentOid']}" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">메뉴 명</td>
                    <td class="content_td_01">
                        <input type="text" id="mnuName" name="mnuName" maxlength="16" value="${menu['mnuName']}"
                            class="input_text_01" style="width: 80%;" />
                    </td>
                    <td class="subject_td_01">순서</td>
                    <td class="content_td_01" style="border-right: 0px;">
                        <input type="text" id="mnuOrder" name="mnuOrder" maxlength="3" value="${menu['mnuOrder']}"
                            class="input_text_01" style="width: 25px;" />
                    </td>
                </tr>
                <tr>
                    <td class="subject_td_01">URL</td>
                    <td class="content_td_01" colspan="3" style="border-right: 0px;">
                        <input type="text" id="mnuUrl" name="mnuUrl" value="${menu['mnuUrl']}"
                            class="input_text_01" style="width: 80%;" />
                    </td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td class="subject_td_02">팝업 여부</td>
                    <td class="content_td_02">
                        <input type="radio" id="popY" name="popYN" value="Y" checked="checked" />
                        <label for="actY">팝업</label>
                        &nbsp;
                        <input type="radio" id="popN" name="popYN" value="N" />
                        <label for="actN">페이지</label>
                    </td>
                    <td class="subject_td_02">활성화 여부</td>
                    <td class="content_td_02" style="border-right: 0px; padding: 5px 0px 5px 5px;">
                        <input type="radio" id="actY" name="actYN" value="Y" checked="checked" />
                        <label for="actY">활성화</label>
                        &nbsp;
                        <input type="radio" id="actN" name="actYN" value="N" />
                        <label for="actN">비 활성화</label>
                    </td>
                </tr>
            </table>
            </form>
             
            <!-- 버튼 영역 ST. -->
            <div class="button_outer_area_01">
                <div class="button_inner_area_02">
                    <input type="button" id="listBtn" name="listBtn" class="list_btn_b" />
                </div>
                <div class="button_inner_area_03">
                    <input type="button" id="saveBtn" name="saveBtn" class="save_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
            
            <form id="sendForm" name="sendForm">
                <input type="hidden" id="mnuOid" name="mnuOid" />
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="포탈 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="7" />
                <input type="hidden" id="subMenu" name="subMenu" value="1" />
            </form>
        </div>
        
        <div id="FRAME_AREA">
            <iframe src="<c:url value="/portal/menu/list_pop.do" />" style="width: 500px; height: 370px;" name="menuSelectFrame" frameborder="no" src="htmledit.htm" scrolling="no" />
        </div>
    </body>
</html>