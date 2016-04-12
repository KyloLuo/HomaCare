<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
     <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css">
	 <link rel="stylesheet" href="<%=basePath %>css/personcenter.css" >
     <title>个人中心</title>
     
<style type="text/css">

.personsidebar{
	position: relative;
	float: left;
	width:14%;
	height:300px;
	margin-left: 40px;
	background: url("../img/titlebg.png");
}
.top-personsidebar{
	position: relative;
	width: 100%;
	height: 30%;
	padding-left: 30px;
	padding-top: 20px;
	
	
}
.middle-personsidebar{
	position: relative;
	width: 100%;
	height: 68%;
	background-color: white;
}
.personmaincontent{
	position: relative;
	float: right;
	width: 77%;
	height: 600px;
	margin-right: 40px;
	background-color:#ffffff;
}
ul.personallist{
	position: relative;
	list-style: none;
	width: 100%;
	height: 100%;
	-webkit-padding-start: 0px;
}
li{
	width: 100%;
	height:60px;
	padding-left: 50px;
	padding-top: 20px;
}
hr{
	position:relative;
	border-color: black;
	margin:0 auto;
	width: 100%;
}
span.dexing{
    font-family:Tahoma;
	color: white;
	font-size: 25pt;
}
.user{
	float: right;
	width: 100px;
	color: white;
	height: 80%;
	padding-top: 15px;
}
.currentplace{
	position: relative;
	width: 20%;
	height:30px;
	padding-top: 10px;
	padding-left: 10px;
}
.table_place{
	position: relative;
	width: 60%;
	min-height:400px;
	margin: 0 auto;
}
.table_place_div{
	position: relative;
	width: 70%;
	min-height:100px;
	margin: 0 auto;
}
.tablestyle{
	background-color: #e8eef7;
}
.trbg1{
	height: 64px;
	width: 100px;
	border: 1px solid #C1D1DB;
	color: #5F7485;
	text-align: center;
}
.trbg2{
	height: 64px;
	width: 200px;
	border: 1px solid #C1D1DB;
	color: #5F7485;
	text-align: center;
}
</style>
</head>
<body>
	<div class="top" >
		<div class="toptitle">
			<img src="<%=basePath %>img/titlephoto.png" width="100%" height="100%" />
		</div>
		<div class="menu">
			<div class="menubox" style="display: inline-block;margin-left: 20%">
				<div class="menuboxchoice">
				<a class="title" href="#" > 首页</a> 
				<a class="title" href="/Home-BasedCare/communityNews/listNews/0/15" >社区动态</a> 
				<a class="title" href="/Home-BasedCare/annoucement/list/0/15" >服务信息</a> 
				<a class="title" href="/Home-BasedCare/healthTip/listtips/0/15" >健康知识</a> 
				<a class="title" href="/Home-BasedCare/recreationInfo/list/0/15" >文化娱乐</a> 
				<a class="title" href="/Home-BasedCare/user/skiptologin" >个人登录</a>
				 
				</div>
			</div>
			<div class="user">欢迎:${sessionScope.user.realName}</div>
		</div>
		<hr >
	</div>
	
	<div class="personsidebar">
		<div class="top-personsidebar">
			<span class="dexing">德兴社区</span>
		</div>
		<div class="middle-personsidebar">
			<ul class="personallist">
				<li ><a class="b"  href="/Home-BasedCare/user/skipBasicInfo" ><span style="font-size: 12pt">基本信息</span></a></li>
				<hr/>
				<li ><a class="b"  href="/Home-BasedCare/healthProfile/${sessionScope.user.id}" ><span style="font-size: 12pt">信息档案</span></a></li>
				<hr/>
				<li ><a class="b"  href="/Home-BasedCare/message/skip" ><span style="font-size: 12pt">在线留言</span></a></li>
				<hr/>
			</ul>
		</div>
	</div>
	
	<div class="personmaincontent">
		<div class="currentplace">
			<img alt="" src="<%=basePath %>img/currentplace.png">
			基本信息
		</div>
		<div class="table_place">
			<table class="tablestyle"border="1px solid #C1D1DB">
				<tr>
					<td class="trbg1">身份证:</td>
					<td class="trbg2">${sessionScope.user.id}</td>
					<td class="trbg1">姓名:</td>
					<td class="trbg2">${sessionScope.user.realName}</td>
					
				</tr>
				<tr>
					<td class="trbg1">性别:</td>
					<td class="trbg2">${sessionScope.user.sex}</td>
					<td class="trbg1">名族:</td>
					<td class="trbg2">${sessionScope.user.ethnicity}</td>
				</tr>
				
				<tr>
					
					<td class="trbg1">出生日期:</td>
					<td class="trbg2"> <fmt:formatDate value="${sessionScope.user.bitrhday}" pattern="yyyy-MM-dd"/></td>
					<td class="trbg1">籍贯:</td>
					<td class="trbg2">${sessionScope.user.nativePlace}</td>
				</tr>
				
				<tr>
					
				</tr>
				<tr>
					<td class="trbg1">出生地:</td>
					<td class="trbg2">${sessionScope.user.birthPlace}</td>
					<td class="trbg1">婚姻状况:</td>
					<td class="trbg2">${sessionScope.user.maritalStatus}</td>
				<tr>
					<td class="trbg1">职业:</td>
					<td class="trbg2">${sessionScope.user.cooupation}</td>
					<td class="trbg1">受教育水平:</td>
					<td class="trbg2">${sessionScope.user.educatedLevel}</td>
				</tr>
				<tr>
					
					<td class="trbg1">住址:</td>
					<td class="trbg2">${sessionScope.user.address}</td>
					<td class="trbg1">电话号码:</td>
					<td class="trbg2">${sessionScope.user.phoneNum}</td>
				</tr>
			</table>
		</div>
		<div class="currentplace">
			<img alt="" src="<%=basePath %>img/currentplace.png">
			子女信息
		</div>
		<div class="table_place_div">
			<table class="tablestyle" border="1px solid #C1D1DB">
				<tr>
					
					<td class="trbg1">子女姓名:</td>
					<td class="trbg2">${sessionScope.child.name}</td>
					<td class="trbg1">联系方式:</td>
					<td class="trbg2">${sessionScope.child.address}</td>
					<td class="trbg1">住址:</td>
					<td class="trbg2">${sessionScope.child.phoneNum}</td>
				</tr>
			</table>
			</div>
	</div>
	

		
</body>
</html>