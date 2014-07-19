package cn.vote.action;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;

import cn.vote.model.Votetheme;
import cn.vote.service.VoteService;
import cn.vote.timer.Timer;
import cn.vote.util.StatusConst;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.log.Logger;

public class AddVoteAction extends ActionSupport {
	
	Logger logger = Logger.getLogger(this.getClass().getName());
	private Votetheme vote;
	@Resource
	private VoteService voteService;
	
	public String addVote(){
		vote.setCreatetime(Timer.getCurrentTime());
		vote.setStatus(StatusConst.NEW);
		Votetheme newVote = voteService.addVote(vote);
		if(newVote != null && newVote.getId() != null){
			logger.info("addVote sucess: " + newVote.getId());
			return SUCCESS;
		}
		return INPUT;
	}

	public Votetheme getVote() {
		return vote;
	}

	public void setVote(Votetheme vote) {
		this.vote = vote;
	}
	
}
