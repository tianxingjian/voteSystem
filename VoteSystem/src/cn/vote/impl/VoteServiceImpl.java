package cn.vote.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;

import cn.vote.service.VoteService;
import cn.vote.table.Voteinfo;
import cn.vote.table.Voteitem;
import cn.vote.table.Votetheme;
import cn.vote.util.MD5Util;

public class VoteServiceImpl implements VoteService {
	
	@Resource
	JdbcTemplate jdbcTemplate;
	
	@Override
	public Votetheme addVote(Votetheme votetheme) {
		Votetheme head = null;
		StringBuffer headSb = new StringBuffer();
		headSb.append("INSERT INTO votetheme (title,content,type,votemin,votemax,createtime,status,votenum) VALUES(");
		headSb.append("'" + votetheme.getTitle() + "',");
		headSb.append("'" + votetheme.getContent() + "',");
		headSb.append("'" + votetheme.getType() + "',");
		headSb.append("'" + votetheme.getVotemin() + "',");
		headSb.append("'" + votetheme.getVotemax() + "',");
		headSb.append("'" + votetheme.getCreatetime() + "',");
		headSb.append("'" + votetheme.getStatus() + "',");
		headSb.append("'" + votetheme.getVotenum() + "')");

		jdbcTemplate.execute(headSb.toString());
		
		String sql = "select *from votetheme where title = '" + votetheme.getTitle() + "' and createtime = '" + votetheme.getCreatetime() + "'";
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<Votetheme> themeList = jdbcTemplate.query(sql.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Votetheme.class)));
		if(themeList != null && themeList.size() > 0){
			head = themeList.get(0);
			List<Voteitem> items = votetheme.getVoteitems();
			for(int i = 0; i < items.size(); i++){
				Voteitem item = items.get(i);
				StringBuffer bodySB = new StringBuffer();
				bodySB.append("INSERT INTO voteitem (themeid,content) VALUES(");
				bodySB.append(head.getId()+",");
				bodySB.append("'" + item.getContent() +"')");
				jdbcTemplate.execute(bodySB.toString());
			}
		}
		return head;
	}
	
	@Override
	public List<Voteitem> addInfo(List<Voteinfo> infos,int themeid){
		for(int i =0;i<infos.size();i++){
			Voteinfo info = infos.get(i);
			StringBuffer bodySB = new StringBuffer();
			StringBuffer bodySB2 = new StringBuffer();
			if(info.getUsertype()==0){//实名
				bodySB.append("INSERT INTO voteinfo (itemid,usertype,userid,votetime) VALUES(");
				bodySB.append(info.getItemid() + ",");
				bodySB.append(info.getUsertype() + ",");
				bodySB.append("'" + info.getUserid() + "',");
				bodySB.append("'" + info.getVotetime() + "');");
				//更新item
				bodySB2.append("UPDATE voteitem set voternum=voternum+1 where id=");
				bodySB2.append(info.getItemid());
			}
			else{
				bodySB.append("INSERT INTO voteinfo (itemid,usertype,votemark,votetime) VALUES(");
				bodySB.append(info.getItemid() + ",");
				bodySB.append(info.getUsertype() + ",");
				bodySB.append("'" + info.getVotemark() + "',");
				bodySB.append("'" + info.getVotetime() + "')");
				
				//更新item
				bodySB2.append("UPDATE voteitem set votennum=votennum+1 where id=");
				bodySB2.append(info.getItemid()+";");
			}
			jdbcTemplate.execute(bodySB.toString());
			jdbcTemplate.execute(bodySB2.toString());
			
		}
		//读取items
		String sql = "select *from voteitem where themeid = " +themeid;
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<Voteitem> items  = jdbcTemplate.query(sql.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Voteitem.class)));
		return items;
	}
	
	@Override
	public Votetheme getVote(){
		Votetheme head = null;
		String sql = "select *from votetheme where status='Open'";
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<Votetheme> themeList = jdbcTemplate.query(sql.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Votetheme.class)));
		if(themeList != null && themeList.size() > 0)
			head = themeList.get(0);
		return head;
	}

	@Override
	public List<Voteitem> getItems(int themeid){
		String sql = "select *from voteitem where themeid = " +themeid;
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<Voteitem> voteitems  = jdbcTemplate.query(sql.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Voteitem.class)));
		return voteitems;
	}
	
	@Override
	public List<Integer> getUserItem(int themeid,String username){
		String sql = "select itemid from voteinfo where (userid = '" +username + "' or votemark='"+MD5Util.getMD5Str(username)+"') and itemid in(select id from voteitem where themeid="+themeid+")";
		@SuppressWarnings({ "unchecked", "rawtypes" })
		List<Voteinfo> voteinfos =  jdbcTemplate.query(sql.toString(), new RowMapperResultSetExtractor(new BeanPropertyRowMapper(Voteinfo.class)));
		List<Integer> items= new ArrayList<Integer>();
		for(Voteinfo info:voteinfos){
			items.add(info.getItemid());
		}
		return items;
	}
}
