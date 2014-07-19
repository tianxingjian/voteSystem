package cn.vote.service;

import cn.vote.table.Users;
import cn.vote.table.Votetheme;


public interface LoginService {
	Users login(String username);
	Votetheme queryThemeByUser(Users user);
}
