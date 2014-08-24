
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script type="text/javascript">


	function inquiryRegistration() {
		
		if (confirm("등록 하시겠습니까?")) {

			inquiryform.submit();
		} else {
		}
	}
</script>

<!-- container -->
<form action="./inquiryRegistration.lo"
					enctype="multipart/form-data" method="post" name="inquiryform">
					
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>문의글등록</strong>
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
				<td><input type="text" class="med gray"   maxlength="80" name="inquiry_subject"/></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div class="gray"  style="width: 100%; height: 200px;">
					<!-- 에디터 영역 -->
					<TEXTAREA  name="inquiry_content" rows="" cols=""  maxlength="1000" style="width: 100%; height: 200px;"></TEXTAREA>
					</div>
				</td>
			</tr>
			
		</tbody>
		</table>
		<p class="ar mt20">
			<a href="javascript:inquiryRegistration()" class="ml10"><img src="${_ContextPath}/images/sub/btn_write.png"
				alt="글쓰기" /></a>
				<a href="javascript:history.go(-1)" class="ml10"><img
				src="${_ContextPath}/images/sub/btn_list.png" alt="목록" /></a>
		</p>
	</div>
</div>
</form>
<!-- //container -->
