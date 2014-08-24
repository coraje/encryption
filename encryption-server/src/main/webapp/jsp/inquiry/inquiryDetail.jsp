<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.hitcom.rent.inquiry.InquiryVO"%>
<%@ page import="kr.co.hitcom.rent.common.UtilMgr"%>
<%
InquiryVO inquiryVO = (InquiryVO) request
			.getAttribute("inquiryVO");

UtilMgr utilMgr = new UtilMgr();
%>

<script type="text/javascript">
	function Confirmation(id,member_id) {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./inquiryDelete.lo?inquiry_id=" + id+"&member_id="+member_id;
		} else {
		}
	}
</script>

	<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>Q&A</strong></h2>
		<div class="combine">

			<table summary="공지사항" class="basic_brown">
				<colgroup>
					<col width="20%" />
					<col width="80%" />
				</colgroup>	
							
				<thead>
					<tr><th><div align="center"><%=inquiryVO.getInquiry_subject() %></div></th></tr>
				</thead>
				
				<tbody>
					<tr class="ac"><td><div align="right"><b>글쓴이</b>&nbsp;&nbsp;<%=inquiryVO.getName() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<b>등록일</b>&nbsp;&nbsp;<%=inquiryVO.getRegistration_date().split(" ")[0] %></div></td></tr>
					<tr class="ac"><td><div align="left">
					<%=utilMgr.getContent(inquiryVO.getInquiry_content()) %></div></td></tr>
				</tbody>
			</table>
			<br>
			<a href="javascript:history.go(-1)"><font color=#740000><b>이전페이지</b></font></a>&nbsp;&nbsp;</td>
		
		<c:if test="${SESSION_MEMBER_INFO.member_id == memberid || SESSION_MEMBER_INFO.isadmin == 'ADMIN' }" >	
			<a href="./inquiryModifyPage.lo?inquiry_id=<%=inquiryVO.getInquiry_id()%>&member_id=<%=inquiryVO.getMember_id()%>"><b>변경</b></a>&nbsp;&nbsp; 
			<a href="javascript:Confirmation('<%=inquiryVO.getInquiry_id()%>','<%=inquiryVO.getMember_id()%>')"><font color=#FF8224><b>삭제</b></font> </a>&nbsp;&nbsp;
		</c:if>
	
		<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
				<a href="./answerRegistrationPage.lo?inquiry_id=<%=inquiryVO.getInquiry_id()%>">답글</a>&nbsp;&nbsp; 					
		</c:if>

		</div>
	</div>
	<!-- //container -->