package cn.vote.table;

import java.util.List;

public class Votetheme{

	private Integer id;
	private String title;
	private String content;
	private String type;
	private Integer votemin;
	private Integer votemax;
	private String createtime;
	private String status;
	private Integer votenum;
	private List<Voteitem> voteitems;
	
	public Votetheme(){
		this.votemax = this.votemin = 1;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getVotemin() {
		return votemin;
	}
	public void setVotemin(Integer votemin) {
		this.votemin = votemin;
	}
	public Integer getVotemax() {
		return votemax;
	}
	public void setVotemax(Integer votemax) {
		this.votemax = votemax;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Integer getVotenum() {
		return votenum;
	}
	public void setVotenum(Integer votenum) {
		this.votenum = votenum;
	}
	public List<Voteitem> getVoteitems() {
		return voteitems;
	}
	public void setVoteitems(List<Voteitem> voteitems) {
		this.voteitems = voteitems;
	}
}
