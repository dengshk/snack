package com.shop.snack.web.dao.record;

import java.util.List;
import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.Product;
import com.shop.snack.web.model.ProductType;

public interface ProductDao extends PageMapper {
	// 根据名称查询
	Product queryByName(Map<String, Object> params);

	// 根据id查询
	Product queryById(Map<String, Object> params);

	// 查询产品分类
	List<ProductType> queryProductTypes (Map<String, Object> params);
	
	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updOne(Map<String, Object> params);
	
	// 修改状态
	Integer updState(Map<String, Object> params);

	// 物理删除
	void deleteOne(Map<String, Object> params);
}
