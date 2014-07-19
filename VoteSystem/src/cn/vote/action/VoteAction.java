package cn.vote.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import cn.vote.service.VoteService;
import cn.vote.table.Voteinfo;
import cn.vote.table.Voteitem;
import cn.vote.table.Votetheme;
import cn.vote.timer.Timer;
import cn.vote.util.MD5Util;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.log.Logger;

public class VoteAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	Logger logger = Logger.getLogger(this.getClass().getName());

	private String username;
	private Votetheme vote;
	// voteitem id数组 用户所选择的选项id
	private List<Integer> item;
	// 投票选项集合，包括某一item的匿名投票数/实名投票数/选项内容
	private List<Voteitem> voteItems;
	// 投票类型,匿名或实名。实名为0，匿名为1
	private Integer voteType;
	// 实名投票人数
	private Integer voternum;
	// 匿名投票人数
	private Integer votennum;
	// 所占百分比
	private float percent;
	@Resource
	private VoteService voteService;

	// 已经确保选项已经选择，并且在范围内，更新数据
	public String vote() {
		// 查询当前open的
		// vote为当前theme的详细信息
		if (voteType == 1)
			username = MD5Util.getMD5Str(username);// 将username转换为MD5
		List<Voteinfo> infos = new ArrayList<Voteinfo>();
		for (int i = 0; i < item.size(); i++) {
			// 初始化info
			Voteinfo info = new Voteinfo();
			info.setItemid(item.get(i));
			info.setUsertype(voteType);
			if (voteType == 0)
				info.setUserid(username);
			else
				info.setVotemark(username);
			info.setVotetime(Timer.getCurrentTime());
			// 加到list中
			infos.add(info);
		}
		// 将infos插入数据库，并更新数据库记录
		voteItems = voteService.addInfo(infos, vote.getId());
		if (voteItems == null || voteItems.size() == 0)
			return ERROR;// 数据库无法连接，投票失败
		else {
			// 读取实名投票和匿名投票人数
			voternum = votennum = 0;
			percent = 0.0f;
			for (Voteitem voteitem : voteItems) {
				voternum += voteitem.getVoternum();
				votennum += voteitem.getVotennum();
			}
			percent = (float) (voternum + votennum) / vote.getVotenum();
			percent = (float) Math.round(percent * 10000) / 100;
			return SUCCESS;// 转向结果显示页面
		}
	}

	public String hasvoted() {
		// 获取当前状态为Open的投票信息
		vote = voteService.getVote();
		if (vote == null)
			return ERROR;
		// 根据theme id找到其选项信息
		voteItems = voteService.getItems(vote.getId());
		if (voteItems == null || voteItems.size() == 0)
			return ERROR;
		//根据用户名找到用户所投选项id
		item=voteService.getUserItem(vote.getId(),username);
		if(item == null || item.size() == 0)
			return ERROR;
		//读取实名投票和匿名投票人数
		voternum = votennum = 0;
		percent = 0.0f;
		for (Voteitem voteitem : voteItems) {
			voternum += voteitem.getVoternum();
			votennum += voteitem.getVotennum();
		}
		percent = (float) (voternum + votennum) / vote.getVotenum();
		percent = (float) Math.round(percent * 10000) / 100;
		
		return SUCCESS;
	}

	public Votetheme getVote() {
		return vote;
	}

	public void setVote(Votetheme vote) {
		this.vote = vote;
	}

	public List<Integer> getItem() {
		return item;
	}

	public void setItem(List<Integer> item) {
		this.item = item;
	}

	public Integer getVoteType() {
		return voteType;
	}

	public void setVoteType(Integer voteType) {
		this.voteType = voteType;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Voteitem> getVoteItems() {
		return voteItems;
	}

	public void setVoteItems(List<Voteitem> voteItems) {
		this.voteItems = voteItems;
	}

	public Integer getVoternum() {
		return voternum;
	}

	public void setVoternum(Integer voternum) {
		this.voternum = voternum;
	}

	public Integer getVotennum() {
		return votennum;
	}

	public void setVotennum(Integer votennum) {
		this.votennum = votennum;
	}

	public float getPercent() {
		return percent;
	}

	public void setPercent(float percent) {
		this.percent = percent;
	}

}
