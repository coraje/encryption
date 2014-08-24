<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.hitcom.rent.notice.NoticeVO"%>
<%@ page import="kr.co.hitcom.rent.common.UtilMgr"%>
<%
	NoticeVO noticeVO = (NoticeVO) request
			.getAttribute("noticeVO");
		
	UtilMgr utilMgr = new UtilMgr();
%>

<script type="text/javascript">
	function Confirmation(id) {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./noticeDelete.lo?notice_id=" + id;
		} else {
		}
	}
</script>

	<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>공지사항</strong></h2>
		<div class="combine">

			<table summary="공지사항" class="basic_brown">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>	
				
				<thead>
					<tr><th><div align="center"><%=noticeVO.getNotice_title() %></div></th></tr>
				</thead>
				
				<tbody>
					<tr class="ac"><td><div align="right"><b>글쓴이</b>&nbsp;&nbsp;관리자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>등록일</b>&nbsp;&nbsp;<%=noticeVO.getRegistration_date().split(" ")[0] %></div></td></tr>
					<tr class="ac"><td><div align="left">
					<%=utilMgr.getContent(noticeVO.getNotice_content()) %></div></td></tr>
				</tbody>
			</table>
			<br>
			<a href="javascript:history.go(-1)"><font color=#740000><b>이전페이지</b></font></a>&nbsp;&nbsp;</td>
		<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
	
				<a href="./noticeModifyPage.lo?notice_id=<%=noticeVO.getNotice_id()%>">변경</a>&nbsp;&nbsp; 
				
				<a href="javascript:Confirmation('<%=noticeVO.getNotice_id()%>')"><font
									color=#FF8224>삭제</font> </a>
					</c:if>

		</div>
	</div>
	<!-- //container -->