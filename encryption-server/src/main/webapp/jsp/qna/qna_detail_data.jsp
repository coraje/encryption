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
    {
        "qnaOid" : "<c:out value="${qnaInfo['qnaOid']}" />",
        "subject" : "<c:out value="${qnaInfo['subject']}" />",
        "creatorName" : "<c:out value="${qnaInfo['creatorName']}" />",
        "answerName" : "<c:out value="${qnaInfo['answerName']}" />",
        "created" : "<c:out value="${qnaInfo['created']}" />",
        "lockYN" : "<c:out value="${qnaInfo['lockYN']}" />"
    }
</c:forEach>
]}