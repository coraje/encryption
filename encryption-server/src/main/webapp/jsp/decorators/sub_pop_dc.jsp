<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page" %>
<%@ include file="/jsp/common/commonAttribute.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>통째로빌렸다</title>
		 
        <!-- Common CSS import -->
        <link rel="stylesheet" type="text/css" href="${_ContextPath}/css/sub.css" />
		
        <!-- Common JS import -->
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" />
		<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
		<script type="text/javascript" src="${_ContextPath}/js/common.gnb-left.js"></script>
		<script type="text/javascript" src="${_ContextPath}/js/jquery.number.js"></script>
		<script type="text/javascript" src="${_ContextPath}/js/jquery.ui.datepicker-ko.js"></script>
        
        <decorator:head />
	</head>
    <body>
            
                <!-- CONTENT 영역 ST. -->
                    <decorator:body />
                <!-- CONTENT 영역 ED. -->
        
	</body>
</html>