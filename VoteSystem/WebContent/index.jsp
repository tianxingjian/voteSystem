<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/style.css" type="text/css" />
<title>投票系统登陆页面</title>
<script type="text/javascript">
	function validateLogin(){
		var userid = document.frmLogin.username.value;
		var password = document.frmLogin.password.value;;
		if(userid==''){
			alert("请输入一卡通账号！");
			document.frmLogin.username.focus();
			return false;
		}
		if(password==''){
			alert("请输入一卡通密码！");
			document.frmLogin.password.focus();
			return false;
		}
	}
</script>
</head>
<body>
		<div id="container">
			<form name="frmLogin" action="login.do" method="post">
				<div class="login">用户登录</div>
				<div class="username-text">一卡通账号:</div>
				<div class="username-field">
					<input type="text" name="username" value="" />
				</div>
				<div class="password-text">一卡通密码:</div>
				<div class="password-field">
					<input type="password" name="password" value="" />
				</div>
				<input type="submit" name="submit" value="登陆" onclick="return validateLogin();" />
			</form>
		</div>
		<div id="footer">
			Vote System 1.0 of Software Engineering <a href="http://software.jxufe.cn/" target="_blank" title="软件与通信工程">软件与通信工程</a>
		</div>
</body>
</html>