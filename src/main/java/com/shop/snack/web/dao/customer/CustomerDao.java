package com.shop.snack.web.dao.customer;

import java.util.List;
import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.CustomerInfo;

public interface CustomerDao extends PageMapper {
	// 根据名称查询
	CustomerInfo queryByName(Map<String, Object> params);

	// 根据id查询
	CustomerInfo queryById(Map<String, Object> params);

	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updOne(Map<String, Object> params);

	// 物理删除
	Integer deleteOne(Map<String, Object> params);

	// 搜索
	public List<CustomerInfo> searchCustomersByName(Map<String, Object> param);
}
