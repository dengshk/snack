package com.shop.snack.web.dao.record;

import java.util.List;
import java.util.Map;

import com.shop.snack.web.dao.commManager.PageMapper;

public interface ProInDao extends PageMapper {

	List<Map<String, Object>> queryCollection();

	List<Map<String, Object>> queryModel();

	List<Map<String, Object>> queryVision();

	List<String> getEpName(String name);

	void updateInfo(Map<String, Object> map);

	void insertInfo(Map<String, Object> map);

	Integer checkName(String imei);

	List<Integer> getIds(Map<String, Object> param);
	
	public void insertByBatch(Map<String ,Object> param);

	Map<String, Object> queryChild(Integer id);

	List<Map<String, Object>> queryAll(Map<String, Object> param);

}
