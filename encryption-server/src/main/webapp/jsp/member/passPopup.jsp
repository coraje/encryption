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


$(document).ready(function(){
$("#passSearch").click(function(event) {
	
	if ($("#member_id").val() == "") {
		alert("ID를 입력해 주세요.");
	} else {
		$.post(
				"<c:url value='/passSearch.aj'/>?member_id=" + $("#member_id").val(), 
				function(resultData) {		                
	                if (resultData == "success") {
	                	alert('메일일 방송하였습니다.');
						window.close();
					}else {
						alert("존재하지않는 ID입니다.");
					}
				}
		);
	}
});
});
</script>



</head>
<body>


<!-- container -->
	<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
		<strong>회원가입때 등록한 메일로 비밀번호가 전송됩니다. ID를 입력해 주세요.</strong><br><br>
		
		
		<input type="text" id="member_id" name="member_id" class="max gray mt20" />
		<a href="#" class="ml10" id="passSearch" style="text-decoration:none;"><b>확인</b></a>
		
		
	</div>
	<!-- //container -->

</body>
</html>