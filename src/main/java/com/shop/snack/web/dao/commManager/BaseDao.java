package com.shop.snack.web.dao.commManager;

import java.util.List;
import java.util.Map;

import com.shop.snack.support.PageBean;

public interface BaseDao {
	public PageBean queryForList(Class<?> daoType,Map<String,Object> params) throws Exception;
	
	public void batchInsert(Class<?> type,List<?> list,Integer batchNum) throws Exception;
}
