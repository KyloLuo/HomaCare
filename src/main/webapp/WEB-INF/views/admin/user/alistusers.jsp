<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


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
    		<c:forEach items="${admin_userInfo_pageInfo.users}" var="list">
    			<li >
    				<span >身份证：</span>
    				<div class="info_userinfo_div">${list.id}</div>
    				<span >姓名：</span>
    				<div class="info_userinfo_div">${list.realName}</div>
    				<div class="info_options_div" > 
    				    <a href="/Home-BasedCare/user/queryuser/${list.id}" class="button button-glow button-rounded button-raised button-primary">查看信息</a>    				    
						<!--  <a onclick="del(${list.id})"  class="button button-glow button-rounded button-caution">删除用户</a>-->
	 			   </div>
    			</li>
    			<hr />
    			</c:forEach>
    		</ul>
    	</div>
    
    		<div id="pageinfo_div">
	 		<a id="first" style="color: black;" href="/Home-BasedCare/user/query/0/7">首页</a> 
            <a id="former" style="color: black;"
					href="/Home-BasedCare/user/query/${admin_userInfo_pageInfo.currentPage-1}/7">上一页</a>
	 	    <a id="next" style="color: black;"
					href="/Home-BasedCare/user/query/${admin_userInfo_pageInfo.currentPage+1}/7">下一页</a>
	 		<a id="last" style="color: black;"
					href="/Home-BasedCare/user/query/${admin_userInfo_pageInfo.totalPages-1}/7">尾页</a>&nbsp;&nbsp;
	 		<span >共${admin_userInfo_pageInfo.totalCount}条</span>&nbsp;
	 	    <span >每页显示7条</span>&nbsp;
	 	    <span>第${admin_userInfo_pageInfo.currentPage+1}页</span>&nbsp;
	       </div>
    </div>
	
	<script type="text/javascript">
     //删除 
	function del(id){
		var userid = id;
		$.ajax({
			url : '/Home-BasedCare/communityNews/deletenews/'+userid,
			type : 'POST',
			success : function(data) {
				console.log("success");
				window.location.href = "/Home-BasedCare/communityNews/delsuccess";
			},
			error : function(status) {
				console.log("failure");
			}
		});
	}

	
		var current = ${admin_userInfo_pageInfo.currentPage};
		var total = ${admin_userInfo_pageInfo.totalPages-1};
		console.log(total);
		console.log(current);
		if(current==0){
			$("#first").hide();
			$("#former").hide();
		}
		if(current==total){
			console.log("lalal");
			$("#next").hide();
			$("#last").hide();
		}

		
	</script>
<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
<script src="<%=basePath%>js/jquery.validate.js"></script>
</body>


</html>
