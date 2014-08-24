<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

//숫자만입력
function onlyNumber(){
	var keycode = window.event.keyCode;
	 
	  if(keycode == 8 || (keycode >= 35 && keycode <= 40) || (keycode >= 46 && keycode <= 57) || (keycode >= 96 && keycode <= 105) || keycode == 110 || keycode == 190) {
	    window.event.returnValue = true;
	    return;
	  } else {
	    window.event.returnValue = false;
	    return;
	  }
}

function register() {
	if ($("#hashCheck").is(":checked") == true) {
		$("#hash_check").val("Y");
	}else{
		$("#hash_check").val("N");
	}
	if ($("#ivCheck").is(":checked") == true) {
		$("#iv_check").val("Y");
	}else{
		$("#iv_check").val("N");
	}
	if ($("#partialEncryptCheck").is(":checked") == true) {
		$("#partial_encrypt_check").val("Y");
	}else{
		$("#partial_encrypt_check").val("N");
	}
	if ($("#maskCheck").is(":checked") == true) {
		$("#mask_check").val("Y");
	}else{
		$("#mask_check").val("N");
	}
    $.ajax({
        type : "post",
        url : "<c:url value='/columnPolicy.aj'/>",
        dataType : "html",
        data : $("#columnPolicyform").serialize(),
        success : function(data) {
            if (data == "success") {
            	alert("success");
            } 
        },
        error : function(xhr, textStatus) {
        	alert($("#columnPolicyform").serialize());
            
        }
    });
}

$(document).ready(function(){
	
	$("#register").click(function(event) {
		register();
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
					<form action="./columnPolicy.aj" method="post" id="columnPolicyform" name="columnPolicyform">
						<table summary="신청 상세 내역 영역입니다." class="basic" >
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<th class="al"> TABLE OWNER</th>
									<td>
									<input type="text" class="med gray" name="owner"/>
									<select class="ml10" >
						
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
										
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 테이블 이름</th>
									<td>
									<input type="text" class="med gray" name="table_name" />
									<select class="ml10" >
						
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
									</select>
									</td>
								</tr>
								<tr>
									<th class="al"> 컬름 이름</th>
									<td>
									<input type="text" class="med gray" name="column_name" />
									<select class="ml10" >
						
			<!-- 							<option value=""></option> -->
			<!-- 							<option value=""></option> -->
									</select>
									<input type="button" value="조회" style="vertical-align: 20%"/>
									</td>
								</tr>
								</tbody>
						</table>
								<br>
								<hr size="3" color="#8C8C8C">
								<br>
						<table summary="신청 상세 내역 영역입니다." class="basic">
							<colgroup>
							<col width="20%" />
							<col width="80%" />
							</colgroup>
							<tbody>	
								<tr>
									<th class="al"> 일방향 알고리즘 여부</th>
									<td>
									<input type="text" class="med gray" readonly="readonly"/>
									
									<input type="checkbox" id="hashCheck"/>
									<input type="hidden" id="hash_check" name="hash_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> 일방향 알고리즘 SALT</th>
									<td><input type="text" class="med gray" name="hash_salt"/></td>
								</tr>
								<tr>
									<th class="al"> Iv 사용여부</th>
									<td>
									<input type="text" class="med gray" readonly="readonly"/>
									
									<input type="checkbox" id="ivCheck"/>
									<input type="hidden" id="iv_check" name="iv_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> Iv</th>
									<td><input type="text" class="med gray" name="iv_value"/></td>
								</tr>
								<tr>
									<th class="al"> 부분암호화 여부</th>
									<td>
									<input type="text" class="med gray" readonly="readonly"/>
									
									<input type="checkbox" id="partialEncryptCheck"/>
									<input type="hidden" id="partial_encrypt_check" name="partial_encrypt_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> 부분암호화 평문길이</th>
									<td><input type="text" class="med gray" name="partial_encrypt_length" value="0" onkeydown="onlyNumber();" /></td>
								</tr>
								<tr>
									<th class="al"> Masking 여부</th>
									<td>
									<input type="text" class="med gray" readonly="readonly"/>
									
									<input type="checkbox" id="maskCheck"/>
									<input type="hidden" id="mask_check" name="mask_check" value="N"/>
									</td>
								</tr>
								<tr>
									<th class="al"> Masking 자리수</th>
									<td><input type="text" class="med gray" name="mask_digit"/></td>
								</tr>
								<tr>
									<th class="al"> Mask</th>
									<td><input type="text" class="med gray" name="mask_value"/></td>
								</tr>
								<tr>
									<th class="al"> </th>
									<td><input type="button" id="register" value="등록" />&nbsp;<input type="button" value="수정" />&nbsp;<input type="button" value="삭제" /></td>
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
