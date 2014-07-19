package cn.vote.impl;

import java.util.List;

import cn.vote.dao.GenericDaoHibernate;
import cn.vote.model.Users;
import cn.vote.model.Voteitem;
import cn.vote.model.Votetheme;
import cn.vote.service.LoginService;

public class LoginServiceImpl extends GenericDaoHibernate implements
		LoginService {

	@Override
	public Users login(String username) {
		String hql = "from Users as user where user.id = ?";
		Users user = (Users)this.queryForObject(hql, new String[]{username});
		return user;
	}

	@Override
	public Votetheme queryThemeByUser(Users user) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Votetheme theme where theme.status = 'New'");
		this.setEntityClass(Votetheme.class);
		Votetheme theme = (Votetheme)this.queryForTopObject(hql.toString(), null);
		return theme;
	}

}
