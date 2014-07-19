package cn.vote.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;

import cn.vote.service.LoginService;
import cn.vote.table.Users;
import cn.vote.table.Voteitem;
import cn.vote.table.Votetheme;
import cn.vote.util.MD5Util;

public class LoginServiceImpl implements LoginService {

	
	@Resource
	JdbcTemplate jdbcTemplate;
	@Override
	public Users login(String username) {
		String sql = "select id, password, realname, phone from users as user where user.id = '" + username + "'";
		Map<String, Object> rowSet ;
		try{
			rowSet= jdbcTemplate.queryForMap(sql);
		}catch(Exception e){//用户名不存在
			return null;
		}
		Users users = new Users();
		String []itemNames = new String[]{"id", "password", "realname", "phone"};
		if(rowSet!=null){
			users.setId((String) rowSet.get(itemNames[0]));
			users.setPassword((String) rowSet.get(itemNames[1]));
			users.setRealname((String) rowSet.get(itemNames[2]));
			users.setPhone((String) rowSet.get(itemNames[3]));
		}
		return users;
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Votetheme queryThemeByUser(Users user) {
		StringBuffer sb = new StringBuffer();
		String userid = user.getId();
		//
		sb.append("select a.* from votetheme a where a.status='Open'");
		sb.append(" and a.id not in(select b.themeid from voteitem b ,voteinfo c where (c.userid='");
		sb.append(userid).append("' or c.votemark='").append(MD5Util.getMD5Str(userid)).append("') and c.itemid in (select id from voteitem) and b.id = c.itemid)");
				
		List<Votetheme> themeList = jdbcTemplate.query(sb.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Votetheme.class)));
		Votetheme theme = null;
		if(themeList != null && themeList.size() > 0){
			theme = themeList.get(0);
		}
		List<Voteitem> list = null;
		if(theme != null){
			Integer id = theme.getId();
			StringBuffer itemSql = new StringBuffer();
			itemSql.append("select *from voteitem where themeid = '");
			itemSql.append(id + "'");
			
			list = jdbcTemplate.query(itemSql.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Voteitem.class)));
			theme.setVoteitems(list);
		}
		return theme;
	}

}
