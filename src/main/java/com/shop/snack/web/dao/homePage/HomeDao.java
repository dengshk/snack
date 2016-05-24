package com.shop.snack.web.dao.homePage;

import java.util.List;
import java.util.Map;

public interface HomeDao {

	List<Map<String, Object>> queryDefaultSize(Map<String, Object> params);
	
	Map<String, Object> queryTotalStatus();
	
	void kpiAnalysis(Map<String, Object> params);
	
	List<Map<String, Object>> querySaleTop(Map<String, Object> params);
}
