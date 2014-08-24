<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.application.ApplicationVO"%>
<%@ page import="kr.co.hitcom.rent.application.OptionVO"%>
<%
	ApplicationVO applicationVO = (ApplicationVO) request.getAttribute("applicationVO");
	ArrayList<OptionVO> list = (ArrayList) request.getAttribute("list");
	
%>

<script type="text/javascript">

	$(document).ready(function () {
		<%for (int i = 0; i < list.size(); i++) {OptionVO optionVO = (OptionVO) list.get(i);%>
		$("#option_price<%=i%>").number(true, 0);
		<%}%>
		$("#product_price").number(true, 0);
	});
	
</script>

	<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>결제정보</strong></h2>
		<div class="combine">
			<table summary="결제정보" class="basic_brown">
				<colgroup>
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
		
				</colgroup>
				<thead>
					<tr>
						<th>상품옵션</th>
						<th>가격</th>
						<th>수량</th>
				
					</tr>
				</thead>
				<tbody>
							<tr class="ac">
								<td>기본티켓</td><td><span  id="product_price"><%=applicationVO.getProduct_price() %></span> 원</td><td><%=applicationVO.getPersonnel() %></td>
							</tr>			
						<%for (int i = 0; i < list.size(); i++) {OptionVO optionVO = (OptionVO) list.get(i);%>
							<tr class="ac">
								<td><%=optionVO.getOption_name() %></td><td><span id="option_price<%=i%>"><%=optionVO.getOption_price() %></span> 원</td><td><%=optionVO.getQuantity() %></td>
							</tr>
						<%}%>
					
				</tbody>
			</table>
		</div>
	</div>
	<!-- //container -->