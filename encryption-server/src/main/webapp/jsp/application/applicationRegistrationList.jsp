
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../common/commonAttribute.jsp" %>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.application.ApplicationVO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	ArrayList<ApplicationVO> list = (ArrayList) request
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
	
	String y="y";
	String n="n";
	
%>
<script type="text/javascript">
function Confirmation(id, yn, nowpage) {
	if (confirm("변경하시겠습니까?")) {

		location.href = "./changeStatus.lo?application_id=" + id+"&yn=" + yn + "&page=" + nowpage;
	} else {
	}
}

function Cleaning(nowpage) {
	if (confirm("청소하시겠습니까?")) {

		location.href = "./cleaning.lo?page=" + nowpage;
	} else {
	}
}
</script>

<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>신청자목록</strong></h2>
		<div class="combine">
		<a href="javascript:Cleaning('<%=nowpage%>')"><b>기한초과자청소</b></a><br><br>
	
			<table summary="신청 내역 리스트" class="basic_brown">
				<colgroup>
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>신청중인 행사명(기간)</th>
						<th>신청자</th>
						<th>성별</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>신청인원수</th>
						<th>입금자명</th>
						<th>결제금액</th>
						<th>결제상태</th>
						<th>신청일</th>
						<th>결제상태변경</th>
						<th>동반자</th>
					</tr>
				</thead>
				<tbody>
				<%for (int i = 0; i < list.size(); i++) {ApplicationVO applicationVO = (ApplicationVO) list.get(i);%>
				
					<tr class="ac">
						<td><%=applicationVO.getProduct_title() %><p></p><%=applicationVO.getProduct_date() %></td>
						
						<td><%=applicationVO.getName() %></td>
						
						<td><%=applicationVO.getGender() %></td>
						
						<td><%=applicationVO.getAge() %></td>
						
						<td><%=applicationVO.getMsisdn() %></td>
						
						<td><%=applicationVO.getPersonnel() %></td>
						
						<td><%=applicationVO.getSender_name() %></td>
						
						<td><fmt:formatNumber value="<%=applicationVO.getProduct_price()*applicationVO.getPersonnel() +applicationVO.getOption_price() %>" type="number"/> 원
						<br><a href="./paymentDetail.lo?application_id=<%=applicationVO.getApplication_id() %>">결제정보</a>
						</td>
						
						<td><%if(applicationVO.getPayment_status().equals("y")){ %>결제완료<%}else{ %>미결제<%} %></td>
						
						<td><%=applicationVO.getApplication_date().split(" ")[0] %></td>
						
						<td><%if(applicationVO.getPayment_status().equals("y")){ %>
						
						<a href="javascript:Confirmation('<%=applicationVO.getApplication_id()%>','<%=n%>','<%=nowpage%>')"><font color=#0054FF>미결제로변경</font></a><%}else{ %>
						
						<a href="javascript:Confirmation('<%=applicationVO.getApplication_id()%>','<%=y%>','<%=nowpage%>')"><font color=#FF0000>결제완료로변경</font><%} %></a></td>
						
						<td><a href="./applicationFriend.lo?application_id=<%=applicationVO.getApplication_id() %>">동반자보기</a></td>
					</tr>
					<%}%>
					
				</tbody>
			</table>
			<div class="paging">
				
				<%if (nowpage <= 1) {%><a><span class="prev"></span></a>
				
				<%} else {%><a href="./applicationRegistrationList.lo?page=<%=nowpage - 1%>"><span class="prev"></span></a><%}%>
				
				<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%><a class="current"><%=a%></a>
				
				<%} else {%><a href="./applicationRegistrationList.lo?page=<%=a%>"><%=a%> </a><%}%><%}%>
				
				<%if (nowpage >= maxpage) {%><a><span class="next"></span></a>
				
				<%} else {%><a href="./applicationRegistrationList.lo?page=<%=nowpage + 1%>"><span class="next"></span></a></li><%}%>
					
					
			</div>
		</div>
	</div>
	<!-- //container -->