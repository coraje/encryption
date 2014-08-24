<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%
	String product_title = request.getParameter("product_title");
	String product_status = request.getParameter("product_status");
	String application_id = request.getParameter("application_id");

%>

<script type="text/javascript">


	function reviewRegistration() {
		if($('input:radio[name=rating]:checked').length == 0){
			alert("별점을 선택하세요.");
		}else {
			if (confirm("등록 하시겠습니까?")) {
				reviewform.submit();
			}else {
			}
		}
	}


	//삭제함수
	function row_delete(obj) {
	    if($('.d_tbody tr').size() > 1) {
	        $(obj).parent().parent().remove();
	        
	        $('.d_tbody').show();
	    } else if($('.d_tbody tr').size() == 1) {
	        $('.d_tbody').hide();
	        return false;
	    }
	}
	
	function deleteClickEvnt() {
		
		$('.row_delete').unbind('click');
		
	    //행삭제
	    $('.row_delete').click(function () {
	        row_delete($(this));
	    });
	}

	$(document).ready(function () {

	    //행추가
	    $('#row_add').click(function () {
	    	
	    	if ($("#personnel").val() == 1) {
	            $('.d_tbody').show();
	            calculate(1);
	    	} else if ($('.d_tbody tr').size() > 3) {
	    		alert("첨부파일수는 최대 4개입니다.");
	    		return;
	    	} else {
	    		var rowCnt = $('.d_tbody tr').size() + 1;
	    		$add_html = '<tr><td><input name="review_image' + rowCnt + '" type="file" /></td><td><img id="row_add" src="./images/sub/btn_del.gif" class="row_delete" alt="삭제" style="float: left;margin-left: 140px;"/></td></tr>';
	            $('.d_tbody').append($add_html);
	            
	            $('.d_tbody tr:last input').each(function() {
	        		$(this).val('');
	        	});
	            
	            deleteClickEvnt();
	    	}
	    });
	    
	});
</script>

<!-- container -->
<form action="./reviewRegistration.lo"
					enctype="multipart/form-data" method="post" name="reviewform">
					<input type="hidden" name="product_title" value="<%=product_title%>">
					<input type="hidden" name="product_status" value="<%=product_status%>">	
					<input type="hidden" name="application_id" value="<%=application_id%>">	
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>후기작성</strong>
	</h2>
	<div class="combine">
		<table summary="후기작성 영역" class="basic" />
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>여행명</th>
				<td><input type="text" class="med gray" disabled="disabled" value="<%=product_title %>" /></td>
			</tr>
			<tr>
				<th>첨부</th>
				<td style="padding:0px">
					<table summary="첨부파일 영역" />
					<colgroup>
						<col width="15%" />
						<col width="85%" />
					</colgroup>
					<tbody class="d_tbody">
						<tr>
							<td>
								<input name="review_image" type="file" />
							</td>
							<td>
								<img id="row_add" src="./images/sub/btn_add.gif" alt="추가" style="float: left;margin-left: 140px;"/>
							</td>
						</tr>
					</tbody>
					</table>
				</td>
				
			</tr>
			<tr>
				<th class="vt" >내용</th>
				<td><div class="gray" style="width: 100%; height: 200px;">
					<TEXTAREA  name="review_content"  maxlength="1000" rows="" cols="" style="width: 100%; height: 200px;" ></TEXTAREA></div></td>
			</tr>
			<tr>
				<th>평점</th>
				<td>
							<label class="starpoint mr10"><input type="radio" name="rating" value="1" /><img src="./images/sub/img_starpoint.png" alt="별점" /></label>
							<label class="starpoint mr10"><input type="radio" name="rating" value="2" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /></label>
							<label class="starpoint mr10"><input type="radio" name="rating" value="3" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /></label>
							<label class="starpoint mr10"><input type="radio" name="rating" value="4" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /></label>
							<label class="starpoint mr10"><input type="radio" name="rating" value="5" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /><img src="./images/sub/img_starpoint.png" alt="별점" /></label>
				</td>
			</tr>
		</tbody>
		</table>
		<p class="ar mt20">
			<a href="javascript:reviewRegistration()" class="ml10"><img src="${_ContextPath}/images/sub/btn_write.png" alt="글쓰기" /></a>
<%-- 			<a href="#" class="ml10"><img src="${_ContextPath}/images/sub/btn_list.png" alt="목록" /></a> --%>
		</p>
	</div>
</div>
</form>
<!-- //container -->