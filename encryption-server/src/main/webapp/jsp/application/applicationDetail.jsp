
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.application.OptionVO"%>
<%@ page import="kr.co.hitcom.rent.application.ApplicationVO"%>
<% 
	
	ApplicationVO applicationVO = (ApplicationVO) request.getAttribute("applicationVO");
	
	ArrayList<OptionVO> list = (ArrayList) request.getAttribute("optionList");


	int payment_price = applicationVO.getProduct_price();
%>


<script type="text/javascript">

	$(document).ready(function () {
	
//		$("#application").css('cursor', 'pointer');
//		$("#application").click(function() {
// 			var param = ${applicationVO.product_id} + "&personnel=" + $("#personnel option:selected").val();
// 			location.href= "./applicationPage.lo?product_id=" + param;
//			aplicationform.submit;
//		});
		$("#personnel").val("1");
		<%for (int i = 0; i < list.size(); i++) {%>
			 $('#quantity<%=i%>').val("0");
		<%}%>
		$("#total_price").val("<%=applicationVO.getProduct_price()%>");
		$("#total_price").number(true, 0);
		$("#productPrice").number(true, 0);
		<%for (int i = 0; i < list.size(); i++) {%>
		 $('#optionPrice<%=i%>').number(true, 0);
		<%}%>
	});

	var personnel = 1;
	<%for (int i = 0; i < list.size(); i++) {OptionVO optionVO = (OptionVO) list.get(i);%>
	var quantity<%=i%> = 0;
	<%}%>
	
	var total_price = <%=applicationVO.getProduct_price()%>

	function aplicationPage() {
		aplicationform.submit();
	}
	
	function personnel_add() {
		if(personnel == 6){
			alert("최대 신청인원은 6명입니다.");
		}else{
			 personnel +=1;
			 $('#personnel').val(personnel);
			 $('#total_price').val(total_price + <%=applicationVO.getProduct_price()%>);
			 total_price += <%=applicationVO.getProduct_price()%>
		}
	}
	
	function personnel_del() {
		
		if (personnel == 1){
		
		}else{
			personnel -=1;
			$('#personnel').val(personnel);
			$('#total_price').val(total_price - <%=applicationVO.getProduct_price()%>);
			total_price -= <%=applicationVO.getProduct_price()%>
		}
	}
	
	
	<%for (int i = 0; i < list.size(); i++) {OptionVO optionVO = (OptionVO) list.get(i);%>
	function quantity_add<%=i%>() {
		 quantity<%=i%> +=1;
		 $('#quantity<%=i%>').val(quantity<%=i%>);
		 $('#total_price').val(total_price + <%=list.get(i).getOption_price()%>);
		 total_price += <%=list.get(i).getOption_price()%>
	}
	<%}%>
	
	<%for (int i = 0; i < list.size(); i++) {OptionVO optionVO = (OptionVO) list.get(i);%>
	function quantity_del<%=i%>() {
		
		if (quantity<%=i%> == 0){
		
		}else{
			 quantity<%=i%> -=1;
			 $('#quantity<%=i%>').val(quantity<%=i%>);
			 $('#total_price').val(total_price - <%=list.get(i).getOption_price()%>);
			 total_price -= <%=list.get(i).getOption_price()%>
		}
		
	}
	<%}%>
	
</script>

<!-- container -->
<form action="./applicationPage.lo" enctype="multipart/form-data" method="post" name="aplicationform">
	<input type="hidden" name="product_id" value="${applicationVO.product_id}">	
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>${applicationVO.product_title}</strong></h2>
		<div class="combine multi_section">
			<!-- 좌측 이벤트 이미지 영역 -->
			<div class="section_L50"><img src="<spring:eval expression="@config['product.htmlPath']"/><c:out value='${applicationVO.product_mainimage_path}'/>" style="width:510px; height:651px;" alt="메인이미지" /></div>
			<!-- //좌측 이벤트 이미지 영역 -->

			<!-- 우측 상세 설명 영역 -->
			<div class="section_R50">
				<div class="ml50">
					<p class="info mb20">${applicationVO.product_content}</p>
					<table summary="행사 옵션 선택 영역" class="basic">
						<colgroup>
						<col width="25%" />
						<col width="20%" />
						<col width="20%" />
						<col width="5%" />
						<col width="25%" />
						<col width="5%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al">기본티켓</th>
								<td align="right"><b><span id="productPrice">${applicationVO.product_price}</span> 원</b></td>
								<td align="right"><b>수량</b></td>
								<td><img id="personnelDel" src="./images/sub/btn_del.gif" alt="삭제" class="row_delete" onclick="javascript:personnel_del()" /></td>
								<td><input id="personnel" name="personnel" type="text" value="1" class="gray" readonly="readonly"  style="text-align: right; width:95%; height:18px; float: left"/></td>
								<td><img id="personnelAdd" src="./images/sub/btn_add.gif" alt="추가" onclick="javascript:personnel_add()" /></td>
							</tr>
							
