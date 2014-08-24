
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="../common/commonAttribute.jsp" %>

<script type="text/javascript">
	function Confirmation(id) {
		if (confirm("삭제 하시겠습니까?")) {

			location.href = "./productDelete.lo?product_id=" + id
		} else {
		}
	}
</script>


	<!-- container -->
	<div id="container" class="brown"><!-- 배경색 설정 class="brown/white" -->
		<h2><strong>‘통째로 빌렸다’ 여행상품</strong>
			<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
			&nbsp;&nbsp;&nbsp;&nbsp;<a href="./productRegistrationPage.lo">상품등록</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
			<a href="./applicationRegistrationList.lo">신청자목록</a>
			</c:if>
		</h2>
		<ul class="thumb_list">
		
		<c:forEach var="list" items="${applicationList}">
		<li>
			<dl>
			<a href="<c:url value='/applicationDetail.do?product_id='/><c:out value='${list.product_id}'/>"><img src="<spring:eval expression="@config['product.htmlPath']"/><c:out value='${list.product_mainimage_path}'/>" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></a>
<%-- 				<dt><img src="<spring:eval expression="@config['product.htmlPath']"/><c:out value='${list.product_mainimage_path}'/>" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></dt> --%>
				<dd><br>
					<span><font size="4">[<c:out value='${list.product_date}'/>]</font></span>
					<strong><a href="<c:url value='/applicationDetail.do?product_id='/><c:out value='${list.product_id}'/>"><font size="4">${list.product_title}</font></a></strong>
					<span><c:out value='${list.product_comment}'/></span>
					<c:if test="${SESSION_MEMBER_INFO.isadmin == 'ADMIN'}" >
					<c:if test="${list.progress == 'a'}" ><font color=#2478FF>진행예정</font></c:if>
					<c:if test="${list.progress == 'b'}" ><font color=#2478FF>진행중</font></c:if>
					<c:if test="${list.progress == 'c'}" ><font color=#2478FF>행사종료</font></c:if>&nbsp;&nbsp;&nbsp;&nbsp;
					<c:if test="${list.product_status == 'a'}" ><font color=#2478FF>호텔</font></c:if>
					<c:if test="${list.product_status == 'b'}" ><font color=#2478FF>기차</font></c:if>
					<c:if test="${list.product_status == 'c'}" ><font color=#2478FF>마을</font></c:if>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="./productModifyPage.lo?product_id=<c:out value='${list.product_id}'/>">변경</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:Confirmation('${list.product_id}')"><font color=#FF8224>삭제</font></a>
					</c:if>
					
		
					
				</dd>
			</dl>
		</li>
		</c:forEach>
	
		
		
		<!-- 
		<li>
			<dl>
				<dt><img src="./images/sub/sam_event.jpg" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></dt>
				<dd>
					<span>[2014.00.00]</span>
					<strong><a href="./신청하기_View.html">호텔을 통째로 빌렸다.</a></strong>
					<span>상품설명.상품설명</span>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt><img src="./images/sub/sam_event.jpg" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></dt>
				<dd>
					<span>[2014.00.00]</span>
					<strong><a href="./신청하기_View.html">호텔을 통째로 빌렸다.</a></strong>
					<span>상품설명.상품설명</span>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt><img src="./images/sub/sam_event.jpg" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></dt>
				<dd>
					<span>[2014.00.00]</span>
					<strong><a href="./신청하기_View.html">호텔을 통째로 빌렸다.</a></strong>
					<span>상품설명.상품설명</span>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt><img src="./images/sub/sam_event.jpg" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></dt>
				<dd>
					<span>[2014.00.00]</span>
					<strong><a href="./신청하기_View.html">호텔을 통째로 빌렸다.</a></strong>
					<span>상품설명.상품설명</span>
				</dd>
			</dl>
		</li>
		<li>
			<dl>
				<dt><img src="./images/sub/sam_event.jpg" style="width:306px; height:437px;" alt="샘플 이벤트 이미지" /></dt>
				<dd>
					<span>[2014.00.00]</span>
					<strong><a href="./신청하기_View.html">호텔을 통째로 빌렸다.</a></strong>
					<span>상품설명.상품설명</span>
				</dd>
			</dl>
		</li>
		 -->
		
		
		</ul>
		<p class="c_both"></p>
	</div>
	<!-- //container -->