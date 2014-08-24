<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            var menuListGirdId = "menuListGird";
            createGridComponent(menuListGirdId, "MenuListGrid", 816, 400, "initMenuListGrid", "menuListGridClick");
            var menuListGrid = null;

            // 메뉴 관련 데이터 URL
            var menuListDataURL = "<c:url value="/portal/menu/list_data.do" />";
            var detailURL = "<c:url value="/portal/menu/detail.do" />";
            var editURL ="<c:url value="/portal/menu/edit.do" />";

            // 초기화
            $(document).ready(function() {
                // 등록 버튼 이벤트
                $("#registBtn").click(function(event) {
                    formSubmit("sendForm", "post", editURL);
                });
            });

            /********************************************************************************
             * 메뉴 목록 그리드 초기화
             ********************************************************************************/
            function initMenuListGrid() {
            	menuListGrid = swfobject.getObjectById(menuListGirdId);
                
                var header = [
                    {headerText: '메뉴 명', dataField: 'mnuName', width: '250', sortable: true, textAlign: 'left', editable: false},
                    {headerText: 'URL', dataField: 'mnuUrl', width: '306', sortable: false, textAlign: 'left', editable: false},
                    {headerText: '등록일', dataField: 'created', width: '120', sortable: false, textAlign: 'center', editable: false},
                    {headerText: '팝업', dataField: 'popYN', width: '70', sortable: false, textAlign: 'center', editable: false},
                    {headerText: '활성화', dataField: 'actYN', width: '70', sortable: false, textAlign: 'center', editable: false}
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
             * 메뉴 목록 그리드 Click Event Handler
             ********************************************************************************/
            function menuListGridClick(selectedItem, selectedRow, selectedCol, dataField) {
                if(dataField != "mnuName") {
                    $("#mnuOid").val(selectedItem.mnuOid);
                    formSubmit("sendForm", "post", detailURL);
                }
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
        <div id="TITLE_AREA">
            <div id="TITLE_TEXT">
                <img src="../../images/icon/icon_title.png" alt="" />
                메뉴 관리
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 포탈 관리 &gt; 메뉴 관리
                &gt; <span style="color: #4869AE; font-weight: bold;">메뉴 목록</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_0">
                <div class="sub_title_text_01">
                    <a>메뉴 목록</a>
                </div>
            </div>
	        
	        <div id="MenuListGrid"></div>
	        
	        <!-- 버튼 영역 ST. -->
	        <div class="button_outer_area_01">
	            <div class="button_inner_area_01">
	                <input type="button" id="registBtn" name="registBtn" class="regist_btn_b" />
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
    </body>
</html>