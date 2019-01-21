<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/demo/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/demo/js/layui/css/layui.css">
<script src="/demo/js/layui/layui.js"> </script>
<style type="text/css">
	
</style>
</head>
<body>
<div id="div1">
	<form action="/demo/user/login" class="layui-form" onsubmit="return false">
<!-- 	/demo/user/login?code=111&pass=abc -->
<% request.getParameter("code"); %>
	<div class="layui-form-item">
		<div class="layui-input-inline">
			<input placeholder="账号" type="text" name="code" required lay-verify="required" class="layui-input" autocomplete="off"/>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-inline">
			<input placeholder="密码" type="password" name="code" required lay-verify="required" class="layui-input" autocomplete="off"/>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-inline">
			<input placeholder="验证码" name="authcode" type="text" required lay-verify="required" class="layui-input" autocomplete="off"/>
			<div id="bb"></div>
			<img src = "/demo/user/authcode" onclick = "this.src='/demo/user/authcode?' + Math.random()">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-inline">
		&nbsp;&nbsp;&nbsp;
			<button class="layui-btn" lay-submit lay-filter="login">提交</button>&nbsp;&nbsp;&nbsp;
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>	
		
	</form>
	</div>
	
	<br><br><br><br>
	<button onclick="aa()">AA</button>
	<script type="text/javascript">
		layui.use(["form","jquery"], function(){
			var form = layui.form;
			var $ = layui.jquery;
			form.on("submit(login)", function(data){
				$.ajax({
					type:"post",
			        url:"/demo/user/login",
			        dataType:"json",
			        data:data.field, //传送给java端{name:value,.......}格式的数据
			        success: function(result){
			        	if(result){
			        		//作用：改变浏览器地址栏当中的地址
				            location.href="/demo/test/result.jsp";   //一个bom对象，浏览器内置对象
				            //常用bom对象：window,history,location
			        	}else{
			        		$("#bb").html("验证码错误,请重新输入");
			        	}
			        		
			            
			        }
				});
			});
		});
// 		function aa() {
// 			$.ajax({
// 				type : "get",
// 				url : "/demo/user/login",
// 				dataType : "text",//json:返回JSON数据 。text:返回纯文本字符串
// 				data : {
// 					code : $("[name='code']").val(),
// 					pass : $("[name='pass']").val(),
// 					authcode: $("[name='authcode']").val()
// 				}, //data发送到服务器的数据。
// 				success : function(data) {
// 					alert(data)
// 					console.log(typeof data);
// 					console.log(data);
// 				}
// 			})
// 		}
	</script>
</body>
</html>
