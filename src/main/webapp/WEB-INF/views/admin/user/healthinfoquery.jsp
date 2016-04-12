<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<link rel="stylesheet" href="<%=basePath %>css/bootstrap.min.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="<%=basePath %>css/flat-ui.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="<%=basePath %>css/layout.css" type="text/css"
	media="screen" />	




<title>主界面</title>


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
	height: 1000px;
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
	width: 80%;
	height: 80%;
	padding-left: 50px;
}
.eachinfo_div{

	position: relative;
	width: 40%;
	height: 8%;
	margin: 15px auto;

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
.selfCareAbility{
	display: inline-block;
	width: 220px;
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
.disease{
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
	<div id="main_content" style="height: 1300px">
	<div id="infotitle">健康档案</div>
	<form id="basicform">
		<div id="basicinfo">
		  <div class="eachinfo_div" style="width: 45%;">
			<span class="attribute" >身份证</span>
			<input type="text"  style="color: black;width: 140px"  id="id" value="${healthprofile.userId}" disabled="disabled" />
		  </div>
		  
		  <div class="eachinfo_div">
			<span class="attribute">身高</span>
			<input type="text" style="width: 120px" id="height" value="${healthprofile.height}" disabled="disabled">单位：cm
		  </div>
		  <div class="eachinfo_div">
			<span class="attribute">体重</span>
			<input type="text" style="width: 120px" id="weight" value="${healthprofile.weight}" disabled="disabled">单位：kg
		  </div>
		 <div class="occ">
		 	<span class="attribute">血型</span>
		 	<input type="text" style="width: 120px" id="weight" value="${healthprofile.bloodType}" disabled="disabled">

		 </div>
		 <div class="eachinfo_div" style="width: 350px">
			<span class="attribute">运动习惯</span>
			<input type="text" style="width: 120px" id="exerciseHabits" value="${healthprofile.exerciseHabits}" disabled="disabled">
		  </div>
		  <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">家庭遗传病史</span>
			<input type="text" style="width: 120px" id="fhog" value="${healthprofile.fhog}" disabled="disabled">
		  </div>
		  <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">残疾情况</span>
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.disability}" disabled="disabled">
		  </div>
		   <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">自理能力</span>
			<div class="selfCareAbility">
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.selfCareAbility}" disabled="disabled">
			</div>
 			 </div>
 			 
 			 <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">老年痴呆</span>
			<div class="selfCareAbility">
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.dementia}" disabled="disabled">
			</div>
 			</div>
           
           <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">高血压</span>
			<div class="disease">
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.hypertension}" disabled="disabled">
			</div>
		    </div>
		    
		    <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">冠心病</span>
			<div class="disease">
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.coronaryHeartDisease}" disabled="disabled">
			</div>
		    </div>
		    
		    <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">糖尿病</span>
			<div class="disease">
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.diabetes}" disabled="disabled">
		    </div>
		    </div>
		    
		    <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">脂肪肝</span>
			<div class="disease">
			<input type="text" style="width: 120px" id="disability" value="${healthprofile.fattyLiver}" disabled="disabled">
			</div>
		    </div>
		  
		</div>
	</form>
	</div>
		
	
	
<script src="<%=basePath%>js/back/jquery-1.5.2.min.js"></script>	
<script src="<%=basePath%>js/back/jquery.js"></script>
<script src="<%=basePath%>js/back/jquery.validate.js"></script>
<script src="<%=basePath%>js/test/application.js"></script>
<script src="<%=basePath%>js/test/flat-ui.min.js"></script>	
<script src="<%=basePath%>js/test/jquery.min.js"></script>
<script src="<%=basePath%>js/test/video.js"></script>		

</body>
</html>