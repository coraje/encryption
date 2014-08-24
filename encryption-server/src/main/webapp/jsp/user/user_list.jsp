<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub_form.css" />
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/paging.css" />
        
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfobject.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/swfComponent.js"></script>
        <script language="javascript" type="text/javascript" src="${_ContextPath}/js/paging.js"></script>
        
        <!-- JavaScript -->
        <script language="javascript" type="text/javascript">
        <!--
            // 페이징 객체
	        var _Paging = Paging.prototype;
	        var curPage = ${searchVO['curPage']};
	        var pagingSize = <spring:message code="paging.rowSize" />;
	        var groupSize = <spring:message code="paging.groupSize" />;
        
	        var userListGirdId = "UserListGrid";
	        createGridComponent(userListGirdId, "UserListGrid", 816, 380, "initUserListGrid", "userListGridClick");
	        var userListGrid = null;
	
	        // 고객 관리 관련 데이터 URL
	        var userListDataURL = "<c:url value="/portal/user/list_data.do" />";
	        var detailURL = "<c:url value="/portal/user/detail.do" />";
	        var editURL = "<c:url value="/portal/user/edit.do" />";
	        var totalRowURL = "<c:url value="/portal/user/total_row.do" />";

	        // 초기화..
            $(document).ready(function() {
                initSearchForm();
                
                // 페이지 초기화 : Paging(Page Size, Page Group Size);
                _Paging.initialize(pagingSize, groupSize);

                // 등록 버튼 이벤트
                $("#registBtn").click(function(event) {
                    formSubmit("sendForm", "post", editURL);
                });
                
                // 검색 버튼 이벤트
                $("#searchBtn").click(function(event) {
                    // setSearchData();
                    // setNoticeListData(1);
                });
            });

            function initSearchForm() {
                $("#rowSize").val(pagingSize);
                $("#groupSize").val(groupSize);
                $("#sKeywordType > option[value="+ "${searchVO['keywordType']}" +"]").attr("selected", "true");
                $("#sKeyword").val("${searchVO['keyword']}");
            }
            
	        /********************************************************************************
	         * 고객 관리 목록 그리드 초기화
	         ********************************************************************************/
	        function initUserListGrid() {
	            userListGrid = swfobject.getObjectById(userListGirdId);
	            
	            var header = [
                    {headerText: 'No.', dataField: 'usrOid', width: '56', sortable: true, textAlign: 'right', editable: false},
	                {headerText: '가입자명', dataField: 'usrName', width: '100', sortable: true, textAlign: 'center', editable: false},
	                {headerText: '가입사명', dataField: 'comName', width: '100', sortable: false, textAlign: 'center', editable: false},
	                {headerText: 'ID', dataField: 'loginId', width: '100', sortable: false, textAlign: 'left', editable: false},
	                {headerText: 'E-Mail', dataField: 'email', width: '160', sortable: false, textAlign: 'center', editable: false},
	                {headerText: '연락처', dataField: 'mobile', width: '120', sortable: false, textAlign: 'center', editable: false},
	                {headerText: '가입일', dataField: 'created', width: '100', sortable: false, textAlign: 'center', editable: false},
	                {headerText: '활성화', dataField: 'actYN', width: '80', sortable: false, textAlign: 'center', editable: false}
	            ];
	
	            userListGrid.setHeader(header);
	            userListGrid.setVisibleCountBox(false);
	
	            setUserListData(curPage);
	        }
	
	        /********************************************************************************
	         * 고객 관리 목록 그리드 Click Event Handler
	         ********************************************************************************/
	        function userListGridClick(selectedItem, selectedRow, selectedCol, dataField) {
	        	$("#usrOid").val(selectedItem.usrOid);
                formSubmit("sendForm", "post", detailURL);
	        }
	
	        /********************************************************************************
	         * 고객 관리 목록 그리드 데이터 셋팅
	         ********************************************************************************/
	        function setUserListData(cPage) {
	        	$("#curPage").val(cPage);
                var sendData = $('#sendForm').serialize();

                // 총 Row 수를 구한다.
                var totalRow = countRow(totalRowURL, sendData);

                if(totalRow < 0) {
                    alert("<spring:message code="adm.error.loading.fail" />");
                    return;
                }
                
                // 페이징 설정
                _Paging.setPaging(cPage, totalRow, "#PAGING_AREA", "goPage");

                // 현재 페이지 보정
                $("#curPage").val(_Paging.cPage);

	            var params = $('#sendForm').serializeObject();

	            // 데이터 조회
	            userListGrid.sendRequest(userListDataURL, params);
	        }

	        /********************************************************************************
             * 페이징 함수
             ********************************************************************************/
            function goPage(pn) {
                setUserListData(pn);
            }
	    //-->
        </script>
    </head>
    <body>
        <div id="TITLE_AREA">
            <div id="TITLE_TEXT">
                <img src="../../images/icon/icon_title.png" alt="" />
                고객 관리
            </div>
            <div id="NAVI_TEXT">
                <img src="../../images/icon/icon_home.gif" alt="" />
                &gt; 포탈 관리 &gt; 고객 관리
                &gt; <span style="color: #4869AE; font-weight: bold;">고객 목록</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_1">
                <div class="sub_title_text_01">
                    <a>고객 목록</a>
                </div>
	            <form id="searchForm" name="searchForm" onsubmit="return false;">
	                <div class="search_01">
	                    <a>고객명 : </a>
	                    <input type="text" id="id" name="name" class="input_text_01" style="width: 106px;" />
	                    <a>고객사 : </a>
	                    <input type="text" id="id" name="name" class="input_text_01" style="width: 130px;" />
	                    <input type="button" id="id" name="name" class="search_btn_s" onclick="" />
	                </div>
	            </form>                
            </div>
            
            
            
            <!-- Grid 영역 ST. -->
            <div id="UserListGrid"></div>
            
            <!-- PAGING 영역 ST. -->
            <div id="PAGING_AREA" class="paging_area_01"></div>
            <!-- PAGING 영역 ED. -->
            
            <!-- 버튼 영역 ST. -->
            <div class="button_outer_area_01">
                <div class="button_inner_area_01">
                    <input type="button" id="registBtn" name="registBtn" class="regist_btn_b" />
                </div>
            </div>
            <!-- 버튼 영역 ED. -->
            
            <form id="sendForm" name="sendForm">
                <input type="hidden" id="usrOid" name="usrOid" />
                <input type="hidden" id="curPage" name="curPage" />
                <input type="hidden" id="rowSize" name="rowSize" />
                <input type="hidden" id="groupSize" name="groupSize" />
                <input type="hidden" id="keywordType" name="keywordType" value="${searchVO['keywordType']}"/>
                <input type="hidden" id="keyword" name="keyword" value="${searchVO['keyword']}"/>
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="고객 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="7" />
                <input type="hidden" id="subMenu" name="subMenu" value="3" />
            </form>
        </div>
    </body>
</html>