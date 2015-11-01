package com.ftc.ad.vo;

import java.util.Date;

public class AdvertiserVO {
	private Integer advertiserID;
	private Integer columnType;
	private String prodName;
	private Integer platformType;
	private Integer balanceType;
	private Integer viewType;
	private String qq;
	private String mobilePhone;
	private String wechat;
	private Integer cooperationType;
	private Double price;
	private String orgName;
	private String website;
	private String telephone;
	private String comments;
	private Integer status;
	private Integer verifystatus;
	private Date createdate;
	private Date datelastupdated;
	private Integer userID;
	
	public Integer getUserID() {
		return userID;
	}
	public void setUserID(Integer userID) {
		this.userID = userID;
	}
	public Integer getAdvertiserID() {
		return advertiserID;
	}
	public void setAdvertiserID(Integer advertiserID) {
		this.advertiserID = advertiserID;
	}
	public Integer getColumnType() {
		return columnType;
	}
	public void setColumnType(Integer columnType) {
		this.columnType = columnType;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public Integer getPlatformType() {
		return platformType;
	}
	public void setPlatformType(Integer platformType) {
		this.platformType = platformType;
	}
	public Integer getBalanceType() {
		return balanceType;
	}
	public void setBalanceType(Integer balanceType) {
		this.balanceType = balanceType;
	}
	public Integer getViewType() {
		return viewType;
	}
	public void setViewType(Integer viewType) {
		this.viewType = viewType;
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
	public Integer getCooperationType() {
		return cooperationType;
	}
	public void setCooperationType(Integer cooperationType) {
		this.cooperationType = cooperationType;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
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
	
	private String pricesize;
	private String orderrule;
	private String page;
	private Integer pageSize;

	public String getPricesize() {
		if ("1".equals(pricesize)) {
			return "and price <= 1 and price >= 0";
		} else if ("2".equals(pricesize)) {
			return "and price <= 2 and price >= 1.1";
		} else if ("3".equals(pricesize)) {
			return "and price <= 5 and price >= 2.1";
		} else if ("4".equals(pricesize)) {
			return "and price <= 10 and price >= 5.1";
		} else if ("5".equals(pricesize)) {
			return "and price > 10";
		}
		return null;
	}
	
	public int getPricesizeValue() {
		if (pricesize==null || pricesize.length()==0) {
			return 0;
		}
		return Integer.valueOf(pricesize);
	}
	public void setPricesize(String pricesize) {
		this.pricesize = pricesize;
	}
	public String getOrderrule() {		
		if ("1".equals(orderrule)) {
			return "order by price desc ";
		} else if ("2".equals(orderrule)) {
			return "order by price asc ";
		} else if ("3".equals(orderrule)) {
			return "order by createdate desc ";
		} 
		
		return "order by createdate desc ";
	}
	public int getOrderruleValue() {
		return orderrule==null?0:Integer.valueOf(orderrule);
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
