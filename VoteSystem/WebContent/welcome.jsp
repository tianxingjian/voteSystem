<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/welcome.css" type="text/css" />
<title>投票页面</title>
<script type="text/javascript">用户登录中...</script>
</head>
<body>
	<%//加载投票信息 
		char type = '1';//1表示单选，否则多选
		int itemnum = 3;//表示选项数
		String[] content={"减轻考生压力，有利","不利于将来考生发展，有弊","取决于考生今后人生发展，有利也有弊"};
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("vote.title");
		out.println(title);
	%>
	<div id="welcome">
		<div><h4>投票主题：<u><font color="#2460CE">${vote.title}</font></u></h4></div>
		<div><h4>投票主题：<u><font color="#2460CE">高考取消英语，对考试有利还是有弊？</font></u></h4></div>
		<table>
		<% 
			if(type=='1'){//单选，radio
				for(int i=0;i<content.length;i++){ %>
			<tr>
				<td><input type="radio" id="item" name="item" style="vertical-align:middle;" value="<%=i %>" />
					<label style="vertical-align:middle"><%= content[i]%></label>
				</td>
			</tr>
		<%}}else{ 
			for(int i=0;i<content.length;i++){ %>
			<tr>
				<td><input type="checkbox" id="item" name="item" style="vertical-align:middle;" value="<%=i %>" />
					<label style="vertical-align:middle"><%= content[i]%></label>
				</td>
			</tr>
		<%}}%>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<input type="radio" checked="checked" name="voteType" id="voteType" style="vertical-align:middle;" value=""/>
				<label style="vertical-align:middle">【实名】</label>
				<input type="radio" name="voteType" id="voteType" style="vertical-align:middle;" value=""/>
				<label style="vertical-align:middle">【匿名】</label>
				<input type="submit" name="button" id="button" value="" style="vertical-align: middle;"/>
			</td>
		</tr>	
		</table>
	</div>
</body>
</html>