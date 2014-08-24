<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script type="text/javascript">
	
	var option_count = 0;

	function productRegistration() {
		
		if (confirm("등록 하시겠습니까?")) {

			productform.submit();
		} else {
		}
	}
	
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

	$(document).ready(function () {
		
		
		$("#product_price").number(true, 0);	// 아래와 같은효과? 
		
		 //행추가
	    $('#row_add').click(function () {
	    	option_count++;
	    	if (option_count == 1) {
	            $('.d_tbody').show();
	    	} else {
	    		$add_html = $('.d_tbody tr:last').clone();
	            $('.d_tbody').append($add_html);
	            
	            $('.d_tbody tr:last input').each(function() {
	        		$(this).val('');
	        	});
	            
	            
	            deleteClick();
	    	}
	    });
		 
	    if (option_count==0){
	    	$('.d_tbody').hide();
	    } else {
	    	$('.d_tbody').show();
	    }
	    
	//    deleteClick();
	    
	    
		
	});

	//삭제함수
	function row_delete(obj) {
	    if($('.d_tbody tr').size() > 1) {
	    	option_count--;
	        $(obj).parent().parent().remove();
	        $('.d_tbody').show();
	        
	    } else if($('.d_tbody tr').size() == 1) {
	    	option_count--;
	        $('.d_tbody').hide();
	        return false;
	    }
	}

	function deleteClick() {
		
		$('.row_delete').unbind('click');
		
	    //행삭제
	    $('.row_delete').click(function () {
	        row_delete($(this));		// TODO this 의 의미를 정확히 알고 써야 함
	    });
	}
	
</script>

<!-- container -->
<form action="./productRegistration.lo"
					enctype="multipart/form-data" method="post" name="productform">
					
<div id="container" class="brown">
	<!-- 배경색 설정 class="brown/white" -->
	<h2>
		<strong>상품등록</strong>
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
				<td><input type="text" class="med gray"  name="product_title" maxlength="30" /></td>
			</tr>
			<tr>
				<th>코멘트</th>
				<td><input type="text" class="med gray"  name="product_comment" maxlength="300" /></td>
			</tr>
			</tbody>
			</table>
			
			<table summary="후기작성 영역" class="basic" />
			<colgroup>
				<col width="15%" />
				<col width="85%" />
			</colgroup>
			<tbody>
			<tr>
				<th>기본 티켓</th>
				<td><input type="text" class="med gray" id="product_price" name="product_price"  maxlength="7"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img id="row_add" src="./images/sub/btn_add.gif" alt="추가"  /></td>
			</tr>
			</tbody>
			</table>
			
			<table summary="옵션 정보 입력 영역입니다." class="basic">
				<colgroup>
				<col width="15%" />
				<col width="25%" />
				<col width="5%" />
				<col width="22%" />
				</colgroup>
				<tbody class="d_tbody">
					<tr>
						<th>옵션</th>
						<td><input type="text" id="option_name" name="option_name" class="max gray" value="" maxlength="20"/></td>
						<th>가격</th>
						<td><input type="text" id="option_price" name="option_price" class="max gray" value="" maxlength="7" onkeydown="onlyNumber();" /></td>
						<td><img src="./images/sub/btn_del.gif" alt="삭제" class="row_delete"/></td>
					</tr>
				</tbody>
			</table>
			<table summary="후기작성 영역" class="basic" />
			<colgroup>
				<col width="15%" />
				<col width="85%" />
			</colgroup>
			<tbody>
			<tr>
				<th>행사일</th>
				<td><input type="text" class="med gray" name="product_date" maxlength="80" /></td>
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
				<td><input name="main_image" type="file" /></td>
			</tr>
			<tr>
				<th>텍스트이미지첨부</th>
				<td><input name="text_image" type="file" /></td>
			</tr>
			<tr>
				<th>서브이미지첨부</th>
				<td><input name="sub_image" type="file" /></td>
			</tr>
			<tr>
				<th class="vt">내용</th>
				<td>
					<div class="gray"  style="width: 100%; height: 200px;">
					<!-- 에디터 영역 -->
					<TEXTAREA  name="product_content" maxlength="1000" rows="" cols="" style="width: 100%; height: 200px;"></TEXTAREA>
					</div>
				</td>
			</tr>
			
		</tbody>
		</table>
		<p class="ar mt20">
			<a href="javascript:productRegistration()" class="ml10"><img src="${_ContextPath}/images/sub/btn_write.png"
				alt="글쓰기" /></a><a href="#" class="ml10"><img
				src="${_ContextPath}/images/sub/btn_list.png" alt="목록" /></a>
		</p>
	</div>
</div>
</form>
<!-- //container -->