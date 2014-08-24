<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<%
%>
<c:set var="commaTF" value="false" scope="page" />
{"DATA" : [
<c:forEach var="adminInfo" items="${adminList}">
    <c:choose>
        <c:when test="${commaTF}">
            <c:out value="," />
        </c:when>
        <c:otherwise>
            <c:set var="commaTF" value="true" scope="page" />
        </c:otherwise>
    </c:choose>
    {
        "admOid" : "<c:out value="${adminInfo['admOid']}" />",
        "name" : "<c:out value="${adminInfo['name']}" />",
        "loginId" : "<c:out value="${adminInfo['loginId']}" />",
        "powerOid" : "<c:out value="${adminInfo['powerOid']}" />",
        "email" : "<c:out value="${adminInfo['emailId']}@${adminInfo['emailDomain']}" />",
        "tel" : "<c:out value="${adminInfo['tel1']}-${adminInfo['tel2']}-${adminInfo['tel3']}" />",
        "created" : "<c:out value="${adminInfo['created']}" />"
    }
</c:forEach>
]}