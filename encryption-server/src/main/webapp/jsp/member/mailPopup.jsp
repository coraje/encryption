<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>히트콤-통째로 빌렸다</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
 
<style type="text/css">
</style>
 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script type="text/javascript" src="${_ContextPath}/js/jquery.number.js"></script>
<script type="text/javascript" src="${_ContextPath}/js/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="${_ContextPath}/js/common.gnb-left.js"></script>



<script>


function sendMail() {
	if ($("#mail").val() == "") {
		alert("메일을 입력해 주세요.");
	} else {
		$.post(
				"<c:url value='/mailTransfer.aj'/>?email=" + $("#mail").val(), 
				function(result) {
					if (result == "duplicate") {
						alert('이미 사용중인 메일 입니다. 다른 메일을 입력해 주세요');
					}else if (result == "success") {
						alert('메일일 발송하였습니다.');
						window.close();
					} else {
						alert(result);
					}
				}
		);
	}
}

$(document).ready(function(){
	
	$("#mail").keyup(function(e) {
		if (e.keyCode == 13) {
			 sendMail();
         }
	});
	
	$("#mailTransfer").click(function(event) {
		sendMail();
	});
});
</script>



</head>
<body>


<!-- container -->
	<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
		<strong>메일을 입력해 주세요. 입력하신 메일로 회원가입 URL이 전송됩니다.</strong><br><br>
		
		
		<input type="text" id="mail" name="mail" class="max gray mt20" />
		<a href="#" class="ml10" id="mailTransfer" style="text-decoration:none;"><b>확인</b></a>
		
		
	</div>
	<!-- //container -->

</body>
</html>