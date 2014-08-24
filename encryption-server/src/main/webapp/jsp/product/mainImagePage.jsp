<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script type="text/javascript">


	function imageRegistration() {
		
		if (confirm("등록 하시겠습니까?")) {

			imageform.submit();
		} else {
		}
	}

	
	
</script>

<!-- container -->
<form action="./mainImage.lo"
					enctype="multipart/form-data" method="post" name="imageform">
					
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>이미지등록</strong>
	</h2>
	<div class="combine">
	
		<table summary="후기작성 영역" class="basic" />
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody class="d_tbody">
		
			<tr>
				<th>이미지첨부</th>
				<td><input name="main_image" type="file" /></td>
			</tr>
			
			
		</tbody>
		</table>
		<p class="ar mt20">
			<a href="javascript:imageRegistration()" class="ml10"><img src="${_ContextPath}/images/sub/btn_write.png"
				alt="글쓰기" /></a><a href="#" class="ml10"><img
				src="${_ContextPath}/images/sub/btn_list.png" alt="목록" /></a>
		</p>
	</div>
</div>
</form>
<!-- //container -->