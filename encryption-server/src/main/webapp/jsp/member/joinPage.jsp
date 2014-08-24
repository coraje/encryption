
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

	var availableId = false;
	
	//공백 체크
	function validation() {
		
		if (document.joinform.provision.checked == false) {
			document.joinform.provision.focus();
			alert("이용약관에 동의하셔야 합니다.");
			return false;
		} else if (document.joinform.information.checked == false) {
			document.joinform.information.focus();
			alert("개인정보 취급방침에 동의하셔야 합니다.");
			return false;
		} else if (document.joinform.member_id.value == "") {
			document.joinform.member_id.focus();
			alert("아이디를 입력하세요");
			return false;
		} else if (!availableId) {
			alert("아이디 중복 체크해 주시기 바랍니다.");
			return false;
		} else if (document.joinform.passwd.value == "") {
			document.joinform.passwd.focus();
			alert("비밀번호를 입력하세요");
			return false;
		} else if (document.joinform.passwd.value.length < 6) {
			document.joinform.passwd.focus();
			alert("비밀번호를 6자이상 입력하세요");
			return false;
		} else if (document.joinform.repasswd.value == "") {
			document.joinform.repasswd.focus();
			alert("비밀번호 확인을 입력하세요");
			return false;
		} else if (document.joinform.passwd.value != document.joinform.repasswd.value) {
			document.joinform.passwd.focus();
			alert("비밀번호가 틀립니다");
			return false;
		} else if (document.joinform.name.value == "") {
			document.joinform.name.focus();
			alert("이름을 입력하세요");
			return false;
		/* 
		} else if (document.joinform.social_security_number1.value == "") {
			document.joinform.social_security_number1.focus();
			alert("주민등록번호를 입력하세요");
			return false;
		} else if (document.joinform.social_security_number1.value.length != 6) {
			document.joinform.social_security_number1.focus();
			alert("주민등록번호가 맞지 않습니다.");
			return false;
		} else if (document.joinform.social_security_number2.value == "") {
			document.joinform.social_security_number2.focus();
			alert("주민등록번호를 입력하세요");
			return false;
		} else if (document.joinform.social_security_number2.value.length != 7) {
			document.joinform.social_security_number2.focus();
			alert("주민등록번호가 맞지 않습니다.");
			return false;
		 */
		} else if (document.joinform.msisdn2.value == "") {
			document.joinform.msisdn2.focus();
			alert("연락처를 입력하세요");
			return false;
		} else if (document.joinform.msisdn2.value.length < 3) {
			document.joinform.msisdn2.focus();
			alert("연락처 양식이 올바르지 않습니다.");
			return false;
		} else if (document.joinform.msisdn3.value == "") {
			document.joinform.msisdn3.focus();
			alert("연락처를 입력하세요");
			return false;
		} else if (document.joinform.msisdn3.value.length < 4) {
			document.joinform.msisdn3.focus();
			alert("연락처 양식이 올바르지 않습니다.");
			return false;
		} else if (document.joinform.email.value == "") {	// TODO Email Validation 추가해야 함.
			document.joinform.email.focus();
			alert("이메일을 입력하세요");
			return false;
		}  else if (document.joinform.email.value.search(/^\s*[\w\~\-\.]+\@[\w\~\-]+(\.[\w\~\-]+)+\s*$/g) != 0) {	
			document.joinform.email.focus();
			alert("이메일 양식이 올바르지 않습니다.");
			return false;
		} else if ($("address_detail").val() == "") {	
			$("address_detail").focus();
			alert("주소를 입력해 주시기 바랍니다.");
			return false;
		} else {
			return true;
		}
	}
	
	function postPopup() {
		window.open("<c:url value='/addressPopup.aj'/>", "Address Search", "width=400,height=200,resizable=1,scrollbars=yes, location=no");
	}
	
	function addressPopupCallBack(postcd1, postcd2, addressMain) {
		//alert(json.postcd1);
        $("#post_code1").val(postcd1);
        $("#post_code2").val(postcd2);
        $("#address_main").val(addressMain);
	}
	
	function birthSet(birthday) {
		
		var toDay = new Date();
		var year  = toDay.getFullYear();
		var month = (toDay.getMonth()+1);
		var day   = toDay.getDate();
		
		var str = "";
		// 년도 설정
		for (var i=year; i>=1900; i--) {
			
			if (birthday.substr(0,4) == i) {
				str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				str += "<option value='" + i + "' >" + i + "</option>";
			}
		}
		$("#birthdayYear").html(str);
		
		// 월, 일 설정
		for (var i=1; i<=31; i++) {
			var val = "";
			if (i < 10) {
				val = "0" + new String(i);
			} else {
				val = new String(i);
			} 
				
			
			if (birthday.substr(6,2) == i) {
				
				$("<option value='" + val + "' selected>" + val + "</option>").appendTo("#birthdayDay");
			} else {
				$("<option value='" + val + "'>" + val + "</option>").appendTo("#birthdayDay");
			}
			
			if (i < 13) {
				if (birthday.substr(4,2) == i) {
					$("<option value='" + val + "' selected>" + val + "</option>").appendTo("#birthdayMonth");
				} else {
					$("<option value='" + val + "'>" + val + "</option>").appendTo("#birthdayMonth");
				}
			}
			
		}
		// null 일경우 오늘 날짜
		if (birthday == "null") {
			$("#birthdayYear").val(year);
			$("#birthdayMonth").val(month);
			$("#birthdayDay").val(day);
		}
		
	}
	
	function anniversarySet(anniversary) {
		
		var toDay = new Date();
		var year  = toDay.getFullYear();
		var month = (toDay.getMonth()+1);
		var day   = toDay.getDate();
		
		var str = "";
		// 년도 설정
		for (var i=year; i>=1900; i--) {
			
			if (anniversary.substr(0,4) == i) {
				str += "<option value='" + i + "' selected='selected'>" + i + "</option>";
			} else {
				str += "<option value='" + i + "' >" + i + "</option>";
			}
		}
		$("#anniversaryYear").html(str);
		
		// 월, 일 설정
		for (var i=1; i<=31; i++) {
			var val = "";
			if (i < 10) {
				val = "0" + new String(i);
			} else {
				val = new String(i);
			} 
				
			
			if (anniversary.substr(6,2) == i) {
				
				$("<option value='" + val + "' selected>" + val + "</option>").appendTo("#anniversaryDay");
			} else {
				$("<option value='" + val + "'>" + val + "</option>").appendTo("#anniversaryDay");
			}
			
			if (i < 13) {
				if (anniversary.substr(4,2) == i) {
					$("<option value='" + val + "' selected>" + val + "</option>").appendTo("#anniversaryMonth");
				} else {
					$("<option value='" + val + "'>" + val + "</option>").appendTo("#anniversaryMonth");
				}
			}
			
		}
		// null 일경우 오늘 날짜
		if (anniversary == "null") {
			$("#anniversaryYear").val(year);
			$("#anniversaryMonth").val(month);
			$("#anniversaryDay").val(day);
		}
		
	}
	
	function getTodayDate(){
		var _date = new Date();
		var _year = _date.getYear();
		var _month = "" + (_date.getMonth() + 1);
		var _day = "" + _date.getDate();
		if( _month.length == 1 ) _month = "0" + _month;
		if( ( _day.length ) == 1 ) _day = "0" + _day;
		var tmp = "" + _year + _month + _day;
		return tmp;
	}
	
	var idCheckURL = "<c:url value='/idCheck.aj' />";
	var joinURL = "<c:url value='/join.aj' />";
	
	$(document).ready(function(){
		
		//연락처 숫자만입력 
		$('.d_tbody tr input').each(function() {
			if ($(this).attr("id") == "msisdn2") {
				$(this).number(true, 0);
			}
		});
		$('.d_tbody tr input').each(function() {
			if ($(this).attr("id") == "msisdn3") {
				$(this).number(true, 0);
			}
		});
		$('.d_tbody tr input').each(function() {
			if ($(this).attr("id") == "msisdn_sub2") {
				$(this).number(true, 0);
			}
		});
		$('.d_tbody tr input').each(function() {
			if ($(this).attr("id") == "msisdn_sub3") {
				$(this).number(true, 0);
			}
		});
		
		birthSet("20140101");
		
		$("#birthday").val($("#birthdayYear").val() + $("#birthdayMonth").val() + $("#birthdayDay").val());
		$("#birthdayYear, #birthdayMonth, #birthdayDay").change(function(){
			$("#birthday").val($("#birthdayYear").val() + $("#birthdayMonth").val() + $("#birthdayDay").val());
			//alert($("#birthday").val());
		});
		
		anniversarySet("20140101");
		
		$("#anniversaryYear, #anniversaryMonth, #anniversaryDay").change(function(){
			$("#anniversary").val($("#anniversaryYear").val() + $("#anniversaryMonth").val() + $("#anniversaryDay").val());
			//alert($("#birthday").val());
		});
		
		$("#member_id").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		
		$("#msisdn2, #msisdn3, #msisdn_sub2, #msisdn_sub3").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		
		$('#dupCheck').css('cursor', 'pointer');
		$("#dupCheck").click(function(event) {
			
			if ($("#member_id").val() == "") {
				alert("id 를 입력하신 후 중복체크해 주시기 바랍니다.");
				return;
			}
			
			for (var i = 0; i < $("#member_id").val().length; i++) {
			   if ((($("#member_id").val().charCodeAt(i) > 0x3130 && $("#member_id").val().charCodeAt(i) < 0x318F) || 
					   ($("#member_id").val().charCodeAt(i) >= 0xAC00 && $("#member_id").val().charCodeAt(i) <= 0xD7A3))) {
				   alert("사용할수없는 id입니다.");
				   return;      // 한글 포함이면
			    } else {
			      			     // 한글 미포함이면 
			    }
			}

	        $("#dupCheck").hide();
	        
	        var sendData = "member_id=" + $("#member_id").val();
	        $.ajax({
	            type : "post",
	            url : idCheckURL,
	            dataType : "JSON",
	            data : sendData,
	            success : function(data) {
	                eval("var resultData = " + data);
	                if (resultData == true) {
	                	alert("사용가능한 ID입니다.");
	                	availableId = true;
	                } else {
 	                	alert("중복된 ID입니다.");
	                }
	                
	            },
	            error : function(xhr, textStatus) {
	                alert("중복체크 실패");
	                
	            }
	        });
	        $('#dupCheck').show();
        });
		
		$('#joinButton').css('cursor', 'pointer');
		$("#joinButton").click(function(event) {
			if (validation()) {
				
				/* document.joinform.social_security_number.value = document.joinform.social_security_number1.value + document.joinform.social_security_number2.value; */
				document.joinform.msisdn.value = document.joinform.msisdn1.value + document.joinform.msisdn2.value + document.joinform.msisdn3.value;
				document.joinform.msisdn_sub.value = document.joinform.msisdn_sub1.value + document.joinform.msisdn_sub2.value + document.joinform.msisdn_sub3.value;
				
				if ($("#smsReceiveCheck").is(":checked") == true) {
					$("#sms_opt_in").val("Y");
				}
				if ($("#emailReceiveCheck").is(":checked") == true) {
					$("#email_opt_in").val("Y");
				}
				
				$("#post_code").val($("#post_code1").val()+$("#post_code2").val());
				
				// ie 한글깨짐관련 수정
// 				var param = "";
// 				$("#joinform input[type!=radio]").each(function() {
// 					param += "&"+$(this).attr("id")+"=" + $(this).val();
// 				});
	
				//alert(param);
// 				$.post(
// 						joinURL + "?" + param, 
// 						function(result) {
// 							//alert(result);
// 							if (result == "duplicate") {
// 								alert('중복된 ID입니다. 다른 ID를 입력해 주시기 바랍니다');
// 							} else if (result == "success") {
// 								// alert('성공 로그인 페이지로 이동');
// 								alert('회원가입이 완료되었습니다. 로그인페이지로 이동합니다.');
// 								location.href="<c:url value='/loginPage.do'/>";
// 							} else {
// 								alert('사용할수 없는 ID입니다.');
// 							}
// 						}
// 				);
				
				$.ajax({
					type: "POST",
					url: joinURL,
					data: $("#joinform").serialize(),
					success: function(result) {
						//alert(result);
						if (result == "duplicate") {
							alert('중복된 ID입니다. 다른 ID를 입력해 주시기 바랍니다');
						} else if (result == "success") {
							// alert('성공 로그인 페이지로 이동');
							alert('회원가입이 완료되었습니다. 로그인페이지로 이동합니다.');
							location.href="<c:url value='/loginPage.do'/>";
						} else {
							alert('사용할수 없는 ID입니다.');
						}
					}
				});
			}
		});
		/* 
		$("#social_security_number2").change(function(){		// 주민등록번호 앞자리 체크하여 성별 셋팅
			
			var genderType = $("#social_security_number2").val().substr(1,1);
			
			if (genderType == "1" || genderType == "3") {
				$('input:radio[name=genderRadio]:input[value=M]').attr("checked", true);
			}
			if (genderType == "2" || genderType == "4") {
				$('input:radio[name=genderRadio]:input[value=F]').attr("checked", true);
			}
		});
		 */
		$("#postPopup").css('cursor', 'pointer');
		$("#postPopup").click(function() {
			postPopup();
		});
		/* 
		$("#birthday").css('cursor', 'pointer');
		$("#birthday").datepicker({
		    dateFormat: 'yy-mm-dd'
		});
		
		$("#anniversary").css('cursor', 'pointer');
		$("#anniversary").datepicker({
		    dateFormat: 'yy-mm-dd'
		});
		 */
		
		$('#provision').click(function() {
		    if ($(this).is(':checked')) {
		    	window.open("<c:url value='/terms.pop'/>", "Terms", "width=1024,height=768,resizable=1,scrollbars=yes, location=no");
		    	//window.open("../main/terms.jsp", "Terms", "width=1024,height=768,resizable=1,scrollbars=yes, location=no");
		    }
		});
		$('#information').click(function() {
			if ($(this).is(':checked')) {
				window.open("<c:url value='/personalInformation.pop'/>", "Personal Information", "width=1024,height=768,resizable=1,scrollbars=yes, location=no");
				//window.open("../main/personalInformation.jsp", "Personal Information", "width=1024,height=768,resizable=1,scrollbars=yes, location=no");
			}
		});
	});
