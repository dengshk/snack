package com.shop.snack.web.dao.record;

import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.ProStockInfo;

public interface ProStockInfoDao extends PageMapper {
	// 物理删除
	Integer deleteOne(Map<String, Object> params);

	// 根据流水号查询
	ProStockInfo queryByFlowId(String flowId);
}
