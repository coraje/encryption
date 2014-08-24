<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<link rel="stylesheet" type="text/css" href="${_ContextPath}/css/jquery.ptTimeSelect.css" />
<script type="text/javascript" src="${_ContextPath}/js/jquery.ptTimeSelect.js"></script>
<script>

function register() {
    $.ajax({
        type : "post",
        url : "<c:url value='/policyAC.aj'/>",
        dataType : "html",
        data : $("#policyACform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("success");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#policyACform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	$("#register").click(function(event) {
			register();			
	});
	$(function() {
		  $("#datepickerStart").datepicker();
	});
	$(function() {
		  $("#datepickerEnd").datepicker();
	});
	$(function() {
		  $('#ptTimeStart').ptTimeSelect();
	});
	$(function() {
		  $('#ptTimeEnd').ptTimeSelect();
	});
});
</script>

<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
							
					<li><a href="./globalPolicyPage.do"><h1>글로벌암호정책설정</h1></a></li>
					<li><a href="./columnPolicyPage.do"><h1>컬름별암호정책설정</h1></a></li>
					<li><a href="./keyMakePage.do"><h1>암호키생성</h1></a></li>
					<li><a href="./kekMakePage.do"><h1>키암호키생성</h1></a></li>
					<li><a href="./policyACPage.do"><h1>정책기반접근제어</h1></a></li>
					<li><a href="./behaviorACPage.do"><h1>행위기반접근제어</h1></a></li>

				</ul>
			</div>
		</div>
		<div class="span8">
			<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
				<div class="combine">
				<form action="./policyAC.aj" method="post" id="policyACform" name="policyACform">
					<table summary="신청 상세 내역 영역입니다." class="basic">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 접속 IP</th>
								<td>
								<input type="text" class="med gray" name="connect_ip" />
								<select class="ml10" >
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
								</select>
								</td>
								
							</tr>
							<tr>
								<th class="al"> DB USER</th>
								<td>
								<input type="text" class="med gray" name="connect_db_user" />
								<select class="ml10" >
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> 시작 시간</th>
								<td>
								<input type="text" id="datepickerStart" name="datepickerStart" />
							    <input type="text" id="ptTimeStart" name="ptTimeStart" />
								<select class="ml10" >
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> 종료 시간</th>
								<td>
								<input type="text" id="datepickerEnd" name="datepickerEnd" />
								<input type="text" id="ptTimeEnd" name="ptTimeEnd" />
								<select class="ml10" >
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> 프로그램명</th>
								<td>
								<input type="text" class="med gray" name="connect_program_name" />
								<select class="ml10" >
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
								</select>
								</td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" id="register" value="등록" /></td>
							</tr>
						</tbody>
					</table>
				</form>
				</div>
			</div>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
