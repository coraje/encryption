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
            
            var qnaListGridId = "qnaListGrid";
            createGridComponent(qnaListGridId, "QnaListGrid", 816, 228, "initQnaListGrid", "qnaListGridClick");
            var qnaListGrid = null;

            // QnA 관련 데이터 URL
            var qnaListDataURL = "<c:url value="/information/qna/list_data.do" />";
            var detailURL = "<c:url value="/information/qna/detail.do" />";
            var editURL = "<c:url value="/information/qna/edit.do" />";
            var totalRowURL = "<c:url value="/information/qna/total_row.do" />";

            // 초기화..
            $(document).ready(function() {
                initSearchForm();
                
                // 페이지 초기화 : Paging(Page Size, Page Group Size);
                _Paging.initialize(pagingSize, groupSize);

                // 등록 버튼 이벤트
                $("#registBtn").click(function(event) {
                    $("#qnaOid").val(0);
                    formSubmit("sendForm", "post", editURL);
                });
                
                // 검색 버튼 이벤트
                $("#searchBtn").click(function(event) {
                    setSearchData();
                    setQnaListData(1);
                });
            });

            function initSearchForm() {
                $("#rowSize").val(pagingSize);
                $("#groupSize").val(groupSize);
                $("#sKeywordType > option[value="+ "${searchVO['keywordType']}" +"]").attr("selected", "true");
                $("#sKeyword").val("${searchVO['keyword']}");
            }

            /********************************************************************************
             * QnA 목록 그리드 초기화
             ********************************************************************************/
            function initQnaListGrid() {
            	qnaListGrid = swfobject.getObjectById(qnaListGridId);
                
                var header = [
                    {headerText: 'No.', dataField: 'qnaOid', width: '56', sortable: true, textAlign: 'center', editable: false},
                    {headerText: '제목', dataField: 'subject', width: '500', sortable: false, textAlign: 'left', editable: false},
                    {headerText: '작성자', dataField: 'creatorName', width: '100', sortable: false, textAlign: 'center', editable: false},
                    {headerText: '등록일', dataField: 'created', width: '110', sortable: false, textAlign: 'center', editable: false},
                    {headerText: '공개 여부', dataField: 'lockYN', width: '100', sortable: false, textAlign: 'center', editable: false}
                ];

                qnaListGrid.setHeader(header);
                qnaListGrid.setVisibleCountBox(false);

                setQnaListData(curPage);
            }

            /********************************************************************************
             * QnA 목록 그리드 Click Event Handler
             ********************************************************************************/
            function qnaListGridClick(selectedItem, selectedRow, selectedCol, dataField) {
                $("#qnaOid").val(selectedItem.qnaOid);
                formSubmit("sendForm", "post", detailURL);
            }

            /********************************************************************************
             * QnA 목록 그리드 데이터 셋팅
             ********************************************************************************/
            function setQnaListData(cPage) {
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
                qnaListGrid.sendRequest(qnaListDataURL, params);
            }

            /********************************************************************************
             * 검색 데이터를 복사 한다.
             ********************************************************************************/
            function setSearchData() {
                $('#keywordType').val($('#sKeywordType').val());
                $('#keyword').val($('#sKeyword').val());
            }
            
            /********************************************************************************
             * 페이징 함수
             ********************************************************************************/
            function goPage(pn) {
                setQnaListData(pn);
            }
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
                &gt; <span style="color: #4869AE; font-weight: bold;">Q&A 목록</span>
            </div>
        </div>
        
        <div id="CONTENT_BODY_AREA">
            <div class="sub_title_area_01_1">
                <div class="sub_title_text_01">
                    <a>Q&A 목록</a>
                </div>
                <form id="searchForm" name="searchForm" onsubmit="return false;">
	                <div class="search_01">
	                     구분 :
	                    <select id="sKeywordType" name="sKeywordType">
	                        <option value="">선택 하세요.</option>
	                        <option value="subject">제목</option>
	                        <option value="content">내용</option>
	                        <option value="both">제목 + 내용</option>
	                    </select>
	                    <input type="text" id="sKeyword" name="sKeyword" maxlength="10" 
	                       class="input_text_01" style="width: 180px;" />
	                    <input type="button" id="searchBtn" name="searchBtn" class="search_btn_s" />
	                </div>
	            </form>
            </div>
	        
	        <!-- Grid 영역 ST. -->
	        <div id="QnaListGrid">
	        <table>
	        <c:forEach var="qnaInfo" items="${qnaList}">
	        		<tr>
	        			<td>
	        				<c:out value="${qnaInfo['creatorName']}" />
	        			</td>
	        		</tr>
	        </c:forEach>
	        </table>
	        
	        </div>
	        
	        <!-- PAGING 영역 ST. -->
	        <div id="PAGING_AREA" class="paging_area_01"></div>
	        <!-- PAGING 영역 ED. -->
	        
	        <!-- 버튼 영역 ST. -->
	        <!-- 
	        <div class="button_outer_area_01">
                <div class="button_inner_area_01">
                    <input type="button" id="registBtn" name="registBtn" class="regist_btn_b" />
                </div>
            </div>
             -->
	        <!-- 버튼 영역 ED. -->
	        
	        <form id="sendForm" name="sendForm">
                <input type="hidden" id="qnaOid" name="qnaOid" />
                <input type="hidden" id="curPage" name="curPage" />
                <input type="hidden" id="rowSize" name="rowSize" />
                <input type="hidden" id="groupSize" name="groupSize" />
                <input type="hidden" id="keywordType" name="keywordType" value="${searchVO['keywordType']}"/>
                <input type="hidden" id="keyword" name="keyword" value="${searchVO['keyword']}"/>
                <input type="hidden" id="mainMenuText" name="mainMenuText" value="정보 관리" />
                <input type="hidden" id="mainMenu" name="mainMenu" value="6" />
                <input type="hidden" id="subMenu" name="subMenu" value="4" />
            </form>
        </div>
    </body>
</html>