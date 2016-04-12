<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath %>css/layout.css" type="text/css" media="screen" />
<link rel="stylesheet" href="<%=basePath %>css/button.css">
<style type="text/css">
#head_content {
	position: relative;
	height: 95px;
	width: 100%;
}

#sidebar_content {
	position: relative;
	width: 23%;
	margin-top: -6px;
	height: 900px;
	min-height: 500px;
	float: left;
	background: #E0E0E3 url(<%=basePath%>img/sidebar.png) repeat;
}

#main_content {
	position: relative;
	width: 77%;
	min-height: 950px;
	margin-top: -6px;
	float: left;
	padding-top:10px;
	background-color: #F5F5F5;
}
#infotitle{
	position: relative;
	width: 150px;
	height: 40px;
	margin: 5px auto;
	text-align:center;
	font-family: Helvetica, Tahoma, Arial, STXihei, "华文细黑", Heiti, "黑体",
		"Microsoft YaHei", "微软雅黑", SimSun, "宋体", sans-serif;
	font-size:20pt;


}
#basicform{
	position: relative;
	margin:0 auto;
	width: 80%;
	height: 850px;
	padding-top: 5px;
	border-style:solid;
	border-radius:5px;
	border-width:1px;
	border-color: black;
}
#tab{
	position: relative;
	width: 100%;
	height: 100%;
}
.tab_tr{
	position: relative;
	width:100%;
	height: 20px;
}
.tab_td1{
	position: relative;
	width: 30%;
}
.tab_td2{
	position: relative;
	width: 70%;
}
#basicinfo{
	position: relative;
	margin: 20px auto;
	width: 90%;
	height: 80%;
}
.eachinfo_div{

	position: relative;
	width: 40%;
	height: 8%;
	margin: 15px auto;

}
.healthprofile{
    float:right;
    display:block;
	position:relative;
	width: 200px;
	height: 60px;
	margin-left:60px;
	margin-right:10px;
	
}
span.attribute{
    display:inline-block;
	font-size: 15pt;
	margin-right: 10px;
}
.form-control{
	width: 152px;
	display: inline-block;
}
.gender{
	display: inline-block;
	width: 120px;
	height: 30px;
	padding-left: 20px;
}
.tipfm{
	font-family: Helvetica, Tahoma, Arial, STXihei, "华文细黑", Heiti, "黑体",
		"Microsoft YaHei", "微软雅黑", SimSun, "宋体", sans-serif;
}
.birline{
	position: relative;
	width: 50%;
	height: 40px;
	margin: 15px auto;
	padding: 5px auto;
}
.jiguan{
	position: relative;
	width: 40%;
	height: 40px;
	margin: 15px auto;

}
.bir{
	position: relative;
	width: 40%;
	height: 40px;
	margin: 15px auto;

}
.marriage{
	display: inline-block;
	width: 150px;
	height: 30px;
	padding-left: 20px;
}
.occ{
	position: relative;
	width: 40%;
	height: 40px;
	margin: 15px auto;

}
/*提交按钮的样式*/
#submit_div1{
	position: relative;
	margin: 60px auto;
	width: 90px;
	height: 50px;
}
#sub1{
	position: relative;
	width: 100%;
	height: 100%;
	font-size: 15pt;
	background-color: #4169E1;
	cursor:pointer;
}
</style>
</head>
<body>
	<div id="head_content">
		<jsp:include page="../common/head.jsp"></jsp:include>
	</div>
	<div id="sidebar_content">
		<jsp:include page="../common/sidebar.jsp"></jsp:include>
	</div>
	<div id="main_content">
		
				<div id="infotitle">基本信息</div>
	 <form id="basicform">
		<div id="basicinfo">
		    <a id="addchild" href="/Home-BasedCare/user/skiptoadd/${queryusercontent.id}"  class="button button-glow button-rounded button-raised button-primary">添加子女信息</a>
		  	<a id="addchilded" href="/Home-BasedCare/user/querychild/${queryusercontent.id}"  class="button button-glow button-rounded button-raised button-primary">查看子女信息</a>
			<div class="healthprofile">
		  	 <a id="addhp" href="/Home-BasedCare/healthProfile/add/${queryusercontent.id}"  class="button button-glow button-rounded button-raised button-primary">添加个人档案</a>
		  	 <a id="addhped" href="/Home-BasedCare/healthProfile/query/${queryusercontent.id}"  class="button button-glow button-rounded button-raised button-primary">查看个人档案</a>
		  	
		  </div>
		  <div class="eachinfo_div" >
			<span class="attribute" >身份证</span>
			<input type="text" class="form-control" id="id" value="${queryusercontent.id}" disabled="disabled" />
		  </div>
		  
		  
		  <div class="eachinfo_div">
			<span class="attribute">姓名</span>
			<input type="text" class="form-control" id="realname" value="${queryusercontent.realName}" disabled="disabled" />
		  </div>
		  <div class="eachinfo_div">
			<span class="attribute">密码</span>
			<input type="text" class="form-control" id="password" value="${queryusercontent.password}" disabled="disabled"/>
		  </div>
		   <div class="eachinfo_div">
			<span class="attribute">性别</span>
			<div class="gender">
			<input type="text" class="form-control" id="sex" value="${queryusercontent.sex}" disabled="disabled"/>
 			</div>
           </div>
           <div class="eachinfo_div" >
			<span class="attribute">名族</span>
			<input type="text" class="form-control" id="ethnicity" value="${queryusercontent.ethnicity}" disabled="disabled"/>
		  </div>
		  <div class="birline">
		  	<span class="attribute">出生日期</span>
		  	<input type="text" style="width: 88px" id="time" value="${queryusercontent.bitrhday}" pattern="yyyy-MM-dd" disabled="disabled">&nbsp;&nbsp;
		  	
		  </div>
		
		 <div class="jiguan">
		 	<span class="attribute">籍贯</span>
		 	<input type="text" style="width: 120px" id="province" value="${queryusercontent.nativePlace}" disabled="disabled">
		 </div>
		 <div class="bir">
		 	<span class="attribute">出生地</span>
		 	<input type="text" style="width: 110px" id="birthPlace" value="${queryusercontent.birthPlace}" disabled="disabled">
		 </div>
		 <div class="eachinfo_div" style="width: 300px">
			<span class="attribute">婚姻状况</span>
			<div class="marriage">
			<input type="text" style="width: 110px" id="maritalStatus" value="${queryusercontent.maritalStatus}" disabled="disabled">
		    </div>
		</div>
		  <div class="occ">
		 	<span class="attribute">职业</span>
		 	<input type="text" style="width: 110px" id="occupation" value="${queryusercontent.cooupation}" disabled="disabled">
		 </div>
		 <div class="occ">
		 	<span class="attribute">受教育水平</span>
		 	<input type="text" style="width: 110px" id="educatedLevel" value="${queryusercontent.educatedLevel}" disabled="disabled">

		 </div>
		  <div class="occ" style="width: 300px;">
		 	<span class="attribute">住址</span>
		 	<input type="text" style="width: 230px" id="address" value="${queryusercontent.address}" disabled="disabled">
		 </div>
		 <div class="occ" style="width: 300px;"> 
		 	<span class="attribute" >电话</span>
		 	<input type="text" style="width: 150px" id="phoneNum" value="${queryusercontent.phoneNum}" disabled="disabled">
		 </div>
		 
		</div>
	</form>
	
	</div>
	
	<script type="text/javascript">
	 
		var data = ${hpuserid};
		console.log(data);
		if(data!="0"){
			$("#addhp").hide();
		}else
			$("#addhped").hide();
		
		var child =${childid};
		if(child=="1"){
			$("#addchild").hide();
		}else
			$("#addchilded").hide();
	</script>
	<script src="<%=basePath%>js/jquery-2.1.1.min.js"></script>
</body>
</html>