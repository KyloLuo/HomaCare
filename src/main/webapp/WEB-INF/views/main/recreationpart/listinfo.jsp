<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>居家养老服务系统>>文化娱乐</title>
    
    <meta http-equiv="content-type" content="text/html;charset=utf-8">
	
	<link rel="stylesheet" href="<%=basePath %>css/listcontent.css">
	<script src="<%=basePath %>js/jquery-2.1.1.min.js"></script>



  </head>
  
  <body>
    
	<div class="top" >
		<div class="toptitle" >
			<img src="<%=basePath %>img/titlephoto.png" width="100%" height="100%"  />
		</div>
		<div class="menu">
			<div class="menubox">
				<ul style="padding-left: 0px;margin-bottom: 0px;">
					<li class="titleli"><a class="title" href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
					<li class="titleli"><a class="title" href="/Home-BasedCare/communityNews/listNews/0/15">社区动态</a></li>
					<li class="titleli"><a class="title" href="/Home-BasedCare/annoucement/list/0/15">服务信息</a></li>
					<li class="titleli"><a class="title" href="/Home-BasedCare/healthTip/listtips/0/15">健康知识</a></li>
					<li class="titleli"><a class="title" href="/Home-BasedCare/recreationInfo/list/0/15">文化娱乐</a></li>
					<li class="titleli"><a class="title" href="/Home-BasedCare/user/skiptologin">信息查询</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="main">
	 	<div class="maintitle">
	 		<div class="titlelocationleft">
	 			<div class="arrowimg">
	 		    <img  src="<%=basePath %>img/arrow.png">
	 		    </div>
	 			<div class="fontdiv">文化娱乐
	 			</div>
	 		</div>
	 		<div class="titlelocationright">
	 			<div class="locationinfo">
	 				你的位置 > 文化娱乐
	 			</div>
	 		</div>
	 	</div>
	 	<hr class="topline"/>
	 	<div class="maininfo">
	 		<ul class="ullist">
	 		<c:forEach items="${recreationInfo_pageInfo.info}" var="list">
	 			<li class="infoli"><img  src="<%=basePath %>img/arrow1.png" >
	 			   <a class="b" href="${pageContext.request.contextPath}/recreationInfo/${list.id}">${list.title }</a>
	 			   <div class="date"> <fmt:formatDate value="${list.releaseTime}" pattern="yyyy-MM-dd "/>
	 			   </div>
	 			 </li>
			</c:forEach>
	 		</ul>
	 	</div>
	 	<div class="page_div">
	 		<div class="pageinfo">
	 		<a  id="first" href="/Home-BasedCare/recreationInfo/list/0/15">首页</a> 
            <a id="former" href="/Home-BasedCare/recreationInfo/list/${recreationInfo_pageInfo.currentPage-1}/15">上一页</a>
	 	    <a id="next" href="/Home-BasedCare/recreationInfo/list/${recreationInfo_pageInfo.currentPage+1}/15">下一页</a>
	 		<a id="last" href="/Home-BasedCare/recreationInfo/list/${recreationInfo_pageInfo.totalPages-1}/15">尾页</a>&nbsp;&nbsp;
	 		<span>共${recreationInfo_pageInfo.totalCount}条</span>&nbsp;
	 	    <span>每页显示15条</span>&nbsp;
	 	    <div id="page" style="display: inline-block;">第${recreationInfo_pageInfo.currentPage+1}页</div>
	 		</div>
	 	</div>
	</div>
	<div class="foot">
		<div class="footbasic">
		  <div class="footbasicinfo">
		         <span style="color: white;">版权所有：太仓市城厢镇德兴社区　Copyright @ 2015-2016 All Rights Reserved 　苏ICP备10218904号 </span>
		  </div>
		</div>
	</div>
	<script type="text/javascript">
		var current = ${recreationInfo_pageInfo.currentPage}
		console.log(current);
		console.log(${recreationInfo_pageInfo.totalPages});
		if(current==0){
			$("#first").hide();
			$("#former").hide();
		}
		if(current==${recreationInfo_pageInfo.totalPages-1}){
			console.log("lalal");
			$("#next").hide();
			$("#last").hide();
		}

		
	</script>

  </body>
</html>
