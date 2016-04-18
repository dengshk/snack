/**     
 * @文件名称: Product.java  
 * @类路径: com.shop.snack.web.model  
 * @描述: TODO  
 * @作者：dsk  
 * @时间：2016年4月18日 下午3:44:18  
 * @版本：V1.0     
 */
package com.shop.snack.web.model;

import java.math.BigDecimal;

/**
 * @类功能说明：
 * @类修改者：
 * @修改日期：
 * @修改说明：
 * @公司名称：
 * @作者：dsk
 * @创建时间：2016年4月18日 下午3:44:18
 * @版本：V1.0
 */
public class Product implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	private String name;
	private String describe;
	private String typeId;
	private String typeName;
	private Integer state;
	private String brand;
	private String place;
	private String taste;
	private BigDecimal buyPrice;
	private BigDecimal salePrice;
	private Integer expiration;
	private String produceDate;
	private String overdueDate;
	private String buyDate;
	private String modifyTime;
	private String createTime;
	/**
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the describe
	 */
	public String getDescribe() {
		return describe;
	}
	/**
	 * @param describe the describe to set
	 */
	public void setDescribe(String describe) {
		this.describe = describe;
	}

	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	/**
	 * @return the state
	 */
	public Integer getState() {
		return state;
	}
	/**
	 * @param state the state to set
	 */
	public void setState(Integer state) {
		this.state = state;
	}
	/**
	 * @return the brand
	 */
	public String getBrand() {
		return brand;
	}
	/**
	 * @param brand the brand to set
	 */
	public void setBrand(String brand) {
		this.brand = brand;
	}
	/**
	 * @return the place
	 */
	public String getPlace() {
		return place;
	}
	/**
	 * @param place the place to set
	 */
	public void setPlace(String place) {
		this.place = place;
	}
	/**
	 * @return the taste
	 */
	public String getTaste() {
		return taste;
	}
	/**
	 * @param taste the taste to set
	 */
	public void setTaste(String taste) {
		this.taste = taste;
	}
	/**
	 * @return the buyPrice
	 */
	public BigDecimal getBuyPrice() {
		return buyPrice;
	}
	/**
	 * @param buyPrice the buyPrice to set
	 */
	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}
	/**
	 * @return the salePrice
	 */
	public BigDecimal getSalePrice() {
		return salePrice;
	}
	/**
	 * @param salePrice the salePrice to set
	 */
	public void setSalePrice(BigDecimal salePrice) {
		this.salePrice = salePrice;
	}
	/**
	 * @return the expiration
	 */
	public Integer getExpiration() {
		return expiration;
	}
	/**
	 * @param expiration the expiration to set
	 */
	public void setExpiration(Integer expiration) {
		this.expiration = expiration;
	}
	/**
	 * @return the produceDate
	 */
	public String getProduceDate() {
		return produceDate;
	}
	/**
	 * @param produceDate the produceDate to set
	 */
	public void setProduceDate(String produceDate) {
		this.produceDate = produceDate;
	}
	/**
	 * @return the overdueDate
	 */
	public String getOverdueDate() {
		return overdueDate;
	}
	/**
	 * @param overdueDate the overdueDate to set
	 */
	public void setOverdueDate(String overdueDate) {
		this.overdueDate = overdueDate;
	}
	/**
	 * @return the buyDate
	 */
	public String getBuyDate() {
		return buyDate;
	}
	/**
	 * @param buyDate the buyDate to set
	 */
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	/**
	 * @return the modifyTime
	 */
	public String getModifyTime() {
		return modifyTime;
	}
	/**
	 * @param modifyTime the modifyTime to set
	 */
	public void setModifyTime(String modifyTime) {
		this.modifyTime = modifyTime;
	}
	/**
	 * @return the createTime
	 */
	public String getCreateTime() {
		return createTime;
	}
	/**
	 * @param createTime the createTime to set
	 */
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
