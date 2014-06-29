<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/result.css" type="text/css" />

<title>投票结果页面</title>
</head>
<body>
	<%
		//从投票页面中接收到用户所投票得主题id和选择的投票选项，
	
		int width=430;//固定值，用于生成进度条，总长度为430px
		//读取应投票人数.即在addvote里面所设置的投票人数值  对应表 votetheme中的 votenum(根据主题id进行查找)
		//统计已投票人数  首先根据主题id定位到选项id集合，根据选项id查询voteinfo表，统计对应ID项的userid数，并根据usertype类型，统计出主题ID对应的匿名和实名投票人数
		//结合个选项ID人数，
		int width1=200;
		int width2=100;
		int total=30;
		int reltotal=25;
		int relnum=20;
		float percent=(float)reltotal/total;
		boolean check1 =true;
		boolean check2 = false;
		boolean check3 = false;
		
		String support = "支持!";
		String oppo = "反对!";
		String va = "中立！";
	%>
	<div id="result">
		<div><h4>投票结果</h4></div>
		<%if(check1){ %>
		<table class="table-choose">
		<%}else{ %>
		<table class="table-unchoose">
		<%} %>
			<tr>
				<td><% if(check1){%>
					<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align:middle"/>
					<%}else{ %>
					<input type="checkbox" disabled="disabled" style="vertical-align:middle"/>
					<%}%>
					<label style="vertical-align:middle"><%=support %></label>
				</td>
			</tr>
			<tr>
				<td class="content-progress">
					<input type="text" style="vertical-align:middle;border:0px;background-color: blue;height:10px;width:<%= width1%>px" disabled="disabled"/>
				</td>
				<td><label style="vertical-align:middle">13 (20.25%)</label></td>
			</tr>
		</table>
		<%if(check2){%>
		<table class="table-choose">
		<%}else{ %>
		<table class="table-unchoose">
		<%} %>
			<tr>
				<td><% if(check2){%>
					<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align:middle"/>
					<%}else{ %>
					<input type="checkbox" disabled="disabled" style="vertical-align:middle"/>
					<%}%>
					<label style="vertical-align:middle"><%=oppo %></label>
				</td>
			</tr>
			<tr>
				<td class="content-progress">
					<input type="text" style="vertical-align:middle;border:0px;background-color: green;height:10px;width:<%= width2%>px" disabled="disabled"/>
				</td>
				<td><label style="vertical-align:middle">投票比例</label></td>
			</tr>
		</table>
		
		<%if(check3){ %>
		<table class="table-choose">
		<%}else{ %>
		<table class="table-unchoose">
		<%} %>
			<tr>
				<td><% if(check1){%>
					<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align:middle"/>
					<%}else{ %>
					<input type="checkbox" disabled="disabled" style="vertical-align:middle"/>
					<%}%>
					<label style="vertical-align:middle"><%=va %></label>
				</td>
			</tr>
			<tr>
				<td class="content-progress">
					<input type="text" style="vertical-align:middle;border:0px;background-color: red;height:10px;width:<%= width%>px" disabled="disabled"/>
				</td>
				<td><label style="vertical-align:middle">13 (20.25%)</label></td>
			</tr>
		</table>
		<div align="right">
			<h4>应投票人数：<font style="font-style: oblique;" color="red"><%= total%></font></h4>
			<h4>截止
			<%
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date currentTime = new java.util.Date();//得到当前系统时间
				String str_date = formatter.format(currentTime); //将日期时间格式化 
			%><%= str_date%>，实投票人数：<font style="font-style: oblique;" color="red"><%= reltotal%></font>
			&nbsp;约占：<font style="font-style: oblique;" color="red"><%=(float)Math.round(percent*10000)/100%>%</font></h4>
			<h4>其中实名投票数为：<font style="font-style: oblique;" color="red"><%= relnum%></font>
			,匿名投票数为：<font style="font-style: oblique;" color="red"><%= relnum%></font>
			</h4>
		</div>
	</div>
</body>
</html>