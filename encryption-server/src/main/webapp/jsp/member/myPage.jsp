<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.member.MemberVO"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%  
	ArrayList<MemberVO> list = (ArrayList) request
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
	int reserve_fund = ((Integer) request.getAttribute("reserve_fund"))
			.intValue();
	
%>
<script>
var i=0;
function editMember() {
	i=i+1;
	if(i%2==1){
	$('table.mytable tr td[name="NoBackDetail"]').attr("style", "display:");
	}else{$('table.mytable tr td[name="NoBackDetail"]').attr("style", "display:none");
	}
}

function passwdConfirm() {
	if ($("#passwd").val() == "") {
		alert("비밀번호를 입력하세요");
		return;
	}
	
    $("#passConfirm").hide();
    
    var sendData = "passwd=" + $("#passwd").val();
    $.ajax({
        type : "post",
        url : passCheckURL,
        dataType : "JSON",
        data : sendData,
        success : function(data) {
            eval("var resultData = " + data);	                
            if (resultData == true) {
            	location.href="./informationModifyPage.lo?member_no=<c:out value="${SESSION_MEMBER_INFO.member_no }"/>";
            } else {
            	alert("비밀번호를 잘못 입력하셨습니다.");
            }
  
        },
        error : function(xhr, textStatus) {
            alert("체크 실패");
            
        }
    });
    $('#passConfirm').show();
}

var passCheckURL = "<c:url value='/passCheck.aj' />";
$(document).ready(function(){
	$('#passConfirm').css('cursor', 'pointer');
	$("#passConfirm").click(function(event) {
			
		passwdConfirm();
    });
	
	$("#passwd").keyup(function(e) {
		if (e.keyCode == 13) {
			passwdConfirm();
		}
	});
	
});
</script>
	<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>MY PAGE</strong></h2>
		<div class="combine">
			<h3 class="mb20"><img src="./images/sub/icon_check.png" class="mr10" alt="체크" />회원정보</h3>
			<strong class="mr10 ml20">[<c:out value="${SESSION_MEMBER_INFO.name }"/>]님의 마이페이지입니다.</strong><a href="javascript:editMember()"/><img src="./images/sub/btn_infoedit.png" alt="회원정보수정" /></a>
			<br><br>
			<table class="mytable">
			<tr><td name="NoBackDetail" style="display:none;"><strong class="mr10 ml20"><font color="#4374D9">개인정보 변경을 원하실 경우, 본인확인을 위해 비밀번호를 한 번 더 입력해 주세요.</font></strong></td><tr>
			</table>
			<table class="mytable">
			<colgroup>
				<col width="30%" />
				<col width="70%" />
				</colgroup>
			<tr><td name="NoBackDetail" style="display:none;"><strong class="mr10 ml20">비밀번호</strong></td><br>
			<td name="NoBackDetail" style="display:none;"><input id="passwd" name="passwd" type="password" class="med gray"  maxlength="20"/><a href="#" class="ml10" id="passConfirm" ><b>확인</b></a></td><tr>
			</table>


			<h3 class="mb20"><img src="./images/sub/icon_check.png" class="mr10" alt="체크" />신청내역</h3>
			<p class="impact mb20 ar">* 기한 경과로 취소처리된 행사는 다시 신청해주시기 바랍니다.</p>

			<table summary="신청 내역 리스트" class="basic_brown">
				<colgroup>
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
						<th>신청인원수</th>
						<th>결제금액</th>
						<th>결제정보</th>
						<th>결제상태</th>
						<th>행사진행상황</th>
						<th>후기작성</th>
					</tr>
				</thead>
				<tbody>
				<%for (int i = 0; i < list.size(); i++) {MemberVO memberVO = (MemberVO) list.get(i);%>
				
					<tr class="ac">
						<td><%=memberVO.getProduct_title() %><p></p><%=memberVO.getProduct_date() %></td>
						<td><%=memberVO.getPersonnel() %></td>
						<td><fmt:formatNumber value="<%=memberVO.getProduct_price()*memberVO.getPersonnel() + memberVO.getOption_price() %>" type="number"/> 원</td>
						<td><a href="./paymentDetail.lo?application_id=<%=memberVO.getApplication_id() %>"><b>확인</b></a></td>
						<td><%if(memberVO.getPayment_status().equals("y")){ %>결제확인<%}else if(memberVO.getPayment_status().equals("n")){ %>결제대기<%}else{ %>취소<%} %></td>									
						<td><%if(memberVO.getProgress().equals("a")){ %>진행예정
						<%}else if(memberVO.getProgress().equals("b")){ %>진행중
						<%}else if(memberVO.getProgress().equals("c")){ %>행사종료<%} %></td>
						<td><%if(memberVO.getReview_status().equals("y")){%>작성완료<%}else if(memberVO.getPayment_status().equals("y") && memberVO.getReview_status().equals("n")){ %><a href="./reviewRegistrationPage.lo?product_title=<%=memberVO.getProduct_title() %>&product_status=<%=memberVO.getProduct_status() %>&application_id=<%=memberVO.getApplication_id()%> "><img src="./images/sub/btn_writereview.png" alt="후기작성" /></a><%}%></td>
					</tr>
					
				<%}%>		
				</tbody>
			</table>
			<div class="paging">
				
				<%if (nowpage <= 1) {%><a><span class="prev"></span></a>
				
				<%} else {%><a href="./myPage.lo?page=<%=nowpage - 1%>"><span class="prev"></span></a><%}%>
				
				<%for (int a = startpage; a <= endpage; a++) {if (a == nowpage) {%><a class="current"><%=a%></a>
				
				<%} else {%><a href="./myPage.lo?page=<%=a%>" ><%=a%> </a><%}%><%}%>
				
				<%if (nowpage >= maxpage) {%><a><span class="next"></span></a>
				
				<%} else {%><a href="./myPage.lo?page=<%=nowpage + 1%>"><span class="next"></span></a></li><%}%>
			</div>

			<h3 class="mb20"><img src="./images/sub/icon_check.png" class="mr10" alt="체크" />사용가능한 적립금<span class="ml20 impact"><%=reserve_fund %>원</span></h3>
			<h3 class="mb20"><img src="./images/sub/icon_check.png" class="mr10" alt="체크" />계좌정보<span>&nbsp;&nbsp;우리은행 1005-502-160373 예금주: 주식회사히트콤</span></h3>
		</div>
	</div>
	<!-- //container -->