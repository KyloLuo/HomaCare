<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>
<head>
<base href="<%=basePath%>">

<title>居家养老服务系统>>社区动态</title>

<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" href="<%=basePath %>css/button.css">
<link rel="stylesheet" href="<%=basePath %>css/layout.css" type="text/css" media="screen" />
</head>
<body>
	<div id="head_content">
		<jsp:include page="../common/head.jsp"></jsp:include>
	</div>
	<div id="sidebar_content">
		<jsp:include page="../common/sidebar.jsp"></jsp:include>
	</div>
	
	<div id="listinfo_div">
    	<div id="info_div">
    		<ul >
    		<c:forEach items="${message_pageInfo.msgs}" var="list">
    			<li style="height: 100px">
    				<div style="margin-bottom: 5px;">留言日期：<fmt:formatDate value="${list.date}" pattern="yyyy-MM-dd "/></div>
    				<div>
    				<textarea rows="5" cols="60" disabled="disabled">${list.content}</textarea>
    				</div>
    			</li>
    			<hr />
    			</c:forEach>
    		</ul>
    	</div>
    
    		<div id="pageinfo_div">
	 		<a id="first" style="color: black;" href="/Home-BasedCare/message/querymsg/0/5">首页</a> 
            <a id="former" style="color: black;"
					href="/Home-BasedCare/message/querymsg/${message_pageInfo.currentPage-1}/5">上一页</a>
	 	    <a id="next" style="color: black;"
					href="/Home-BasedCare/message/querymsg/${message_pageInfo.currentPage+1}/5">下一页</a>
	 		<a id="last" style="color: black;"
					href="/Home-BasedCare/message/querymsg/${message_pageInfo.totalPages-1}/5">尾页</a>&nbsp;&nbsp;
	 		<span >共${message_pageInfo.totalCount}条</span>&nbsp;
	 	    <span >每页显示5条</span>&nbsp;
	 	    <span>第${message_pageInfo.currentPage+1}页</span>&nbsp;
	       </div>
    </div>
	
	
</body>


</html>
