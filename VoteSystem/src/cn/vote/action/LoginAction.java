package cn.vote.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import cn.vote.model.Users;
import cn.vote.model.Voteitem;
import cn.vote.model.Votetheme;
import cn.vote.service.LoginService;

import com.opensymphony.xwork2.ActionSupport;


public class LoginAction extends ActionSupport{
	
	@Resource
	LoginService loginService;
	String username;
	String password;
	Votetheme theme;
	
	/*´¦ÀíµÇÂ¼*/
	public String login(){
		if(StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)){
			Users user = loginService.login(username);
			if(user != null && password.equals(user.getPassword())){
				theme = loginService.queryThemeByUser(user);
				List<Voteitem> list = new ArrayList<Voteitem>();
				for(int i = 0; i < 3; i++){
					Voteitem item = new Voteitem();
					item.setId(i);
					item.setContent("baicai:" + i);
					list.add(item);
				}
				theme.setVoteitems(list);
				return SUCCESS;
			}
		}
		return INPUT;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Votetheme getTheme() {
		return theme;
	}
	public void setTheme(Votetheme theme) {
		this.theme = theme;
	}
	
}
