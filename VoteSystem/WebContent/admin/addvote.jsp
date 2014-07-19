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
	var itemnum=3;
	var votetype='单';
	function insertRow(isTable){
		 index = isTable.rows.length;
		 nextRow = isTable.insertRow(index);
		 txtArea = nextRow.insertCell(0);
		 index++;
		 temp = index-1;
		 nameStr = "vote.voteitems["+temp+"].content";
		 itemid="item"+index;
		 valueStr = "选项"+index;
		 itemnum++;
		 document.getElementById("maxitem").value=itemnum;
		 txtArea.innerHTML = "<input id="+"\""+itemid+"\" type=\"text\" name="+"\""+nameStr+"\" style=\"color:gray;vertical-align:middle\" size=\"50\" value="+"\""+valueStr+"\""+" onfocus=\"if(this.value=='"+valueStr+"'){this.value='';this.style.color='black'};\" onblur=\"if (this.value==''){this.value='"+valueStr+"';this.style.color='gray';}\"/>";
	}
	function change(){
		var radio = document.getElementsByName("vote.type");
		var radioLength = radio.length;
		for(var i = 0;i < radioLength;i++){
			if(radio[i].checked){//选中
				if(radio[i].value=='单'){
					votetype='单';
					//将div隐藏
					for(var j=1;j<=4;j++){document.getElementById('itemnum'+j).style.display='none';}
				}
				else{
					votetype='多';
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
	
	function trim(str){   
	    str = str.replace(/^(\s|\u00A0)+/,'');   
	    for(var i=str.length-1; i>=0; i--){   
	        if(/\S/.test(str.charAt(i))){   
	            str = str.substring(0, i+1);   
	            break;   
	        }   
	    }   
	    return str;   
	}
	
	function showDailog(){
		var title = document.getElementById("title");
		var votenum = document.getElementById("votenum");

		if(title.value==''||trim(title.value).length==0||title.value=='输入投票主题'){
			alert('投票主题不能为空');
			title.focus();
			return false;
		}
		else if(votenum.value==''||trim(title.value).length==0){
			alert('投票人数不能为空!');
			votenum.focus();
			return false;
		}
		else{
			if(itemnum==3){
				for(var i=1;i<=itemnum;i++){
					var itemid="item"+i;
					var itemval="选项"+i;
					var item = document.getElementById(itemid);
					if(i!=3){
						if(item.value==''||trim(item.value).length==0||item.value==itemval){
							alert(itemval+'不能为空！');
							item.focus();
							return false;
						}
					}
					else{
						if(item.value==itemval){
							item.value='';
						}
					}				
				}
			}
			else{
				for(var i=1;i<=itemnum;i++){
					var itemid="item"+i;
					var itemval="选项"+i;
					var item = document.getElementById(itemid);
					if(item.value==""||trim(item.value).length==0||item.value==itemval){
						alert('选项'+i+'不能为空!');
						item.focus();
						return false;
					}
				}
			}
		}
		//最低项、最高项、投票选项关系
		if(votetype!='单'){
			//获取最低项和最高项值
			var minitem = document.getElementById("minitem");
			var maxitem = document.getElementById("maxitem");
			if(minitem.value==""||trim(minitem.value).length==0){
				alert('最低选项数不能为空!');
				minitem.focus();
				return false;
			}
			if(maxitem.value==""||trim(maxitem.value).length==0){
				alert('最高选项数不能为空!');
				maxitem.focus();
				return false;
			}

			if(minitem.value=='0'||minitem.value>maxitem.value){
				alert('最低选项数:[1,'+maxitem.value+']');
				minitem.focus();
				return false;
			}
			if(maxitem.value=='0'||maxitem.value>itemnum){
				alert('最高选项数:['+minitem.value+','+itemnum+']');
				maxitem.focus();
				return false;
			}
			return true;
		}
		return true;
	}
</script>

</head>
<body>
<Form name="fm" action="addVote.do" method="post">
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
						<TR><TD valign="top"><input id="item1" type="text" name="vote.voteitems[0].content" style="color:gray;vertical-align:middle" size="50" value="选项1" onfocus="if(this.value=='选项1'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='选项1';this.style.color='gray';}"></TD></TR>
						<TR><TD valign="top"><input id="item2" type="text" name="vote.voteitems[1].content" style="color:gray;vertical-align:middle" size="50" value="选项2" onfocus="if(this.value=='选项2'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='选项2';this.style.color='gray';}"></TD></TR>
						<TR><TD valign="top"><input id="item3" type="text" name="vote.voteitems[2].content" style="color:gray;vertical-align:middle" size="50" value="选项3" onfocus="if(this.value=='选项3'){this.value='';this.style.color='black';}" onblur="if (this.value==''){this.value='选项3';this.style.color='gray';}"></TD></TR>
					</Table>
				</TD>
			</TR>
			<TR>
				<TD valign="top"></TD>
				<TD valign="top"><a href="#" onclick="insertRow(dynTable)"><font color="blue" size="2px"><b>+</b><u>添加选项</u></font></a></TD>
			</TR>
			<TR><TD class='lable'><label style="font-size:14px;color:black;vertical-align:middle;"><b>投票人数：</b></label></TD>
				<TD>
					<input type="text" id="votenum" name="vote.votenum" style="vertical-align:middle;" value="" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
				</TD>
			</TR>
			<TR><TD ></TD><TD></TD>
			</TR>
			<TR><TD class='lable'><label style="font-size:14px;color:black;vertical-align:middle;"><b>选择模式：</b></label></TD>
				<TD>
					<input type="radio" id="radioitem" name="vote.type" style="vertical-align:middle;" value="单" checked="checked" onclick="change()"/><label style="font-size:12px;color:black;vertical-align:middle">单选</label>
					<input type="radio" id="radioitem" name="vote.type" style="vertical-align:middle;" value="多" onclick="change()"/><label style="font-size:12px;color:black;vertical-align:middle">多选</label>
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
						<input type="text" id="minitem" name="vote.votemin" style="vertical-align:middle;" value="1" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
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
						<input type="text" id="maxitem" name="vote.votemax" style="vertical-align:middle;" value="3" onkeyup="this.value=this.value.replace(/\D/g,'')"  onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
					</div>
				</TD>
			</TR>
		</Table>
		<hr>
		<div align="right">
			<input type="reset" name="reset" id="cancle" value = "" style="vertical-align: middle;" />
			<input type="submit" name="button" id="submit" onclick="return showDailog();" value = "" style="vertical-align: middle;"/>
		</div>
	</div>
</Form>

</body>
</html>