</script>


	<!-- container -->
	<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->

	<form action="./join.aj" method="post" id="joinform" name="joinform">
	
		<h2><strong>회원가입</strong></h2>
		<div class="combine">
			<p class="ac">
				<label class="mr20"><input id="provision" name="provision" type="checkbox" /> [통째로 빌렸다]이용약관에 동의합니다.</label>
				<label class="ml20"><input id="information" name="information" type="checkbox" /> 개인정보 취급방침에 동의합니다.</label>
			</p>
			<h3 class="mt30">|회원정보 입력|</h3>
			<p class="mb20">회원정보는 개인정보취급방침에 따라 안정하게 보호되며 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
			<p class="mb20 ar"><span class="impact"><img src="./images/sub/icon_check.png" alt="체크" /> 표시는 필수입력사항입니다.</span></p>
			<table summary="신청 상세 내역 영역입니다." class="basic">
				<colgroup>
				<col width="20%" />
				<col width="80%" />
				</colgroup>
				<tbody>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 아이디</th>
						<td><input id="member_id" name="member_id" type="text" class="min gray" maxlength="20"/><a href="#" class="ml10"><img id="dupCheck" src="./images/sub/btn_idcheck.png" alt="중복확인" /></a></td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 비밀번호</th>
						<td><input id="passwd" name="passwd" type="password" class="med gray"  maxlength="20"/><span class="ml10 impact">숫자/영문 혼합 6자이상</span></td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 비밀번호 확인</th>
						<td><input name="repasswd" type="password" class="med gray"  maxlength="20"/></td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 이름</th>
						<td><input id="name" name="name" type="text" class="med gray" onpaste="javascript:return false;" onkeypress="if(!(event.keyCode < 47 && event.keyCode > 58)) event.returnValue=false;"  maxlength="10"/></td>
					</tr>
					<!-- 
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 주민등록번호</th>
						<td>
							<input name="social_security_number1" type="text" class="min gray" size="6" maxlength="6"/> - <input id="social_security_number2" name="social_security_number2" type="password" class="min gray" size="7"  maxlength="7"/>
							<input id="social_security_number" name="social_security_number" type="hidden"/>
							<span class="ml10 impact">* 여행자 보험을 위한 필수입력사항입니다.</span>
						</td>
					</tr>
					 -->
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 생년월일</th>
						<td>
							<!-- <input type="text" id="birthday" name="birthday" size="8" maxlength="8" class="med gray"  readonly="readonly"/> -->
