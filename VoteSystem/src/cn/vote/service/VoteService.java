package cn.vote.service;

import java.util.List;

import cn.vote.table.Voteinfo;
import cn.vote.table.Voteitem;
import cn.vote.table.Votetheme;


public interface VoteService {
	Votetheme addVote(Votetheme votetheme);
	List<Voteitem> addInfo(List<Voteinfo> infos,int themeid);
	Votetheme getVote( );
	List<Voteitem> getItems(int themeid);
	List<Integer> getUserItem(int themeid,String username);
}
