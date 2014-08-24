
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.inquiry.InquiryVO"%>
<%
	ArrayList<InquiryVO> list = (ArrayList) request
			.getAttribute("list");
	int listcount = ((Integer) request.getAttribute("listcount"))
			.intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	int maxpage = ((Integer) request.getAttribute("maxpage"))
			.intValue();
	int startpage = ((Integer) request.getAttribute("startpage"))
			.intValue();
	int endpage = ((Integer) request.getAttribute("endpage"))
			.intValue();
	
%>




<!-- container -->
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>Q&A</strong>
	</h2>
	<div class="combine">
		<c:if test="${SESSION_MEMBER_INFO != null && SESSION_MEMBER_INFO.member_id != null }" > 
		<p class="ar mb20"><a href="./inquiryRegistrationPage.lo" class="ml10"><img src="./images/sub/btn_write.png" alt="글쓰기" /></a></p>
		</c:if>
		<table summary="후기 리스트 영역" class="basic_list">
			<colgroup>
			
				<col width="10%" />
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
		
			</colgroup>
			
			<thead>
				<tr>
					<th>NO</th>
					<th>TITLE</th>
					<th>NAME</th>
					<th>등록일</th>
			
				</tr>
			</thead>
			<tbody>
				
				<%for (int i = 0; i < list.size(); i++) {InquiryVO inquiryVO = (InquiryVO) list.get(i);%>
				
				<tr>
					<td><%=inquiryVO.getInquiry_id() %></td>
					
					<td><div align="left"><%if (inquiryVO.getRe_lev() != 0) {%><%for (int a = 0; a <= inquiryVO.getRe_lev() * 2; a++) {%>&nbsp;<%}%><%} else {%><%}%>
					<a href="./inquiryDetail.do?inquiry_id=<%=inquiryVO.getInquiry_id()%>"><%=inquiryVO.getInquiry_subject() %></a></div></td>
					<td><%=inquiryVO.getName()%></td>
					<td><%=inquiryVO.getRegistration_date().split(" ")[0]%></td>
				
				</tr>
				
				<%}%>
				
			</tbody>
		</table>

		<div class="paging">
				<%if (nowpage <= 1) {%><a><span class="prev"></span></a>
				
				<%} else {%><a href="./inquiryList.do?page=<%=nowpage - 1%>"><span class="prev"></span></a><%}%>
				
				<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%><a class="current"><%=a%></a>
				
				<%} else {%><a href="./inquiryList.do?page=<%=a%>"><%=a%> </a><%}%><%}%>
				
				<%if (nowpage >= maxpage) {%><a><span class="next"></span></a>
				
				<%} else {%><a href="./inquiryList.do?page=<%=nowpage + 1%>"><span class="next"></span></a></li><%}%>
		</div>
	</div>
</div>
<!-- //container -->