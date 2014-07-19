package cn.vote.impl;

import java.util.List;

import cn.vote.dao.GenericDaoHibernate;
import cn.vote.model.Voteitem;
import cn.vote.model.Votetheme;
import cn.vote.service.VoteService;

public class VoteServiceImpl extends GenericDaoHibernate implements VoteService {

	@Override
	public Votetheme addVote(Votetheme votetheme) {
		Integer theme = (Integer)this.insert(votetheme);
		this.setEntityClass(Votetheme.class);
		Votetheme newVote = (Votetheme)this.queryById(theme);
		List<Voteitem> items = votetheme.getVoteitems();
		if(items != null && items.size() > 0){
			for(int i = 0; i < items.size(); i++ ){
				items.get(i).setVotetheme(newVote);
				this.insert(items.get(i));
			}
		}
		return newVote;
	}

}
