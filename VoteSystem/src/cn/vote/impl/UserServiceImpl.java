package cn.vote.impl;
import cn.vote.inter.UserServiceInter;

public class UserServiceImpl implements UserServiceInter {

	@Override
	public boolean login(String username,String password) {
		String sql = "select * from users where id ="+"'"+username+"' and password=" + "'" + password + "'";
		return true;
	}

}
