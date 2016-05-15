package com.shop.snack.web.dao.homePage;

import java.util.List;
import java.util.Map;

public interface HomeDao {

	List<Map<String, Object>> queryDefaultSize(Map<String, Object> params);
	
	void kpiAnalysis(Map<String, Object> params);
}
