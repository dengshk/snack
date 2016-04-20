/**     
 * @文件名称: SaleInfo.java  
 * @类路径: com.shop.snack.web.model  
 * @描述: TODO  
 * @作者：dsk  
 * @时间：2016年4月20日 下午3:56:38  
 * @版本：V1.0     
 */
package com.shop.snack.web.model;

/**
 * @类功能说明：
 * @类修改者：
 * @修改日期：
 * @修改说明：
 * @公司名称：
 * @作者：dsk
 * @创建时间：2016年4月20日 下午3:56:38
 * @版本：V1.0
 */
public class ProSaleInfo implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	private String flowId;
	private String customerName;
	private String customerTel;
	private String saleNum;
	private String salePrice;
	private String remark;
	private String saleDate;
	private String createTime;

	/**
	 * @return the flowId
	 */
	public String getFlowId() {
		return flowId;
	}

	/**
	 * @param flowId
	 *            the flowId to set
	 */
	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}

	/**
	 * @return the customerName
	 */
	public String getCustomerName() {
		return customerName;
	}

	/**
	 * @param customerName
	 *            the customerName to set
	 */
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	/**
	 * @return the customerTel
	 */
	public String getCustomerTel() {
		return customerTel;
	}

	/**
	 * @param customerTel
	 *            the customerTel to set
	 */
	public void setCustomerTel(String customerTel) {
		this.customerTel = customerTel;
	}

	/**
	 * @return the saleNum
	 */
	public String getSaleNum() {
		return saleNum;
	}

	/**
	 * @param saleNum
	 *            the saleNum to set
	 */
	public void setSaleNum(String saleNum) {
		this.saleNum = saleNum;
	}

	/**
	 * @return the salePrice
	 */
	public String getSalePrice() {
		return salePrice;
	}

	/**
	 * @param salePrice
	 *            the salePrice to set
	 */
	public void setSalePrice(String salePrice) {
		this.salePrice = salePrice;
	}

	/**
	 * @return the remark
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * @param remark
	 *            the remark to set
	 */
	public void setRemark(String remark) {
		this.remark = remark;
	}

	/**
	 * @return the saleDate
	 */
	public String getSaleDate() {
		return saleDate;
	}

	/**
	 * @param saleDate
	 *            the saleDate to set
	 */
	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}

	/**
	 * @return the createTime
	 */
	public String getCreateTime() {
		return createTime;
	}

	/**
	 * @param createTime
	 *            the createTime to set
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
