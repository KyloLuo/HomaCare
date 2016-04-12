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
		  <div class="eachinfo_div" style="width: 50%">
			<span class="attribute" >身份证</span>
			<input type="text"  style="color: black;width: 150px"  id="id" value="${userid}" disabled="disabled" />
		  </div>
		  
		  <div class="eachinfo_div">
			<span class="attribute">身高</span>
			<input type="text" style="width: 120px" id="height">单位：cm
		  </div>
		  <div class="eachinfo_div">
			<span class="attribute">体重</span>
			<input type="text" style="width: 120px" id="weight">单位：kg
		  </div>
		 <div class="occ">
		 	<span class="attribute">血型</span>
		 	<select id="se1"style="width: 90px;height: 30px">
				<option style="width: 90px;height: 30px">A</option>
				<option style="width: 90px;height: 30px">B</option>
				<option style="width: 90px;height: 30px">AB</option>
				<option style="width: 90px;height: 30px">O</option>
				<option style="width: 90px;height: 30px">其他</option>
			</select>
		 </div>
		 <div class="eachinfo_div" style="width: 350px">
			<span class="attribute">运动习惯</span>
			<input type="text" style="width: 200px" id="exerciseHabits">
		  </div>
		  <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">家庭遗传病史</span>
			<input type="text" style="width: 200px" id="fhog">
		  </div>
		  <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">残疾情况</span>
			<input type="text" style="width: 200px" id="disability">
		  </div>
		   <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">自理能力</span>
			<div class="selfCareAbility">
			<input type="radio" checked="checked" name="selfCareAbility" id="r" value="弱">&nbsp;&nbsp;<span style="font-size: 12pt">弱</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="selfCareAbility" id="y" value="一般"><span style="font-size: 12pt">一般</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="selfCareAbility" id="q" value="强"><span style="font-size: 12pt">强</span>
 			</div>
 			 </div>
 			 <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">老年痴呆</span>
			<div class="selfCareAbility">
			<input type="radio" checked="checked" name="dementia" id="Ydementia" value="有">&nbsp;&nbsp;<span style="font-size: 12pt">有</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="dementia" id="Ndementia" value="无"><span style="font-size: 12pt">无</span>
 			</div>
 			</div>
           
           <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">高血压</span>
			<div class="disease">
			<input type="radio" checked="checked" name="hypertension" id="Yhypertension" value="有">&nbsp;&nbsp;<span style="font-size: 12pt">有</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="hypertension" id="Nhypertension" value="无"><span style="font-size: 12pt">无</span>		
		    </div>
		    </div>
		    
		    <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">冠心病</span>
			<div class="disease">
			<input type="radio" checked="checked" name="coronaryHeartDisease" id="YcoronaryHeartDisease" value="有">&nbsp;&nbsp;<span style="font-size: 12pt">有</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="coronaryHeartDisease" id="NcoronaryHeartDisease" value="无"><span style="font-size: 12pt">无</span>		
		    </div>
		    </div>
		    
		    <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">糖尿病</span>
			<div class="disease">
			<input type="radio" checked="checked" name="diabetes" id="Ydiabetes" value="有">&nbsp;&nbsp;<span style="font-size: 12pt">有</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="diabetes" id="Ndiabetes" value="无"><span style="font-size: 12pt">无</span>		
		    </div>
		    </div>
		    
		     <div class="eachinfo_div" style="width: 400px">
			<span class="attribute">脂肪肝</span>
			<div class="disease">
			<input type="radio" checked="checked" name="fattyLiver" id="YfattyLiver" value="有">&nbsp;&nbsp;<span style="font-size: 12pt">有</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			<input type="radio"  name="fattyLiver" id="NfattyLiver" value="无"><span style="font-size: 12pt">无</span>		
		    </div>
		    </div>
		  
		 
		 <div id="submit_div1">
			<button id="sub1" type="submit">
			提交
			</button>
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
	<script type="text/javascript">
	//input框为空的判断 
	 $().ready(function() {
           $("#sub1").click(function (){
        	   var id = $("#id").val();
				 $.ajax({
						url : '/Home-BasedCare/healthProfile/create/'+id,
						type : 'POST',
						contentType : 'application/json',
						async:false,
						data:JSON.stringify(com()),
						success : function(data) {
							alert("添加成功!");
						},
						error : function(status) {
							alert(data);
						}
					});
			 });
	 });

		
		function com(){
			console.log("hahhaahahh")
			var json= {
			 "id":$("#id").val(),
			 "height":$("#height").val(),
			 "weight":$("#weight").val(),
			 "bloodType": $("#se1 option:selected").text(),
			 "exerciseHabits":$("#exerciseHabits").val(),
			 "fhog":$("#fhog").val(),
			 "disability":$("#disability").val(),
			 "selfCareAbility":$('input:radio[name="selfCareAbility"]:checked').val(),
			 "dementia":$('input:radio[name="dementia"]:checked').val(),
			 "hypertension":$('input:radio[name="hypertension"]:checked').val(),
			 "coronaryHeartDisease":$('input:radio[name="coronaryHeartDisease"]:checked').val(),
			 "diabetes":$('input:radio[name="diabetes"]:checked').val(),
			 "fattyLiver":$('input:radio[name="fattyLiver"]:checked').val(),
			};
			return json;
		}
	</script>
</body>
</html>