<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/var/include.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="pragma" content="no-cache"> 
<meta http-equiv="Cache-Control" content="no-cache, must-revalidate"> 
<meta http-equiv="expires" content="Wed, 26 Feb 1997 08:21:57 GMT">
<link rel="stylesheet" href="css/result.css" type="text/css" />

<title>投票结果页面</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<jsp:useBean id="calc" class="cn.vote.util.CalcBean" />

	<c:set var="width" value="450"></c:set>
	<c:set var="selectOrNot" value="false"></c:set>
	<c:set var="red" value="red"></c:set><!-- percent>60 -->
	<c:set var="blue" value="blue"></c:set><!-- percent >=30 && percent<=60-->
	<c:set var="green" value="green"></c:set><!-- percent<30 -->
	<div id="result">
		<div><h3>投票结果</h3></div>
		<c:forEach var="voteitem" items="${voteItems}"  varStatus="index">
			<c:forEach var="userChooseitem" items="${item}"><!-- 确认用户是否投选该选项 -->
				<c:if test="${voteitem.id==userChooseitem}">
					<c:set var="selectOrNot" value="true" />
				</c:if>
			</c:forEach>
			<c:if test="${selectOrNot=='true'}">
				<table class="table-choose">
					<tr>
						<td>
								<c:if test="${vote.type=='多'}">
									<input type="checkbox" checked="checked" disabled="disabled" style="vertical-align:middle"/>
								</c:if>
								<c:if test="${vote.type=='单'}">
									<input type="radio" checked="checked" disabled="disabled" style="vertical-align:middle"/>
								</c:if>
								<label style="vertical-align:middle">${voteitem.content}</label>
						</td>
					</tr>
					<tr>
						<td class="content-progress">
							<jsp:setProperty property="num1" name="calc" value="${voteitem.voternum+voteitem.votennum}"/>
							<jsp:setProperty property="num2" name="calc" value="${voternum+votennum}"/>
							<c:set var="itemPercent" value="${calc.percentResult}"></c:set>
							<c:set var="progress" value="${width*itemPercent*0.01}"></c:set>
							<c:if test="${itemPercent>60}"><c:set var="color" value="red"></c:set></c:if>
							<c:if test="${itemPercent>=30&&itemPercent<=60}"><c:set var="color" value="blue"></c:set></c:if>
							<c:if test="${itemPercent<30}"><c:set var="color" value="green"></c:set></c:if>
							<input type="text" style="vertical-align:middle;border:0px;background-color: ${color};height:10px;width:${progress}px" disabled="disabled"/>
						</td>
						<td width="150px"><label style="vertical-align:middle">${voteitem.voternum+voteitem.votennum}(${itemPercent}%)</label></td>
					</tr>
				</table>
			</c:if>
		<!-- 用户没有投该选项 -->
		<c:if test="${selectOrNot=='false'}">
			<table class="table-unchoose">
					<tr>
						<td>
								<c:if test="${vote.type=='多'}">
									<input type="checkbox"  disabled="disabled" style="vertical-align:middle"/>
								</c:if>
								<c:if test="${vote.type=='单'}">
									<input type="radio"  disabled="disabled" style="vertical-align:middle"/>
								</c:if>
								<label style="vertical-align:middle">${voteitem.content}</label>
						</td>
					</tr>
					<tr>
						<td class="content-progress">
							<jsp:setProperty property="num1" name="calc" value="${voteitem.voternum+voteitem.votennum}"/>
							<jsp:setProperty property="num2" name="calc" value="${voternum+votennum}"/>
							<c:set var="itemPercent" value="${calc.percentResult}"></c:set>
							<c:set var="progress" value="${width*itemPercent*0.01}"></c:set>
							<c:if test="${itemPercent>60}"><c:set var="color" value="red"></c:set></c:if>
							<c:if test="${itemPercent>=30&&itemPercent<=60}"><c:set var="color" value="blue"></c:set></c:if>
							<c:if test="${itemPercent<30}"><c:set var="color" value="green"></c:set></c:if>
							<input type="text" style="vertical-align:middle;border:0px;background-color: ${color};height:10px;width:${progress}px" disabled="disabled"/>
						</td>
						<td width="150px"><label style="vertical-align:middle">${voteitem.voternum+voteitem.votennum}(${itemPercent}%)</label></td>
					</tr>
				</table>
		</c:if>
		<c:set var="selectOrNot" value="false"></c:set>
		</c:forEach>

		<div align="right">
			<h4>应投票人数：<font style="font-style: oblique;" color="red">${vote.votenum}</font></h4>
			<h4>截止
			<%
				java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				java.util.Date currentTime = new java.util.Date();//得到当前系统时间
				String str_date = formatter.format(currentTime); //将日期时间格式化 
			%><%= str_date%>，实投票人数：<font style="font-style: oblique;" color="red">${voternum+votennum}</font>
			&nbsp;约占：<font style="font-style: oblique;" color="red">${percent}%</font></h4>
			<h4>其中实名投票数为：<font style="font-style: oblique;" color="red">${voternum}</font>
			,匿名投票数为：<font style="font-style: oblique;" color="red">${votennum}</font>
			</h4>
		</div>
	</div>
</body>
</html>