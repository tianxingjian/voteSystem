package cn.vote.table;

public class Voteinfo{

	private Integer id;
	private Integer itemid;
	private int usertype;
	private String userid;
	private String votetime;
	private String votemark;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getItemid() {
		return itemid;
	}
	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}
	public int getUsertype() {
		return usertype;
	}
	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getVotetime() {
		return votetime;
	}
	public void setVotetime(String votetime) {
		this.votetime = votetime;
	}
	public String getVotemark() {
		return votemark;
	}
	public void setVotemark(String votemark) {
		this.votemark = votemark;
	}
	
	

}
