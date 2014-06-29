package cn.vote.action;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import cn.vote.model.Users;
import cn.vote.service.LoginService;

import com.opensymphony.xwork2.ActionSupport;


public class LoginAction extends ActionSupport{
	
	@Resource
	LoginService loginService;
	String username;
	String password;
	
	/*´¦ÀíµÇÂ¼*/
	public String login(){
		if(StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)){
			Users user = loginService.login(username);
			if(user != null && password.equals(user.getPassword())){
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
	
}
