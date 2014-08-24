
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/jsp/common/commonAttribute.jsp"%>
<%-- 
<script type="text/javascript" src="${_ContextPath}/js/jquery_banner.js"></script>
 --%>
		<!-- container -->
		<div id="container">
			<!-- 배경색 설정 class="brown/white" -->
			<div class="combine">
				<!-- 진행중인 컨텐츠 영역 -->
				<div class="event mt30">
				<img src="<spring:eval expression="@config['product.htmlPath']"/>productImageUpload/mainPage_image.png" style="width:998px; height:480px;" alt="샘플 이벤트 이미지" />
					<a href="./applicationList.do" class="button"><img
						src="./images/main/btn_detail.png" alt="자세히 보기" /></a>
				</div>
				<!-- //진행중인 컨텐츠 영역 -->
				<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
						<a href="./mainImagePage.lo"><font size="4"><b>이미지등록</b></font></a>
						</c:if>

				<!-- notice & q&a & 신처하기 -->
				<div class="section multi_section">
					<!-- notice -->
					<div class="left_30">
						<h2>
							<strong>NOTICE</strong><span class="more"><a href="./noticeList.do">MORE&gt;</a></span>
						</h2>
						<ul class="list">
							<c:forEach var="list" items="${noticeList}" >
<%-- 							<li><a href="./noticeDetail.do?notice_id=<c:out value='${list.notice_id}'/>">${list.notice_title}..</a><span>${list.registration_date}</span></li> --%>
							<li><a href="./noticeDetail.do?notice_id=<c:out value='${list.notice_id}'/>">${list.notice_title}..</a><span>${list.registration_date}</span></li>
							</c:forEach>
						</ul>
					</div>
					<!-- //notice -->
					<!-- Q&A -->
					<div class="center_30">
						<h2>
							<strong>Q&A</strong><span class="more"><a href="./inquiryList.do">MORE&gt;</a></span>
						</h2>
						<ul class="list">
							<c:forEach var="list" items="${inquiryList}" >
<%-- 							<li><a href="./inquiryDetail.do?inquiry_id=<c:out value='${list.inquiry_id}'/>" target="_blank">${list.inquiry_subject}..</a><span>${list.registration_date}</span></li> --%>
							<li><a href="./inquiryDetail.do?inquiry_id=<c:out value='${list.inquiry_id}'/>">${list.inquiry_subject}..</a><span>${list.registration_date}</span></li>
							</c:forEach>
						</ul>
					</div>
					<!-- //Q&A -->
					<!-- quick -->
					<div class="right_30">
						<ul class="quick">
							<li><a href="./applicationList.do"><img src="./images/main/btn_request.png"	alt="신청하기" /></a></li>
							<li><a href="./reviewList.do"><img src="./images/main/btn_review.png"	alt="후기" /></a></li>
							<li><img src="./images/main/btn_staff.png"	alt="STAFF 모집" /></li>
							<li><img src="./images/main/btn_tel.png"	alt="070-4806-6582" /></li>
						</ul>
					</div>
					<!-- //quick -->
					<p class="c_both"></p>
				</div>
				<!-- //notice & q&a & 신처하기 -->

				<!-- history -->
				<div class="section banner_section">
					<h2>
						<strong>HISTORY</strong>
					</h2>
					<div id="rolling">
						<div id="roll_banner">
							<ul>
										<li><img	src="./images/main/history01.jpg" alt="히스토리" /></li>
										<li><img	src="./images/main/history02.jpg" alt="히스토리" /></li>
										<li><img	src="./images/main/history03.jpg" alt="히스토리" /></li>
										<li><img	src="./images/main/history04.jpg" alt="히스토리" /></li>

							</ul>
						</div>
						<span class="menu_right"><img
							src="./images/main/btn_prev.png" alt="이전" title="이전" /></span> <span
							class="menu_left"><img src="./images/main/btn_next.png"
							alt="다음" title="다음" /></span>
					</div>
				</div>
				<!-- //history -->
			</div>
		</div>
		<!-- //container -->

	