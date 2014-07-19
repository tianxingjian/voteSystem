package cn.vote.action;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import cn.vote.service.LoginService;
import cn.vote.table.Users;
import cn.vote.table.Votetheme;

import com.opensymphony.xwork2.ActionSupport;


public class LoginAction extends ActionSupport{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	LoginService loginService;
	String username;
	String password;
	Votetheme votetheme;
	

	public String login(){
		if(StringUtils.isNotBlank(username) && StringUtils.isNotBlank(password)){
			Users user = loginService.login(username);
			if(user != null && password.equals(user.getPassword())){//鐢ㄦ埛鍚嶅瘑鐮佹纭�
				votetheme = loginService.queryThemeByUser(user);
				if(votetheme != null){//鐢ㄦ埛鏆傛湭鍙備笌鎶曠エ
					return SUCCESS;
				}
				else{
					return NONE;//鐢ㄦ埛宸茬粡杩涜杩囨姇绁�
				}
			}
		}
		return INPUT;//鐢ㄦ埛鍚嶆垨瀵嗙爜閿欒
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

	public Votetheme getVotetheme() {
		return votetheme;
	}

	public void setVotetheme(Votetheme votetheme) {
		this.votetheme = votetheme;
	}

	
}