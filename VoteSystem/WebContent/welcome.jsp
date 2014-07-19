<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/var/include.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/welcome.css" type="text/css" />
<title>投票页面</title>
<script type="text/javascript">用户登录中...</script>
</head>
<body>
	<Form method="post" name="fm" action="vote.do">
		<div id="welcome">
			<div><h4>投票主题：<u><font color="#2460CE">${theme.title}</font></u></h4></div>
			<input type="hidden" name="themeid" vaule="${theme.id}"/>
			<table>
				<c:forEach   var="item" items="${theme.voteitems}" varStatus="index">
				<tr>
					<td><input type="radio" id="item" name="item" style="vertical-align:middle;" value="${index.index + 1}" />
						<label style="vertical-align:middle">${item.content }</label>
					</td>
				</tr>
				</c:forEach>
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
	</Form>
</body>
</html>