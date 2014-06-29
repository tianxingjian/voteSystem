package cn.vote.impl;

import cn.vote.dao.GenericDaoHibernate;
import cn.vote.model.Users;
import cn.vote.service.LoginService;

public class LoginServiceImpl extends GenericDaoHibernate implements
		LoginService {

	@Override
	public Users login(String username) {
		String hql = "from Users as user where user.id = ?";
		Users user = (Users)this.queryForObject(hql, new String[]{username});
		return user;
	}

}
