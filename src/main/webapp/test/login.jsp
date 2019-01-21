<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/demo/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>

<link rel="stylesheet"href="../js/layui/css/layui.css"media="all">
<script src="../js/layui/layui.js"></script>
</head>
<body>

	<div>
	<form action="/demo/user/login" class="layui-form" onsubmit="return false">
	账号：<input type="text" name="code" value='111' /><br> 
		密码：<input type="password" name="pass" /><br> 
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
	
<script type="text/javascript">

layui.use(["form","jquery"],function ()
{   var form=layui.form;
    var $=layui.jquery;
    form.on("submit(login)",function(data){
	$.ajax({
        type:"post",
        url:"/demo/user/login3",
        data:data.field,
		dataType:"json",
		tradtional:true,
		success: function(result)
		{
			
			console.log(result);
			alert(result.code);
			location.href="/demo/test/result.jsp";
		}
        });
		
	return false;	
	});
});
</script>

</body>
</html>