<!-- 							<select id="birthdayYear" class="mr30"></select> -->
<!-- 							<select id="birthdayMonth" class="mr20"></select> -->
<!-- 							<select id="birthdayDay"></select> -->
							<select id="birthdayYear"></select>년
							<select id="birthdayMonth"></select>월
							<select id="birthdayDay"></select>일
							<input type="hidden" id="birthday" name="birthday"/>
						</td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 성별</th>
						<td>
							<label class="mr10">
								<input type="radio" name="genderRadio" value="M" onclick="javascript:gender.value=this.value;"/> 남
							</label>
							<label>
								<input type="radio" name="genderRadio" value="F" onclick="javascript:gender.value=this.value;"/> 여
							</label>
							<input type="hidden" id="gender" name="gender"/>
						</td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 연락처1</th>
						<td>
							<select id="msisdn1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
							</select> - 
							<input type="text" id="msisdn2" class="min gray" size="4" maxlength="4"/> - <input type="text" id="msisdn3" class="min gray" size="4" maxlength="4" />
							<input type="hidden" id="msisdn" name="msisdn"/>
							<label class="ml20">
								<input type="checkbox" id="smsReceiveCheck"/> SMS 수신동의
								<input type="hidden" id="sms_opt_in" name="sms_opt_in" value="N"/>
							</label>
						</td>
					</tr>
					<tr>
						<th class="al">연락처2</th>
						<td><select id="msisdn_sub1">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="019">019</option>
							</select> - 
							<input type="text" id="msisdn_sub2" class="min gray" size="4" maxlength="4" /> - <input type="text" id="msisdn_sub3" class="min gray" size="4" maxlength="4" />
							<input type="hidden" id="msisdn_sub" name="msisdn_sub"/>
						</td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 이메일</th>
						<td>
								<!-- 이메일 가입용 -->
							<input type="text" id="email" name="email" class="med gray" readonly="readonly" value="${memberVO.email}" maxlength="30" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" />
