package com.shop.snack.web.dao.record;

import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;
import com.shop.snack.web.model.ProSaleInfo;

public interface ProSaleInfoDao extends PageMapper {

	// 根据id查询
	ProSaleInfo queryById(Map<String, Object> params);
	
	// 修改某一字段值
	Integer updSaleInfoValue(Map<String, Object> params);
	
}
