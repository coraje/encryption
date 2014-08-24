<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<%
%>
<c:set var="commaTF" value="false" scope="page" />
{"DATA" : [
<c:forEach var="qnaInfo" items="${qnaList}">
    <c:choose>
        <c:when test="${commaTF}">
            <c:out value="," />
        </c:when>
        <c:otherwise>
            <c:set var="commaTF" value="true" scope="page" />
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${qnaInfo['lockYN'] eq 'Y'}">
            <c:set var="lockYN" value="공개" scope="page" />
        </c:when>
        <c:otherwise>
            <c:set var="lockYN" value="비공개" scope="page" />
        </c:otherwise>
    </c:choose>
    <c:choose>
    	<c:when test="${qnaInfo['parentOid'] eq '0'}">
	    	{
	        "qnaOid" : "<c:out value="${qnaInfo['qnaOid']}" />",
	        "subject" : "<c:out value="${qnaInfo['orderLevel']}${qnaInfo['subject']}" />",
	        "creatorName" : "<c:out value="${qnaInfo['creatorName']}" />",
	        "created" : "<c:out value="${qnaInfo['created']}" />",
	        "lockYN" : "<c:out value="${lockYN}" />"
	    	}
    	</c:when>
    	<c:otherwise>
	    	{
	        "qnaOid" : "<c:out value="${qnaInfo['qnaOid']}" />",
	        "subject" : "<c:out value="${qnaInfo['orderLevel']}${qnaInfo['subject']}" />",
	        "creatorName" : "<c:out value="${qnaInfo['answerName']}" />",
	        "created" : "<c:out value="${qnaInfo['created']}" />",
	        "lockYN" : "<c:out value="${lockYN}" />"
		    }
    	</c:otherwise>
    </c:choose>
</c:forEach>
]}