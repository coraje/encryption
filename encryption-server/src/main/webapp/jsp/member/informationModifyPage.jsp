
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>

<script>

	//공백 체크
	function validation() {
		
		if (document.joinform.member_id.value == "") {
			document.joinform.member_id.focus();
			alert("아이디를 입력하세요");
			return false;
		} else if (document.joinform.passwd.value == "") {
			document.joinform.passwd.focus();
			alert("비밀번호를 입력하세요");
			return false;
		} else if (document.joinform.repasswd.value == "") {
			document.joinform.repasswd.focus();
			alert("비밀번호를 입력하세요");
			return false;
		} else if (document.joinform.passwd.value != document.joinform.repasswd.value) {
			document.joinform.passwd.focus();
			alert("비밀번호가 틀립니다");
			return false;
		} else if (document.joinform.name.value == "") {
			document.joinform.name.focus();
			alert("이름을 입력하세요");
			return false;
		} else if (document.joinform.msisdn.value == "") {
			document.joinform.msisdn.focus();
			alert("연락처를 입력하세요");
			return false;
		} else if (document.joinform.email.value == "") {	// TODO Email Validation 추가해야 함.
			document.joinform.email.focus();
			alert("이메일을 입력하세요");
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
	
	// 회원탈퇴 비밀번호확인 	
	function secession() {
		
		if (confirm("해당 계정의 적립금과 신청내역이 모두 삭제되고, 같은 ID로는 재가입이 불가합니다. 탈퇴 하시겠습니까?")) {
			location.href="./secession.lo?member_no=<c:out value="${SESSION_MEMBER_INFO.member_no }"/>";
		} else {
		}
	}
	
	var i=0;
	function editMember() {
		i=i+1;
		if(i%2==1){
		$('table.mytable tr td[name="NoBackDetail"]').attr("style", "display:");
		}else{$('table.mytable tr td[name="NoBackDetail"]').attr("style", "display:none");
		}
	}

	function passwdConfirm() {
		if ($("#passwd").val() == "") {
			alert("비밀번호를 입력하세요");
			return;
		}
		
	    $("#passConfirm").hide();
	    
	    var sendData = "passwd=" + $("#passwd").val();
	    $.ajax({
	        type : "post",
	        url : passCheckURL,
	        dataType : "JSON",
	        data : sendData,
	        success : function(data) {
	            eval("var resultData = " + data);	                
	            if (resultData == true) {
	            	secession();
	            	
	            } else {
	            	alert("비밀번호를 잘못 입력하셨습니다.");
	            }
	  
	        },
	        error : function(xhr, textStatus) {
	            alert("체크 실패");
	            
	        }
	    });
	    $('#passConfirm').show();
	}
	
	var passCheckURL = "<c:url value='/passCheck.aj' />";
	// 회원탈퇴 비밀번호확인 //
	
	var idCheckURL = "<c:url value='/idCheck.aj' />";
	var joinURL = "<c:url value='/informationModify.lo' />";
	
	$(document).ready(function(){
		
		// 회원탈퇴 비밀번호확인 
		$('#passConfirm').css('cursor', 'pointer');
		$("#passConfirm").click(function(event) {
				
			passwdConfirm();
	    });
		// 회원탈퇴 비밀번호확인 //
		
		$("#passwd").keyup(function(e) {
			if (e.keyCode == 13) {
				passwdConfirm();
			}
		});
		
		$("#msisdn msisdn_sub").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		
		$("#msisdn, #msisdn_sub").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		
		/* 
		$('#dupCheck').css('cursor', 'pointer');
		$("#dupCheck").click(function(event) {
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
	                	alert("사용가능한 ID 입니다.");
	                	availableId = true;
	                } else {
	                	alert("중복된 ID 입니다.");
	                }
	                
	            },
	            error : function(xhr, textStatus) {
	                alert("중복체크 실패");
	                
	            }
	        });
	        $('#dupCheck').show();
        });
		 */
		$('#joinButton').css('cursor', 'pointer');
		$("#joinButton").click(function(event) {
			if (validation()) {
				
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
	
// 				//alert(param);
// 				$.post(
// 						joinURL + "?" + param, 
// 						function(result) {
// 							if (result) {
// 								// alert('성공 로그인 페이지로 이동');
// 								location.href="<c:url value='/myPage.lo'/>";
// 							} else {
// 								alert('실패');
// 							}
// 						}
// 				);
				
				$.ajax({
					type: "POST",
					url: joinURL,
					data: $("#joinform").serialize(),
					success: function(result) {
						if (result) {
							location.href="<c:url value='/myPage.lo'/>";
						} else {
							alert('실패');
						}
					}
				});
			}
		});
		/* 
		$("#social_security_number2").change(function(){		// 주민등록번호 앞자리 체크하여 성별 셋팅
			
			var genderType = $("#social_security_number2").val().substr(1,1);
			
			if (genderType == "1" || genderType == "3") {
				$('input:radio[name=genderRadio]:input[value=male]').attr("checked", true);
			}
			if (genderType == "2" || genderType == "4") {
				$('input:radio[name=genderRadio]:input[value=female]').attr("checked", true);
			}
		});
		 */
		$("#postPopup").css('cursor', 'pointer');
		$("#postPopup").click(function() {
			postPopup();
		});
		/* 
		$("#social_security_number1").val("<c:out value="${memberVO.social_security_number}"/>".substring(0,6));
		$("#social_security_number2").val("<c:out value="${memberVO.social_security_number}"/>".substring(6,13));
		 */
		$("#post_code1").val("<c:out value="${memberVO.post_code}"/>".substring(0,3));
		$("#post_code2").val("<c:out value="${memberVO.post_code}"/>".substring(3,6));
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
	});
</script>



	<!-- container -->
	<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong class="vt">회원정보수정</strong><a href="javascript:editMember()" style="margin-left:750px;"><img src="./images/sub/btn_leave.png" alt="회원탈퇴" /></a></h2>
		<!-- 회원탈퇴 비밀번호확인 -->
			<table class="mytable">
			<tr><td name="NoBackDetail" style="display:none;"><strong class="mr10 ml20"><font color="#4374D9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			회원탈퇴를 원하실 경우, 본인확인을 위해 비밀번호를 한 번 더 입력해 주세요.</font></strong></td><tr>
			</table>
			<table class="mytable">
			<colgroup>
				<col width="30%" />
				<col width="70%" />
				</colgroup>
			<tr><td name="NoBackDetail" style="display:none;"><strong class="mr10 ml20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호</strong></td><br>
			<td name="NoBackDetail" style="display:none;"><input id="passwd" name="passwd" type="password" class="med gray"  maxlength="20"/><a href="#" class="ml10" id="passConfirm" ><b>확인</b></a></td><tr>
			</table>
		<!-- 회원탈퇴 비밀번호확인 -->
		
		<form action="./informationModify.lo" method="post" id="joinform" name="joinform">
		<input id="member_no" name="member_no" type="hidden" value="<c:out value='${memberVO.member_no}'/>"/>
		
		<div class="combine">
			<!-- <p class="ac">
				<label class="mr20"><input name="provision" type="checkbox" /> [통째로 빌렸다]이용약관에 동의합니다.</label>
				<label class="ml20"><input name="information" type="checkbox" /> 개인정보 취급방침에 동의합니다.</label>
			</p> -->
			<h3 class="mt30">|회원정보수정|</h3>
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
						<td><input id="member_id" name="member_id" type="text" class="min gray" disabled="disabled" value="${memberVO.member_id}" /><!-- <a href="#" class="ml10"><img id="dupCheck" src="./images/sub/btn_idcheck.png" alt="중복확인" /></a> --></td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 비밀번호</th>
						<td><input id="passwd" name="passwd" type="password" class="med gray"  maxlength="20" value="${memberVO.passwd}" /><span class="ml10 impact">숫자/영문 혼합 6자이상</span></td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 비밀번호 확인</th>
						<td><input name="repasswd" type="password" class="med gray"  maxlength="20" value="${memberVO.passwd}" /></td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 이름</th>
						<td><input id="name" name="name" type="text" class="med gray" value="${memberVO.name}"  maxlength="10"/></td>
					</tr>
					<%-- 
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 주민등록번호</th>
						<td>
							<input id="social_security_number1" name="social_security_number1" type="text" class="min gray" size="6" maxlength="6" disabled="disabled" /> - <input id="social_security_number2" name="social_security_number2" type="password" class="min gray" size="7"  maxlength="7" disabled="disabled" />
							<input id="social_security_number" name="social_security_number" type="hidden" disabled="disabled" value="${memberVO.social_security_number}"/>
							<span class="ml10 impact">* 여행자 보험을 위한 필수입력사항입니다.</span>
						</td>
					</tr>
					 --%>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 생년월일</th>
						<td>
							<input type="text" id="birthday" name="birthday" size="8" maxlength="8" class="med gray" value="${memberVO.birthday}" disabled="disabled" />
						</td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 성별</th>
						<td>
							<label class="mr10">
								<input type="radio" name="genderRadio" value="M" onclick="javascript:gender.value=this.value;" <c:if test="${memberVO.gender=='M'}">checked="checked"</c:if> disabled="disabled" /> 남
							</label>
							<label>
								<input type="radio" name="genderRadio" value="F" onclick="javascript:gender.value=this.value;" <c:if test="${memberVO.gender=='F'}">checked="checked"</c:if> disabled="disabled" /> 여
							</label>
							<input type="hidden" id="gender" name="gender"  value="${memberVO.gender}"/>
						</td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 연락처1</th>
						<td>
							<input type="text" id="msisdn" name="msisdn" class="min gray" size="11" maxlength="11"  value="${memberVO.msisdn}"/>
							<label class="ml20">
								<input type="checkbox" id="smsReceiveCheck" <c:if test="${memberVO.sms_opt_in == 'Y'}" >checked="checked"</c:if>/> SMS 수신동의
								<input type="hidden" id="sms_opt_in" name="sms_opt_in" value="<c:out value='${memberVO.sms_opt_in}'/>"/>
							</label>
						</td>
					</tr>
					<tr>
						<th class="al">연락처2</th>
						<td>
							<input type="text" id="msisdn_sub" name="msisdn_sub" class="min gray" size="11" maxlength="11"  value="${memberVO.msisdn_sub}"/>
						</td>
					</tr>
					<tr>
						<th class="al"><img src="./images/sub/icon_check.png" alt="체크" /> 이메일</th>
						<td>
							<input type="text" id="email" name="email" class="med gray" disabled="disabled" value="${memberVO.email}"  maxlength="30"/>
							<label class="ml20">
								<input type="checkbox" id="emailReceiveCheck"  <c:if test="${memberVO.email_opt_in == 'Y'}" >checked="checked"</c:if>/> 이메일 수신동의
								<input type="hidden" id="email_opt_in" name="email_opt_in" value="<c:out value='${memberVO.email_opt_in}'/>"/>
							</label>
						</td>
					</tr>
					<tr>
						<th class="al vt">주소</th>
						<td>
							<input type="text" id="post_code1" name="post_code1" class="min gray" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" /> - <input type="text" id="post_code2" name="post_code2" class="min gray" readonly="readonly" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" />
							<input type="hidden" id="post_code" name="post_code"  value="${memberVO.post_code}"/>
							<img id="postPopup" src="./images/sub/btn_post.png" alt="우편번호" />
							<input type="text" id="address_main" name="address_main" class="max gray mt20" readonly="readonly"  value="${memberVO.address_main}" onkeyDown="if(event.keyCode==8) {event.keyCode=0;return false;}" />
							<input type="text" id="address_detail" name="address_detail" class="max gray mt20"  value="${memberVO.address_detail}" maxlength="100"/>
						</td>
					</tr>
					<tr>
						<th class="al">혼인여부</th>
						<td>
							<label class="mr10">
								<input type="radio" name="marriageRadio" value="Y" onclick="javascipre:marriage.value=this.value;" <c:if test="${memberVO.marriage == 'Y'}" >checked="checked"</c:if>/> 기혼</label>
							<label>
								<input type="radio" name="marriageRadio"  value="N" onclick="javascipre:marriage.value=this.value;" <c:if test="${memberVO.marriage == 'N'}" >checked="checked"</c:if>/> 미혼</label>
							<input type="hidden" id="marriage" name="marriage"  value="${memberVO.marriage}"/>
						</td>
					</tr>
					<tr>
						<th class="al">기념일</th>
						<td><input type="text" id="anniversary" name="anniversary" class="med gray"  value="${memberVO.anniversary}" /></td>
					</tr>
				</tbody>
			</table>
			<p class="mt30 ac"><img id="joinButton" src="./images/sub/btn_edit.png" alt="가입하기" /></p>
		</div>
	</div>
	<!-- //container -->

</form>