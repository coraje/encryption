<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.hitcom.rent.notice.NoticeVO"%>
<%
	NoticeVO noticeVO = (NoticeVO) request
			.getAttribute("noticeVO");
		
%>

	<script type="text/javascript">


	function noticeRegistration() {
		
		if (confirm("변경 하시겠습니까?")) {

			noticeform.submit();
		} else {
		}
	}
</script>

<!-- container -->
<form action="./noticeModify.lo"
					enctype="multipart/form-data" method="post" name="noticeform">
				<input type="hidden" name="notice_id" value="<%=noticeVO.getNotice_id()%>">	
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>공지변경</strong>
	</h2>
	<div class="combine">
	
		<table summary="후기작성 영역" class="basic" />
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>제목</th>
				<td><input type="text" class="med gray"   maxlength="80" name="notice_subject" value="<%=noticeVO.getNotice_title() %>" /></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div class="gray" style="width: 100%; height: 200px; ">
					<!-- 에디터 영역 -->
					<TEXTAREA  name="notice_content"  maxlength="1000" rows="" cols="" style="width: 100%; height: 200px;" ><%=noticeVO.getNotice_content() %></TEXTAREA>
					</div>
				</td>
			</tr>
			
		</tbody>
		</table>
		<p class="ar mt20">
			<a href="javascript:noticeRegistration()" class="ml10"><img src="${_ContextPath}/images/sub/btn_write.png"
				alt="글쓰기" /></a><a href="#" class="ml10"><img
				src="${_ContextPath}/images/sub/btn_list.png" alt="목록" /></a>
		</p>
	</div>
</div>
</form>
<!-- //container -->
