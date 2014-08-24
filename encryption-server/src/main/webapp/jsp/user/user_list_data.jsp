<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<%
%>
<c:set var="commaTF" value="false" scope="page" />
{"DATA" : [
<c:forEach var="userInfo" items="${userList}">
    <c:choose>
        <c:when test="${commaTF}">
            <c:out value="," />
        </c:when>
        <c:otherwise>
            <c:set var="commaTF" value="true" scope="page" />
        </c:otherwise>
    </c:choose>
    <c:choose>
        <c:when test="${userInfo['actYN'] eq 'Y'}">
            <c:set var="actYN" value="활성" scope="page" />
        </c:when>
        <c:otherwise>
            <c:set var="actYN" value="비활성" scope="page" />
        </c:otherwise>
    </c:choose>
    {
        "usrOid" : "<c:out value="${userInfo['usrOid']}" />",
        "usrName" : "<c:out value="${userInfo['usrName']}" />",
        "comName" : "<c:out value="${userInfo['comName']}" />",
        "loginId" : "<c:out value="${userInfo['loginId']}" />",
        "email" : "<c:out value="${userInfo['emailId']}@${userInfo['emailAccount']}" />",
        "mobile" : "<c:out value="${userInfo['mobile1']}-${userInfo['mobile2']}-${userInfo['mobile3']}" />",
        "created" : "<c:out value="${userInfo['created']}" />",
        "actYN" : "<c:out value="${actYN}" />"
    }
</c:forEach>
]}
