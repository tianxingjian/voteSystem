package cn.vote.service;

import org.springframework.ui.context.Theme;

import cn.vote.model.Users;
import cn.vote.model.Votetheme;


public interface LoginService {
	Users login(String username);
	Votetheme queryThemeByUser(Users user);
}
