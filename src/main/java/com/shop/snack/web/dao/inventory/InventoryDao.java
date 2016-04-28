package com.shop.snack.web.dao.inventory;

import java.util.List;
import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.CustomerInfo;
import com.shop.snack.web.model.InventoryInfo;

public interface InventoryDao extends PageMapper {
	// 根据id查询
	InventoryInfo queryById(Map<String, Object> params);

	// 根据查询条件查询
	List<Map<String, Object>> queryByCondition(Map<String, Object> params);

	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updNums(Map<String, Object> params);

	// 物理删除
	Integer deleteOne(Map<String, Object> params);
}
