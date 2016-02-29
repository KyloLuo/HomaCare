<%@ page language="java" contentType="text/html; charset=gb2312"
	pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<title></title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">

<style type="text/css">
body {
	margin: 0;
	padding: 0;
	font-family: "Microsoft Yahei";
	font-size: 12px;
	background-image: url("<%=basePath%>img/dust.png");
	list-style: none;
	height: 100%;
	overflow: auto;
}

/* �����div�� */
#content_div {
	width: 100%;
	height: 100%;
	position: relative;
	overflow: auto;
}
/* ͷ�� */
.top {
	position: relative;
	width: 70%;
	height: 180px;
	margin: 0 auto;
	text-align: center;
}

.toptitle {
	position: absolute;
	display: table-cell;
	vertical-align: middle;
	text-align: center;
	width: 100%;
	height: 80%;
}

/* �˵��� */
.menu {
	position: absolute;
	width: 100%;
	height: 20%;
	bottom: 0;
	background: #FF6600;
	padding-bottom: 5px;
}

.menubox {
	position: relative;
	width: 80%;
	height: 80%;
	margin: 2px auto 0px;
	background: #FF6600;
}

.menuboxchoice {
	position: relative;
	width: 90%;
	height: 70%;
	margin: 8px auto;
	background: #FF6600;
	font-size: 15pt;
}

/* �������е�������������*/
a.title:link {
	background-color: #FF6600;
	color: #FFF;
	text-decoration: none;
}

a.title:visited {
	background-color: #FF6600;
	color: #FFF;
	text-decoration: none;
}

a.title:hover {
	background-color: #FFF;
	color: #FF6600;
}

a.title:active {
	background-color: #FF6600;
	color: #FFF;
}

a.title {
	display: inline-block;
	width: 100%;
	font-size: 14pt;
}

.titleli {
	display: inline-block;
	background: #FF6600);
	width: 15%
}
/* ���岿�� */
#main {
	position: relative;
	width: 70%; 
	min-height:800px;
	height:auto ! important;
	margin : 10px auto;
	border: 1px solid #ccc;
	background-color: #fff;
	overflow: auto;
}

.locationinfo {
	position: absolute;
	width: 94%;
	height: 30px;
	top: 2%;
	left: 3%;
	right: 3%;
}
/*λ������ */
a.location:link {
	background-color: #FFF;
	color: #000;
	text-decoration: none;
}

a.location:visited {
	background-color: #FFF;
	color: #000;
	text-decoration: none;
}

a.location:hover {
	background-color: #FFF;
	color: #FF6600;
}

a.location:active {
	background-color: #FFF;
	color: #000;
}

a.location {
	font-size: 12pt;
}

/* ���µ����岿�� */
#content {
	position: absolute;
	width: 94%; 
	top : 4%; 
	left: 3%;
	right: 3%;
	overflow: auto;
}

/* ���µı���  */
.articletitle {
	position: relative;
	width: 75%;
	margin: 10px auto;
	height: 5%;
	text-align: center;
	font-size: 2em;
	font-weight: bold;
}
/* ���µ�ʱ��ͱ���  */
.dateandauthor {
	position: relative;
	width: 75%;
	margin: 5px auto;
	height: 25px;
	text-align: center;
	font-weight: bold;
	background-color: #E3E3E3;
	padding-top: 15px;
}

/* ���µ���������   */
#articlecontent {
	position: relative;
	width: 90%;
	height:90%;
	margin: auto;
	font-size: 13pt;
	overflow: auto;
	
}
.autosuit_div{
	width: 94%;
	height: 1px;
	clear:both;
}
/* �ײ� */
.foot {
	position: relative;
	margin: 10px auto;
	width: 70%;
	height: 100px;
	background: url("<%=basePath%>img/titlebg.png");
}

.footbasic {
	position: absolute;
	width: 100%;
	height: 30%;
	bottom: 5px;
	background: url("<%=basePath%>img/titlebg.png");
}

.footbasicinfo {
	position: relative;
	width: 80%;
	height: 100%;
	margin: 0 auto;
	background: url("<%=basePath%>img/titlebg.png");
	text-align: center;
}
</style>
</head>
<body>
	<div id="content_div">

		<div class="top">
			<div class="toptitle">
				<img src="<%=basePath%>img/titlephoto.png" width="100%"
					height="100%" />
			</div>
			<div class="menu">
				<div class="menubox">
					<ul style="padding-left: 0px; margin-bottom: 0px;">
						<li class="titleli"><a class="title" href="${pageContext.request.contextPath}/index.jsp">��ҳ</a></li>
						<li class="titleli"><a class="title" href="/Home-BasedCare/communityNews/listNews/0/15">������̬</a></li>
						<li class="titleli"><a class="title" href="#">������Ϣ</a></li>
						<li class="titleli"><a class="title" href="/Home-BasedCare/healthTip/listtips/0/15">����֪ʶ</a></li>
						<li class="titleli"><a class="title" href="#">�Ļ�����</a></li>
						<li class="titleli"><a class="title" href="#">���˵�¼</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="main">
			<div class="locationinfo">
				<span style="font-size: 12pt">��ǰλ��: ><a class="location"
					href="/Home-BasedCare/healthTip/listtips/0/15"">����֪ʶ</a><span
					style="font-size: 12pt">>����</span></span>
			</div>
			<div id="content">
				<div class="articletitle">${current_tip.title}</div>
				<div class="dateandauthor">���ڣ� <fmt:formatDate value="${current_tip.releaseTime}" pattern="yyyy-MM-dd"/>
					����Ϣ��Դ����${current_tip.source}</div>
				<div id="articlecontent">${current_tip.content}</div>
			</div>

		</div>
		<div class="foot">
			<div class="footbasic">
				<div class="footbasicinfo">
					<span style="color: white;">��Ȩ���У�̫���г������������ Copyright @
						2012-2014 All Rights Reserved ��ICP��10218904�� </span>
				</div>
			</div>
		</div>
	</div>

</body>
</html>