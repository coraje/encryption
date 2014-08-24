<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<%@ page import="kr.co.hitcom.rent.product.ProductVO"%>
<%
	ProductVO productVO = (ProductVO) request
			.getAttribute("productVO");
		
%>

<script type="text/javascript">


	function productModify() {
		
		if (confirm("변경 하시겠습니까?")) {

			productform.submit();
		} else {
		}
	}
	
	$(document).ready(function () {
		
		$('.d_tbody tr input').each(function() {
			if ($(this).attr("id") == "product_price") {
				$(this).number(true, 0);
			}
		});
	});
	
</script>

<!-- container -->
<form action="./productModify.lo"
					enctype="multipart/form-data" method="post" name="productform">
					<input type="hidden" name="product_id" value="<%=productVO.getProduct_id()%>">	
					
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>상품변경</strong>
	</h2>
	<div class="combine">
	
		<table summary="후기작성 영역" class="basic" />
		<colgroup>
			<col width="15%" />
			<col width="85%" />
		</colgroup>
		<tbody>
			<tr>
				<th>이름</th>
				<td><input type="text" class="med gray"  name="product_title" maxlength="30" value="<%=productVO.getProduct_title()%>" /></td>
			</tr>
			<tr>
				<th>코멘트</th>
				<td><input type="text" class="med gray"  name="product_comment" maxlength="300" value="<%=productVO.getProduct_comment()%>" /></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" class="med gray" id="product_price" name="product_price"  maxlength="6"   value="<%=productVO.getProduct_price()%>" /></td>
			</tr>
			<tr>
				<th>행사일</th>
				<td><input type="text" class="med gray" name="product_date" maxlength="80" value="<%=productVO.getProduct_date()%>" /></td>
			</tr>
			<tr>
				<th>행사진행상황</th>
				<td><select class="ml10" name="progress" >		
						<option value="a">진행예정</option>
						<option value="b">진행중</option>
						<option value="c">행사종료</option>
					</select></td>
			</tr>
			<tr>
				<th>행사종류</th>
				<td><select class="ml10" name="product_status" >		
						<option value="a">호텔</option>
						<option value="b">기차</option>
						<option value="c">마을</option>
					</select></td>
			</tr>
			<tr>
				<th>메인이미지첨부</th>
				<td><input name="main_image" type="file"  value="<%=productVO.getProduct_mainimage_path()%>" /></td>
			</tr>
			<tr>
				<th>텍스트이미지첨부</th>
				<td><input name="text_image" type="file"  value="<%=productVO.getProduct_textimage_path()%>" /></td>
			</tr>
			<tr>
				<th>서브이미지첨부</th>
				<td><input name="sub_image" type="file"  value="<%=productVO.getProduct_subimage_path()%>" /></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div class="gray"  style="width: 100%; height: 200px;">
					<!-- 에디터 영역 -->
					<TEXTAREA  name="product_content" maxlength="1000" rows="" cols="" style="width: 100%; height: 200px; "><%=productVO.getProduct_content()%></TEXTAREA>
					</div>
				</td>
			</tr>
			
		</tbody>
		</table>
		<p class="ar mt20">
			<a href="javascript:productModify()" class="ml10"><img src="${_ContextPath}/images/sub/btn_write.png"
				alt="글쓰기" /></a><a href="#" class="ml10"><img
				src="${_ContextPath}/images/sub/btn_list.png" alt="목록" /></a>
		</p>
	</div>
</div>
</form>
<!-- //container -->