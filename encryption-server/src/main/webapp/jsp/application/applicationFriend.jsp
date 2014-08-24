<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.application.ApplicationVO"%>
<%
	ArrayList<ApplicationVO> list = (ArrayList) request
			.getAttribute("list");
	
%>


	<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>동반자목록</strong></h2>
		<div class="combine">
			<table summary="동반자 리스트" class="basic_brown">
				<colgroup>
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
		
				</colgroup>
				<thead>
					<tr>
						<th>이름</th>
						<th>성별</th>
						<th>나이</th>
						<th>전화번호</th>
				
					</tr>
				</thead>
				<tbody>
	
				<%for (int i = 0; i < list.size(); i++) {ApplicationVO applicationVO = (ApplicationVO) list.get(i);%>
				
					<tr class="ac">
						<td><%=applicationVO.getFriend_name() %></td>
					    <td><%=applicationVO.getFriend_gender() %></td>
						<td><%=applicationVO.getFriend_age() %></td>
						<td><%=applicationVO.getFriend_msisdn() %></td>
					</tr>
				<%}%>
				
				</tbody>
			</table>
		</div>
	</div>
	<!-- //container -->