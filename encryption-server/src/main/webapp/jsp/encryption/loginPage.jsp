<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<!-- container -->
<div class="container-fluid ">
	<div class="row-fluid ">
		<div class="span2">
			<div class="well sidebar-nav">
				<ul class="nav nav-list">
							
					<li><a href="./globalPolicyPage.do"><h1>글로벌암호정책설정</h1></a></li>
					<li><a href="./columnPolicyPage.do"><h1>컬름별암호정책설정</h1></a></li>
					<li><a href="./keyMakePage.do"><h1>암호키생성</h1></a></li>
					<li><a href="./kekMakePage.do"><h1>키암호키생성</h1></a></li>
					<li><a href="./policyACPage.do"><h1>정책기반접근제어</h1></a></li>
					<li><a href="./behaviorACPage.do"><h1>행위기반접근제어</h1></a></li>

				</ul>
			</div>
		</div>
		<div class="span8">
			<div id="container" class="white"><!-- 배경색 설정 class="brown/white" -->
				<div class="combine">
					<table summary="신청 상세 내역 영역입니다." class="basic">
						<colgroup>
						<col width="20%" />
						<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<th class="al"> 아이디</th>
								<td><input type="text" class="med gray" /></td>
							</tr>
							<tr>
								<th class="al"> 비밀번호</th>
								<td><input type="text" class="med gray" /></td>
							</tr>
							<tr>
								<th class="al"> </th>
								<td><input type="button" value="로그인" /><input type="button" value="사용자등록" /></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="span2"></div>
	</div>
</div>
<!-- //container -->
