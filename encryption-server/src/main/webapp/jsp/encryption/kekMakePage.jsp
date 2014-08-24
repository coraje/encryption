<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<script>

function validation() {
	
	if (document.kekMakeform.encrypt_key.value != document.kekMakeform.key_check.value) {
		document.kekMakeform.encrypt_key.focus();
		alert("키가 일치하지 않습니다.");
		return false;
	} else {
		return true;
	}
}

function register() {
    $.ajax({
        type : "post",
        url : "<c:url value='/kekMake.aj'/>",
        dataType : "html",
        data : $("#kekMakeform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("success");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#kekMakeform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	$("#register").click(function(event) {
		if(validation()){
			register();			
		}
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
				<form action="./kekMake.aj" method="post" id="kekMakeform" name="kekMakeform">
					<table summary="신청 상세 내역 영역입니다." class="basic">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 관리자 ID</th>
								<td><input type="text" class="med gray" name="admin_id" /></td>
							</tr>
							<tr>
								<th class="al"> 관리자 비밀번호</th>
								<td><input type="text" class="med gray" name="password" /></td>
							</tr>
							<tr>
								<th class="al"> 키 암호키 입력</th>
								<td><input type="text" class="med gray" id="encrypt_key" name="encrypt_key" /></td>
							</tr>
							<tr>
								<th class="al"> 키 암호키 재입력</th>
								<td><input type="text" class="med gray" id="key_check" /></td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" id="register" value="키 암호키 생성" />&nbsp;<input type="button" value="키 암호키 재생성" /></td>
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
