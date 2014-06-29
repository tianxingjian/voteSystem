<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/var/include.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${ctx}/css/admin.css" type="text/css" />
<title>发起新投票</title>
<script Language=JavaScript>
	function insertRow(isTable){
		 index = isTable.rows.length;
		 nextRow = isTable.insertRow(index);
		 txtArea = nextRow.insertCell(0);
		 index++;
		 index = index.toString();
		 nameStr = "vote.voteitems["+index+"].content";
		 valueStr = "选项"+index;
		 
		 txtArea.innerHTML = "<input type=\"text\" name="+"\""+nameStr+"\" style=\"color:gray;vertical-align:middle\" size=\"50\" value="+"\""+valueStr+"\""+" onfocus=\"if(this.value=='"+valueStr+"'){this.value='';this.style.color='black'};\" onblur=\"if (this.value==''){this.value='"+valueStr+"';this.style.color='gray';}\"/>";
	}
	function change(){
		var radio = document.getElementsByName("vote.type");
		var radioLength = radio.length;
		for(var i = 0;i < radioLength;i++){
			if(radio[i].checked){//选中
				if(radio[i].value=='单选'){
					//将div隐藏
					for(var j=1;j<=4;j++){document.getElementById('itemnum'+j).style.display='none';}
				}
				else{
					//将div进行显示
					for(var j=1;j<=4;j++){document.getElementById('itemnum'+j).style.display='block';}
				}
			}
		}
	}
	
	function onSubmit(){
		var fm = document.getElementById("fm");
		fm.submit();
	}
</script>

</head>
<body>
<Form method="post" name="fm" action="addVote.do">
	<div id="addvote">
		<div><h4>发起新投票</h4></div>
		<hr>
		<Table class="table">
			<TR><TD class='lable' valign="top"><label style="font-size:14px;color:black;vertical-align:middle;"><b>投票主题：</b></label></TD>
				<TD valign="top"><input type="text" name="vote.title" id="title" style="margin-left:3px;color:gray;vertical-align:middle" size="50" value="输入投票主题" onfocus="if(this.value=='输入投票主题'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='输入投票主题';this.style.color='gray';}"/>
				</TD>
			</TR>
			<TR><TD class='lable' valign="top"><label style="font-size:14px;color:black;vertical-align:middle;"><b>投票选项：</b></label></TD>
				<TD>
					<Table id="dynTable">
						<TR><TD valign="top"><input type="text" name="vote.voteitems[0].content" style="color:gray;vertical-align:middle" size="50" value="选项1" onfocus="if(this.value=='选项1'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='选项1';this.style.color='gray';}"></TD></TR>
						<TR><TD valign="top"><input type="text" name="vote.voteitems[1].content" style="color:gray;vertical-align:middle" size="50" value="选项2" onfocus="if(this.value=='选项2'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='选项2';this.style.color='gray';}"></TD></TR>
						<TR><TD valign="top"><input type="text" name="vote.voteitems[2].content" style="color:gray;vertical-align:middle" size="50" value="选项3" onfocus="if(this.value=='选项3'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='选项3';this.style.color='gray';}"></TD></TR>
					</Table>
				</TD>
			</TR>
			<TR>
				<TD valign="top"></TD>
				<TD valign="top"><a href="#" onclick="insertRow(dynTable)"><font color="blue" size="2px"><b>+</b><u>添加选项</u></font></a></TD>
			</TR>
			<TR><TD class='lable'><label style="font-size:14px;color:black;vertical-align:middle;"><b>投票人数：</b></label></TD>
				<TD>
					<input type="text" id="votenum" name="vote.votenum" style="vertical-align:middle;" value=""/>
				</TD>
			</TR>
			<TR><TD ></TD><TD></TD>
			</TR>
			<TR><TD class='lable'><label style="font-size:14px;color:black;vertical-align:middle;"><b>选择模式：</b></label></TD>
				<TD>
					<input type="radio" id="radioitem" name="vote.type" style="vertical-align:middle;" value="单选" checked="checked" onclick="change()"/><label style="font-size:12px;color:black;vertical-align:middle">单选</label>
					<input type="radio" id="radioitem" name="vote.type" style="vertical-align:middle;" value="多选" onclick="change()"/><label style="font-size:12px;color:black;vertical-align:middle">多选</label>
				</TD>
			</TR>
			<TR>
				<TD class='lable'>
					<div id="itemnum1" style="display: none;">
						<label style="font-size:14px;color:black;vertical-align:middle"><b>最低选项数：</b></label>
					</div>
				</TD>
				<TD>
					<div id="itemnum2" style="display: none;">
						<input type="text" id="minitem" name="vote.votemin" style="vertical-align:middle;" value=""/>
					</div>
				</TD>
			</TR>
			<TR>
				<TD class='lable'>
					<div id="itemnum3" style="display: none;">
						<label style="font-size:14px;color:black;vertical-align:middle"><b>最高选项数：</b></label>
					</div>
				</TD>
				<TD>
					<div id="itemnum4" style="display: none;">
						<input type="text" id="maxitem" name="vote.votemax" style="vertical-align:middle;" value=""/>
					</div>
				</TD>
			</TR>
		</Table>
		<hr>
		<div align="right">
			<input type="submit" name="button" id="cancle" value = "" style="vertical-align: middle;"/>
			<input type="submit" name="button" id="submit" onclick="onSubmit()" value = "" style="vertical-align: middle;"/>
		</div>
	</div>
</Form>

</body>
</html>