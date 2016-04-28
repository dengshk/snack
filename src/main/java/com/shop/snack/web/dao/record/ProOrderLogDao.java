package com.shop.snack.web.dao.record;

import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.ProOrderLog;

public interface ProOrderLogDao extends PageMapper {

	// 根据id查询
	ProOrderLog queryById(Map<String, Object> params);

	// 物理删除
	Integer deleteOne(Map<String, Object> params);
	Integer deleteFlowId(Map<String, Object> params);

	// 添加
	Integer addOne(Map<String, Object> params);

	// 修改
	Integer updOne(Map<String, Object> params);
}
