package com.shop.snack.web.dao.record;

import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.User;

public interface ProductDao extends PageMapper {
	// 根据名称查询
	User queryByName(Map<String, Object> params);

	// 根据id查询
	User queryById(Map<String, Object> params);

	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updOne(Map<String, Object> params);
	
	// 修改状态
	Integer updState(Map<String, Object> params);

	// 物理删除
	void deleteOne(Map<String, Object> params);
}
