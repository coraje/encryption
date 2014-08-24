<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>


<script>
function passPopup(){ 
	window.open("<c:url value='/passPopup.aj'/>", "", "width=400,height=200,resizable=1,scrollbars=yes, location=no");
}

	$(document).ready(function(){
		
		var loginURL = "<c:url value='/login.do' />";
		var joinPageURL = "<c:url value='/joinPage.do' />";
		
		$('#loginButton').css('cursor', 'pointer');
		$("#loginButton").click(function() {
			document.loginForm.submit();
		});
		
		$('#joinButton').css('cursor', 'pointer');
		$("#joinButton").click(function() {
			/* location.href = joinPageURL; */
			window.open("<c:url value='/mailPopup.aj'/>", "Mail", "width=400,height=200,resizable=1,scrollbars=yes, location=no");
		});
		
		$("#member_pw").keyup(function(e) {
            if (e.keyCode == 13 && $("#member_pw").val() != "") {
            	document.loginForm.submit();
            }
        });
		
	});
</script>


<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>로그인</strong></h2>
		<div class="combine">
			<div class="login_area">
			<form name="loginForm" action="<c:url value='/login.do' />" method="POST">
				<ul>
				<li><input type="text" name="member_id" class="gray" value=""  maxlength="20" style='font-size:12pt; padding-left: 5px;' /></li>
				<li><input type="password" id="member_pw" name="member_pw" class="gray" value=""  maxlength="20" style='font-size:12pt; padding-left: 5px;' onkeyup="if((arguments[0]||event).keyCode == 13) ready()" /></li>
				</ul>
				<span class="login"><img id="loginButton" src="./images/sub/btn_login.png" alt="로그인"/></span>
					<!-- 이메일 가입용 -->
				<p class="button"><img id="joinButton" src="./images/sub/btn_join.gif" alt="회원가입" class="mr10"/><a href="javascript:passPopup();"><img src="./images/sub/btn_id_search.gif" alt="아이디/비밀번호 찾기" /></a><p>
<%-- 			<p class="button"><a href="<c:url value='/joinPage.do' />"><img src="./images/sub/btn_join.gif" alt="회원가입" class="mr10"/><a href="#"><img src="./images/sub/btn_id_search.gif" alt="아이디/비밀번호 찾기" /></a><p> --%>
			</form>
			</div>
		</div>
	</div>
	<!-- //container -->
