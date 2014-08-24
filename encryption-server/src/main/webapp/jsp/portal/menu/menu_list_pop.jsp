<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <!-- CSS Style Sheet import -->
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_pop.css" />
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_pop_body.css" />
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
    
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfobject.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfComponent.js"></script>
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
            var menuListGirdId = "menuListGird";
            createGridComponent(menuListGirdId, "MenuListGrid", 500, 300, "initMenuListGrid", null);
            var menuListGrid = null;

            var menuListDataURL = "<c:url value="/portal/menu/list_data.do" />";
            
            // 초기화..
            $(document).ready(function() {
            	// 닫기 버튼 이벤트
                $("#closeBtn").click(function(event) {
                    parent.hiddenFraemArea();
                });

                // 선택 버튼 이벤트
            	$("#selectBtn").click(function(event) {
            		var selectedItem = menuListGrid.getCurrentSelectedItem();

            		if(selectedItem == null) {
                		alert("<spring:message code="adm.warn.option.selected" arguments="메뉴" />");
                		return;
            		}

            		parent.setParentMenu(selectedItem.mnuOid, selectedItem.mnuName);
                });
            });
            
            /********************************************************************************
             * 메뉴 목록 그리드 초기화
             ********************************************************************************/
            function initMenuListGrid() {
                menuListGrid = swfobject.getObjectById(menuListGirdId);
                
                var header = [
                    {headerText: '메뉴 명', dataField: 'mnuName', width: '150', sortable: false, textAlign: 'left', editable: false},
                    {headerText: 'URL', dataField: 'mnuUrl', width: '366', sortable: false, textAlign: 'left', editable: false}
                ];

                menuListGrid.setHeader(header);
                menuListGrid.setVisibleCountBox(false);

                // Tree 형태로 보이게 하기 위한 설정, 모든 파라미터 필수
                // setTreeViewMode('unique한 필드명', '상위 데이터 필드명', '최상위 기준 값');
                menuListGrid.setTreeViewMode("mnuOid", "parentOid", 0);

                // 데이터 로딩 완료 후 이벤트 설정
                menuListGrid.setDataLoadingCompleteFunction("loadingCompleteGrid");
                setMenuListData();
            }
            
            /********************************************************************************
             * 메뉴 목록 그리드 데이터 셋팅
             ********************************************************************************/
            function setMenuListData() {
                // 데이터 검색
                var params = new Object();
                menuListGrid.sendRequest(menuListDataURL, params);
            }

            /********************************************************************************
             * 그리드에 데이터 로딩 완료 후 이벤트
             ********************************************************************************/
            function loadingCompleteGrid() {
            	menuListGrid.expandAll();
            }
        //-->
        </script>
    </head>
    <body>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01">
                <div class="sub_title_text_01">
                    <a>메뉴 선택</a>
                </div>
                <div class="close_button_area">
                    <input type="button" id="closeBtn" name="closeBtn" class="pop_close_btn" />
                </div>                
            </div>
            
            <div id="MenuListGrid"></div>
            
            <!-- 버튼 영역 ST. -->
            <div class="button_outer_area_01">
                <div class="button_inner_area_01">
                    <input type="button" id="selectBtn" name="selectBtn" class="choice_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
        </div>
        
    </body>
</html>