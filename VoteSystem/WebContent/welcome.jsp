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

<link rel="stylesheet" href="${ctx}/css/welcome.css" type="text/css" />
<title>投票页面</title>
<script type="text/javascript">
function showDailog(){
	
	var itemChoose = 0;
	var items = document.getElementsByName('item');
	var votemin = document.getElementById("votemin").value;
	var votemax = document.getElementById("votemax").value;
	var votetype = document.getElementById("votetype").value;
	
	for(var i = 0; i < items.length; i++) {
		if(items[i].checked)
			itemChoose++;
	}
	if(votetype=='单'){
		if(itemChoose==0){
			alert('必须选择一项!');
			return false;
		}
	}
	else{
		if(itemChoose>votemax||itemChoose<votemin){
			alert('选项数:['+votemin+','+votemax+']');
			return false;
		}
	}
	return true;
}
</script>
</head>
<body>
	<Form method="post" name="fm" action="vote.do"
		enctype="multipart/form-data" >
		<s:token></s:token>
		<div id="welcome">
			<div>
				<h4>
					投票主题：<u><font color="#2460CE">${votetheme.title}</font></u>
				</h4>
			</div>
			<input type="hidden" name="username" value="${username}" /> <input
				type="hidden" name="vote.id" value="${votetheme.id}" /> <input
				type="hidden" name="vote.title" value="${votetheme.title}" /> <input
				type="hidden" id="votetype" name="vote.type" value="${votetheme.type}" />
			<input type="hidden" name="vote.createtime"
				value="${votetheme.createtime}" /> <input type="hidden"
				name="vote.status" value="${votetheme.status}" /> <input type="hidden"
				id="votemin" name="vote.votemin" value="${votetheme.votemin}" /> <input
				type="hidden" id="votemax" name="vote.votemax"
				value="${votetheme.votemax}" /> <input type="hidden" name="vote.votenum"
				value="${votetheme.votenum}" />

			<table>
				<c:set var="themeType" value="${votetheme.type}"></c:set>
				<c:if test="${themeType=='单'}">
					<c:forEach var="item" items="${votetheme.voteitems}" varStatus="index">
						<tr>
							<td><input type="radio" id="item" name="item"
								style="vertical-align: middle;" value="${item.id}" /> <label
								style="vertical-align: middle">${item.content }</label></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${themeType=='多'}">
					<c:forEach var="item" items="${votetheme.voteitems}" varStatus="index">
						<tr>
							<td><input type="checkbox" id="item" name="item"
								style="vertical-align: middle;" value="${item.id}" /> <label
								style="vertical-align: middle">${item.content }</label></td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td><input type="radio" checked="checked" name="voteType" id="voteType" style="vertical-align: middle;" value="0" /> 
					<label style="vertical-align: middle">【实名】</label> 
					<input type="radio" name="voteType" id="voteType" style="vertical-align: middle;" value="1" />
					<label style="vertical-align: middle">【匿名】</label> 
					<input type="submit" name="button" id="button" onclick="return showDailog();" value="" style="vertical-align: middle;" /></td>
				</tr>
			</table>
		</div>
	</Form>
</body>
</html>