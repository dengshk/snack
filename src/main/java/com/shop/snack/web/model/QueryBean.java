package com.shop.snack.web.model;

public class QueryBean implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String queryTime;
	private String customerName;

	public String getQueryTime() {
		return queryTime;
	}

	public void setQueryTime(String queryTime) {
		this.queryTime = queryTime;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

}