<!-- 								<input type="text" id="email" name="email" class="med gray" maxlength="30"/> -->
							<label class="ml20">
								<input type="checkbox" id="emailReceiveCheck" /> 이메일 수신동의
								<input type="hidden" id="email_opt_in" name="email_opt_in" value="N"/>
							</label>
						</td>
					</tr>
					<tr>
						<th class="al vt">주소</th>
						<td>
							<input type="text" id="post_code1" name="post_code1" class="min gray" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" /> - <input type="text" id="post_code2" name="post_code2" class="min gray" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" />
							<input type="hidden" id="post_code" name="post_code"/>
							<img id="postPopup" src="./images/sub/btn_post.png" alt="우편번호" />
							<input type="text" id="address_main" name="address_main" class="max gray mt20" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" />
							<input type="text" id="address_detail" name="address_detail" class="max gray mt20"  maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th class="al">혼인여부</th>
						<td>
							<label class="mr10"><input type="radio" name="marriageRadio" value="Y" onclick="javascipre:marriage.value=this.value;"/> 기혼</label><label><input type="radio" name="marriageRadio"  value="N" onclick="javascipre:marriage.value=this.value;"/> 미혼</label>
							<input type="hidden" id="marriage" name="marriage"/>
						</td>
					</tr>
					<tr>
						<th class="al">기념일</th>
						<td>
							<!-- <input type="text" id="anniversary" name="anniversary" class="med gray" readonly="readonly"/> -->
<!-- 							<select id="anniversaryYear" class="mr30"></select> -->
<!-- 							<select id="anniversaryMonth" class="mr20"></select> -->
<!-- 							<select id="anniversaryDay"></select> -->
							<select id="anniversaryYear"></select>년
							<select id="anniversaryMonth"></select>월
							<select id="anniversaryDay"></select>일
							<input type="hidden" id="anniversary" name="anniversary"/>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="mt30 ac"><img id="joinButton" src="./images/sub/btn_join.png" alt="가입하기" /></p>
		</div>
		
	</form>
	
	</div>
	<!-- //container -->
