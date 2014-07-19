<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录跳转至投票结果页面</title>
<script type="text/javascript">
	function countDown(time) {
		var span=document.getElementById("second");
		span.innerHTML=time;
		if (--time > 0) {
			setTimeout("countDown(" + time + ")", 1000);//设定超时时间
		} else {
			document.getElementById('fm').submit();
		}
	}
</script>
</head>
<body>
	<form id="fm" method="post" action="hasvoted.do">
		<input type="hidden" id="username" name="username"  value="${username }" />
		<div class="suc">
			<div class="title">
				<span>操作提示</span>
			</div>
			<ul>
				<li>你已进行过投票，<span id="second" >3</span>秒后自动跳转<script language='javascript'>countDown(3);</script></li>
			</ul>
		</div>
	</form>
	
</body>
</html>