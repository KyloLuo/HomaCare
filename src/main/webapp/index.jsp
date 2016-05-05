<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
  <title>社区居家养老服务</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="pragma" content="no-cach" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="expires" content="0" /> 
    
    <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath %>css/index.css">

    

</head>

<body>
	<div class="top" >
		<div class="toptitle">
			<img src="<%=basePath %>img/titlephoto.png" width="100%" height="100%" />
		</div>
		<div class="menu">
			<div class="menubox">
				<div class="menuboxchoice">
				<a class="title" href="#" > 首页</a> 
				<a class="title" href="/Home-BasedCare/communityNews/listNews/0/15" >社区动态</a> 
				<a class="title" href="/Home-BasedCare/annoucement/list/0/15" >服务信息</a> 
				<a class="title" href="/Home-BasedCare/healthTip/listtips/0/15" >健康知识</a> 
				<a class="title" href="/Home-BasedCare/recreationInfo/list/0/15" >文化娱乐</a> 
				<a class="title" href="/Home-BasedCare/user/skiptologin" >信息查询</a> 
				</div>
			</div>
		</div>
	</div>
	
	<div class="main">
	 <div class="slideout" >
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators" style="bottom: 0px;">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" >
    <div class="item active">
      <img src="<%=basePath %>img/social1.jpg" width="100%" height="100%" alt="...">
      <div class="carousel-caption">
      </div>
    </div>
    <div class="item">
      <img src="<%=basePath %>img/social2.jpg" width="100%" height="100%" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    
    <div class="item">
      <img src="<%=basePath %>img/social3.jpg" width="100%" height="100%" alt="...">
      <div class="carousel-caption">
        ...
      </div>
    </div>
    
    <!-- 在此放置更多的图片 -->
    
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>

  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
		<div class="info" >
		     <!--社区动态  -->
		     <div class="communityservice">
			    	<c:import url="/communityNews/ConmunityService/6">
		    	    </c:import>
				 
		   </div>
			
              <!--服务信息 -->
			  <div class="serviceinfo">
					<c:import url="/annoucement/some/6">
		    	    </c:import>
		     </div>
			
			    <!--健康知识  -->
			  <div class="healthknowledge">
			    	<c:import url="/healthTip/HealthTip/6">
		    	    </c:import>
              </div>
			
			 <!--文化娱乐  -->
			  <div class="culture">
				 <c:import url="/recreationInfo/some/6">
		    	    </c:import>
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
	
</body>

    <script src="<%=basePath %>js/jquery-2.1.1.min.js"></script>
    <script src="<%=basePath %>js/bootstrap.min.js"></script>

</html>