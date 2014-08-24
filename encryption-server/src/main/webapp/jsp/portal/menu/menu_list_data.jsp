<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<%
%>
<c:set var="commaTF" value="false" scope="page" />
<c:set var="popYN" value="팝업" scope="page" />
<c:set var="actYN" value="활성" scope="page" />
{"DATA" : [
<c:forEach var="menuInfo" items="${menuList}">
    <c:choose>
        <c:when test="${commaTF}">
            <c:out value="," />
        </c:when>
        <c:otherwise>
            <c:set var="commaTF" value="true" scope="page" />
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${menuInfo['popYN'] eq 'Y'}">
            <c:set var="popYN" value="팝업" scope="page" />
        </c:when>
        <c:otherwise>
            <c:set var="popYN" value="페이지" scope="page" />
        </c:otherwise>
    </c:choose>

    <c:choose>
        <c:when test="${menuInfo['actYN'] eq 'Y'}">
            <c:set var="actYN" value="활성" scope="page" />
        </c:when>
        <c:otherwise>
            <c:set var="actYN" value="비활성" scope="page" />
        </c:otherwise>
    </c:choose>
    {
        "mnuOid" : "<c:out value="${menuInfo['mnuOid']}" />",
        "mnuName" : "<c:out value="${menuInfo['mnuName']}" />",
        "mnuUrl" : "<c:out value="${menuInfo['mnuUrl']}" />",
        "creatorOid" : "<c:out value="${menuInfo['creatorOid']}" />",
        "creatorName" : "<c:out value="${menuInfo['creatorName']}" />",
        "amenderOid" : "<c:out value="${menuInfo['amenderOid']}" />",
        "amenderName" : "<c:out value="${menuInfo['amenderName']}" />",
        "mnuOrder" : "<c:out value="${menuInfo['mnuOrder']}" />",
        "parentOid" : "<c:out value="${menuInfo['parentOid']}" />",
        "created" : "<c:out value="${menuInfo['created']}" />",
        "modified" : "<c:out value="${menuInfo['modified']}" />",
        "popYN" : "<c:out value="${popYN}" />",
        "actYN" : "<c:out value="${actYN}" />"
    }
</c:forEach>
]}