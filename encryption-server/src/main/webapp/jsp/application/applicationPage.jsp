
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../common/commonAttribute.jsp" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.util.*"%>
<%@ page import="kr.co.hitcom.rent.application.OptionVO"%>
<% 
	
	ArrayList<OptionVO> list = (ArrayList) request.getAttribute("optionList");

%>
<script type="text/javascript">

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

function calculate(personnel) {
	
	var currentPersonnel = Number($("#personnel").val());
	$("#personnel").val(currentPersonnel + Number(personnel));
	$("#price").val(Number(<c:out value='${option_price}'/>) + Number(<c:out value='${applicationVO.product_price}'/>) * $("#personnel").val());
	
}

//삭제함수
function row_delete(obj) {
    if($('.d_tbody tr').size() > 1) {
        //alert('삭제');
        $(obj).parent().parent().remove();
        calculate(-1);
        
        $('.d_tbody').show();
    } else if($('.d_tbody tr').size() == 1) {
        //alert('처음 행 삭제불가');
        calculate(-1);
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

function validation() {
	
	var result = false;
	
	$("#registrationform input[type!=radio]").each(function() {
		if ($(this).val() == "") {
			//$(this).attr("id").focus();
			$(this).focus();
			
			var msg = "";
			
			if ($(this).attr("id") == "name") {
				msg = "이름을";
				alert(msg + " 입력해 주시기 바랍니다.");
				result = true;
				return false;
			} else if ($(this).attr("id") == "msisdn") {
				msg = "전화번호를";
				alert(msg + " 입력해 주시기 바랍니다.");
				result = true;
				return false;
			} else if ($(this).attr("id") == "gender") {
				msg = "성별을";
				alert(msg + " 입력해 주시기 바랍니다.");
				result = true;
				return false;
			} else if ($(this).attr("id") == "birthday") {
				msg = "생년월일을";
				alert(msg + " 입력해 주시기 바랍니다.");
				result = true;
				return false;
			} 
// 				else if ($(this).attr("id") == "application_date") {
// 				msg = "입금일을";
// 			}
 			if ($("#personnel").val() > 1) {
					if ($(this).attr("id") == "friend_name") {
					msg = "동반자 이름을";
				} else if ($(this).attr("id") == "friend_msisdn") {
					msg = "동반자 전화번호를";
				} else if ($(this).attr("id") == "friend_gender") {
					msg = "동반자 성명을";
				} else if ($(this).attr("id") == "friend_age") {
					msg = "동반자 나이를";
				} else if ($(this).attr("id") == "sender_name") {
					msg = "입금자명을";
				}
					alert(msg + " 입력해 주시기 바랍니다.");
					result = true;
					return false;
 			}			
			
		}
		
	});
	
	return result;
}

$(document).ready(function () {
	
//	$("#birthday").number(true, 0);

    //행추가
    $('#row_add').click(function () {
    	
    	if ($("#personnel").val() == 1) {
            $('.d_tbody').show();
            calculate(1);
    	} else if ($('.d_tbody tr').size() > 4) {
    		alert("최대 인원수는 6명입니다.");
    		return;
    	} else {
    		$add_html = $('.d_tbody tr:last').clone();
            $('.d_tbody').append($add_html);
            
            $('.d_tbody tr:last input').each(function() {
        		$(this).val('');
        	});
            
            calculate(1);
            
            deleteClick();
    	}
    });
    
    $("#personnel").val(<c:out value='${personnel}'/>);	// 인원수 셋팅
    
    $("#price").val(Number(<c:out value='${option_price}'/>) + Number(<c:out value='${applicationVO.product_price}'/>) * <c:out value='${personnel}'/>);	// 총가격 계산
    
    if (Number(<c:out value='${personnel}'/>) == 1){
    	$('.d_tbody').hide();
    } else {
    	$('.d_tbody').show();
    	for (var cnt = 2; cnt < Number(<c:out value='${personnel}'/>); cnt++) {	// 인원수 만큼 동반인원 row 생성(최소 1명이상)
        	$add_html = $('.d_tbody tr:last').clone();
            $('.d_tbody').append($add_html);
        }
    }
	
    deleteClick();
    
    $('#getMember').click(function () {	//	회원정보 동일 체크 클릭
    	$.post(
    			"<c:url value='/getMember.aj'/>?member_no=<c:out value='${SESSION_MEMBER_INFO.member_no}'/>", 
				function(result) {
    				//alert(result);
					if (result) {
						var obj = eval("("+result+")");
	    				//alert(obj.name + ":" + obj.msisdn);
	    				$("#name").val(obj.name);
	    				$("#msisdn").val(obj.msisdn);
	    				$("#gender").val(obj.gender);
	    				if (obj.gender == "M") {
	    					$("#genderRadioM").attr("checked", true);
	    				} else if (obj.gender == "F") {
	    					$("#genderRadioF").attr("checked", true);
	    				}
	    				$("#birthday").val(obj.birthday);
	    				
	    				$("#sender_name").val(obj.name);
					} else {
						//alert('실패');
					}
				}
		);
    });
    
    $('#getMember').trigger('click');
    
    
    $("#registration").css('cursor', 'pointer');
    $("#registration").click(function () {
    	
    	/* 
    	$('input[id^="friend"]').each(function() {
    	    alert($(this).val());
    	});
    	 */
    	/* 
    	var param = "";
    	 
		$("#registrationform input[type!=radio]").each(function() {
			param += "&"+$(this).attr("id")+"=" + $(this).val();
		});
		 */
    	
		if (validation()) {
			return;
		} else {
			$("#registrationform").submit();
		}
    });
    
//     $("#application_date").css('cursor', 'pointer');
// 	$("#application_date").datepicker({
// 	    dateFormat: 'yy-mm-dd'
// 	});

	$("#price").number(true, 0);	// 갸격에 1,000 단위 콤마 구분
	
	<%for (int i = 0; i < list.size(); i++) {%>
		$("#option_price<%=i%>").number(true, 0);
	<%}%>
	
	$('.d_tbody tr input').each(function() {
		if ($(this).attr("id") == "friend_age") {
			$(this).number(true, 0);
		}
	});
});

</script>

<!-- container -->
	<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>주문상세내역</strong></h2>
		<div class="combine">
		
		<form:form method="post" action="./applicationRegistration.lo" id="registrationform" modelAttribute="registrationform">
		<input id="product_id" name="product_id" type="hidden" value="<c:out value='${applicationVO.product_id}'/>"/>
		<input type="hidden" name="quantity" value="<c:out value='${quantity}'/>">	
		
			<table summary="신청 상세 내역 영역입니다." class="basic_gray">
				<colgroup>
				<col width="40%" />
				<col width="20%" />
				<col width="20%" />
				<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<th>신청행사명</th>
						<th>인원수</th>
						<th>총 가격</th>
						<th>적립금</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:out value='${applicationVO.product_title}'/><br/>(<c:out value='${applicationVO.product_date}'/>)</td>
						<td><input id="personnel" name="personnel" type="text" readonly="readonly" style="text-align: right"/>명</td>
						<td><input id="price" name="price" type="text" readonly="readonly" style="text-align: right"/>원</td>
						<td>0원</td>
					</tr>
				</tbody>
			</table>
			<br>
			<c:if test="${quantity_length > 0}">
				<table summary="신청 상세 내역 영역입니다." class="basic_gray">
					<colgroup>
					<col width="40%" />
					<col width="25%" />
					<col width="35%" />
					</colgroup>
					<thead>
						<tr>
							<th>옵션명</th>
							<th>수량</th>
							<th>가격</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${optionList}" var="optionVO" varStatus="status">
							<tr> 
								<c:if test="${optionVO.quantity > 0}">
								<td><c:out value='${optionVO.option_name}'/></td>
								<td><input type="text" readonly="readonly" style="text-align: right" value='${optionVO.quantity}' />개</td>
								<td><input id="option_price${status.index}" type="text" readonly="readonly" style="text-align: right" value='${optionVO.option_price*optionVO.quantity}' />원</td>
								</c:if>
							</tr>  
					    </c:forEach>
					</tbody>
				</table>
			</c:if>

			<h3>|신청자 정보|<span class="ml20 impact"><label>회원가입정보와 동일<input id="getMember" type="checkbox" /></label></span></h3>
			<table summary="신청자 정보 입력 영역입니다." class="basic">
				<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th>이름</th>
						<td><input id="name" name="name" type="text" class="max gray" maxlength="10"/></td>
						<th>전화번호</th>
						<td><input id="msisdn" name="msisdn" type="text" class="max gray" maxlength="11" onpaste="javascript:return false;" style="ime-mode:disabled;" onkeydown="onlyNumber();" /></td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<label class="mr10">
								<input type="radio" id="genderRadioM" name="genderRadio" value="M" onclick="javascript:gender.value=this.value;"/> 남
							</label>
							<label>
								<input type="radio" id="genderRadioF" name="genderRadio" value="F" onclick="javascript:gender.value=this.value;"/> 여
							</label>
							<input type="hidden" id="gender" name="gender"/>
						</td>
						<th>생년월일</th>
						<td><input id="birthday" name="birthday" type="text" class="max gray" maxlength="11" onpaste="javascript:return false;" style="ime-mode:disabled;" onkeydown="onlyNumber();" /></td>
					</tr>
				</tbody>
			</table>

		<h3>|동반인원 정보|<span class="ml20">동반자 이름/성별/나이/전화번호를 기입하여 주십시오.</span> <img id="row_add" src="./images/sub/btn_add.gif" alt="추가" style="float: right;"/></h3>
			<table summary="동반자 정보 입력 영역입니다." class="basic">
				<colgroup>
				<col width="60px" />
				<col width="" />
				<col width="60px" />
				<col width="" />
				<col width="60px" />
				<col width="" />
				<col width="110px" />
				<col width="" />
				<col width="18px" />
				</colgroup>
				<tbody class="d_tbody">
					<tr>
						<th>이름</th>
						<td><input type="text" id="friend_name" name="friend_name" class="max gray" value="" maxlength="10"/></td>
						<th>성별</th>
						<td>
							<select id="friend_gender" name="friend_gender" class="max gray">
								<option value="M">남자</option>
								<option value="F">여자</option>
							</select>
						</td>
						<th>나이</th>
						<td><input type="text" id="friend_age" name="friend_age" class="max gray" value="" maxlength="3"/></td>
						<th>전화번호</th>
						<td><input type="text" id="friend_msisdn" name="friend_msisdn" class="max gray" value="" maxlength="11"/></td>
						<td><img src="./images/sub/btn_del.gif" alt="삭제" class="row_delete"/></td>
					</tr>
				</tbody>
			</table>

			<h3>|결제 정보 입력|<span class="ml20 impact">*신청 후 3일이내 미입금시 신청취소됩니다.</span></h3>
			<p class="sub_tit">무통장입금 <span class="ml20">우리은행 1005-502-160373 예금주: 주식회사히트콤</span></p><br>
<!-- 			<table summary="결제 정보 입력 영역입니다." class="basic"> -->
				<table>
				<colgroup>
<%-- 				<col width="15%" /> --%>
<%-- 				<col width="35%" /> --%>
<%-- 				<col width="15%" /> --%>
<%-- 				<col width="35%" /> --%>
				<col width="50%" />
				<col width="50%" />
				</colgroup>
				<tbody>
					<tr>
						<th>입금자명</th>
						<td><input id="sender_name" name="sender_name" type="text" class="max gray" value=""  maxlength="10"/></td>
<!-- 						<th>참가비 입금예정 날짜</th> -->
<!-- 						<td><input id="application_date" name="application_date" type="text" class="max gray"/></td> -->
					</tr>
				</tbody>
			</table>
			<p class="mt30 ac"><img id="registration" src="${_ContextPath}/images/sub/btn_request.png" alt="신청하기" /></p>
			
		</form:form>
		</div>
		<!-- //combine -->
	</div>
	<!-- //container -->
