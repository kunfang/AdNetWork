package com.ftc.ad.vo;

import java.util.Date;

public class ChannelVO {
	private Integer channelID;
	private Integer userID;
	private Integer status;
	private Integer verifystatus;
	private Integer platformType;
	private Integer channeltype;
	private Integer channelsize;
	private String qq;
	private String mobilePhone;
	private String wechat;
	private String orgName;
	private String website;
	private String telephone;
	private String comments;
	private Date createdate;
	private Date datelastupdated;
	public Integer getChannelID() {
		return channelID;
	}
	public void setChannelID(Integer channelID) {
		this.channelID = channelID;
	}
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getVerifystatus() {
		return verifystatus;
	}
	public void setVerifystatus(Integer verifystatus) {
		this.verifystatus = verifystatus;
	}
	public Integer getPlatformType() {
		return platformType;
	}
	public void setPlatformType(Integer platformType) {
		this.platformType = platformType;
	}
	public Integer getChanneltype() {
		return channeltype;
	}
	public void setChanneltype(Integer channeltype) {
		this.channeltype = channeltype;
	}
	public Integer getChannelsize() {
		return channelsize;
	}
	public void setChannelsize(Integer channelsize) {
		this.channelsize = channelsize;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getMobilePhone() {
		return mobilePhone;
	}
	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public Date getDatelastupdated() {
		return datelastupdated;
	}
	public void setDatelastupdated(Date datelastupdated) {
		this.datelastupdated = datelastupdated;
	}
	
	private String orderrule;
	private String page;
	private Integer pageSize;
	
	public String getOrderrule() {		
		if ("1".equals(orderrule)) {
			return "order by channelsize desc ";
		} else if ("2".equals(orderrule)) {
			return "order by channelsize asc ";
		} else if ("3".equals(orderrule)) {
			return "order by createdate desc ";
		} 
		
		return "order by createdate desc ";
	}
	public int getOrderruleValue() {
		if (orderrule==null || orderrule.length()==0) {
			return 0;
		}
		return Integer.valueOf(orderrule);
	}
	public void setOrderrule(String orderrule) {
		this.orderrule = orderrule;
	}
	public String getPage() {
		if (page == null || page.length() == 0) {
			return null;
		}
		return "limit " + (Integer.valueOf(page)-1)*pageSize + "," + pageSize;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
}
