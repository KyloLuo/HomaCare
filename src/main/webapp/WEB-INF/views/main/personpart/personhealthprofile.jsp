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
	min-height:500px;
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
			当前位置--健康档案
		</div>
		<div class="table_place">
			<table class="tablestyle"border="1px solid #C1D1DB">
				<tr>
					<td class="trbg1">身份证:</td>
					<td class="trbg2">${profile.userId}</td>
					<td class="trbg1">身高:</td>
					<td class="trbg2">${profile.height}cm</td>
					
				</tr>
				<tr>
					<td class="trbg1">体重:</td>
					<td class="trbg2">${profile.weight}kg</td>
					<td class="trbg1">血型:</td>
					<td class="trbg2">${profile.bloodType}</td>
				</tr>
				
				<tr>
					
					<td class="trbg1">运动习惯:</td>
					<td class="trbg2">${profile.exerciseHabits} </td>
					<td class="trbg1">家庭遗传病史:</td>
					<td class="trbg2">${profile.fhog}</td>
				</tr>
				
				<tr>
					
				</tr>
				<tr>
					<td class="trbg1">残疾情况:</td>
					<td class="trbg2">${profile.disability}</td>
					<td class="trbg1">自理能力:</td>
					<td class="trbg2">${profile.selfCareAbility}</td>
				<tr>
					<td class="trbg1">老年痴呆:</td>
					<td class="trbg2">${profile.dementia}</td>
					<td class="trbg1">高血压:</td>
					<td class="trbg2">${profile.hypertension}</td>
				</tr>
				<tr>
					<td class="trbg1">冠心病:</td>
					<td class="trbg2">${profile.coronaryHeartDisease}</td>
					<td class="trbg1">糖尿病:</td>
					<td class="trbg2">${profile.diabetes}</td>
				</tr>
				<tr>
					<td class="trbg1">脂肪肝:</td>
					<td class="trbg2">${profile.fattyLiver}</td>
				</tr>
			</table>
		</div>
	</div>
	

		
</body>
</html>