<%-- 							<%for (int i = 0; i < list.size(); i++) {OptionVO optionVO = (OptionVO) list.get(i);%> --%>
				
<!-- 							<tr> -->
<%-- 								<th class="al"><%=optionVO.getOption_name() %></th> --%>
<%-- 								<td align="right"><b><%=optionVO.getOption_price() %> 원</b></td> --%>
<!-- 								<td align="right"><b>수량</b></td> -->
<%-- 								<td><img src="./images/sub/btn_del.gif" alt="삭제" class="row_delete" onclick="javascript:quantity_del<%=i%>()" /></td> --%>
<%-- 								<td><input id="quantity<%=i%>" name="quantity" type="text" value="0" class="gray" readonly="readonly"  style="text-align: right; width:95%; height:18px; float: left"/></td> --%>
<%-- 								<td><img id="row_add" src="./images/sub/btn_add.gif" alt="추가" onclick="javascript:quantity_add<%=i%>()" /></td> --%>
							
<!-- 							</tr> -->
							
<%-- 							<%}%> --%>
							
							<c:forEach items="${optionList}" var="optionVO" varStatus="status">
							<tr> 
							   <th class="al">${optionVO.option_name}</th>
							   <td align="right"><b><span id="optionPrice${status.index}">${optionVO.option_price}</span> 원</b></td>  
							   <td align="right"><b>수량</b></td>
							   <td><img id="quantityDel" src="./images/sub/btn_del.gif" alt="삭제" class="row_delete" onclick="javascript:quantity_del${status.index}()" /></td>
							   <td><input id="quantity${status.index}" name="quantity" type="text" value="0" class="gray" readonly="readonly"  style="text-align: right; width:95%; height:18px; float: left"/></td>
							   <td><img id="quantityAdd" src="./images/sub/btn_add.gif" alt="추가" onclick="javascript:quantity_add${status.index}()" /></td>
							</tr>  
						    </c:forEach>
							
<!-- 							<tr> -->
<!-- 								<th class="al">가격</th> -->
<%-- 								<td><input id="productPrice" type="text" value="${applicationVO.product_price}"  disabled="disabled" class="gray" style="text-align: right; width:95%; height:18px; float: left"/>원</td> --%>
<!-- 							</tr> -->
<!-- 							<tr> -->
<!-- 								<th class="al">참가인원수</th> -->
<!-- 								<td> -->
<!-- 									<select id="personnel" style="width:100%;"> -->
<!-- 									<option value="1">1명</option> -->
<!-- 									<option value="2">2명</option> -->
<!-- 									<option value="3">3명</option> -->
<!-- 									<option value="4">4명</option> -->
<!-- 									</select> -->
<!-- 								</td> -->
<!-- 							</tr> -->
							<!-- TODO 옵션 향후 추가. 
							<tr>
								<th class="vt al">옵션</th>
								<td>
									<select class="max">
									<option>방사이즈</option>
									</select>
									<select class="max mt20">
									<option>기타</option>
									</select>
								</td>
							</tr>
							 -->
						</tbody>
					</table>
					<br>
					<hr size="1" color="#8C8C8C">
					<br><br>
					<table summary="행사 옵션 선택 영역" class="basic">
						<colgroup>
						<col width="70%" />
						<col width="25%" />
						<col width="5%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al">총결제금액</th>
								<td><input id="total_price" name="total_price" type="text" value="${applicationVO.product_price}" class="gray" readonly="readonly" style="text-align: right; width:95%; height:18px; float: left" /></td>
								<td><b>원</b></td>	
							</tr>
						</tbody>
					</table>		
					<p class="mt30 ac"><a href="javascript:aplicationPage()" class="ml10"><img id="application" src="${_ContextPath}/images/sub/btn_request_big.png" alt="신청하기" /></a></p>
				</div>
			</div>
			<!-- //우측 상세 설명 영역 -->
			<span class="detail"><img id="applicationText" src="<spring:eval expression="@config['product.htmlPath']"/><c:out value='${applicationVO.product_textimage_path}'/>" alt="규정" /></span>
			<span class="detail"><img id="application" src="<spring:eval expression="@config['product.htmlPath']"/><c:out value='${applicationVO.product_subimage_path}'/>" alt="서브이미지" /></span>
		</div>
	</div>
</form>	
	<!-- //container -->
