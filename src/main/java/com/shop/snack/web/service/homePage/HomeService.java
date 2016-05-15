package com.shop.snack.web.service.homePage;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.snack.web.dao.homePage.HomeDao;

@Service("homeService")
public class HomeService {

	private static final Logger logger = LoggerFactory.getLogger(HomeService.class);

	@Autowired
	HomeDao dao;

	public Map<String, Object> getChartsInfo(String uuid, String userId) {
		Map<String, Object> params1 = new HashMap<String, Object>();
		Map<String, Object> params2 = new HashMap<String, Object>();

		Map<String, Object> reMap = new HashMap<String, Object>();// 返回结果
		List<String> xAxisData = new ArrayList<String>();// 时间
		List<String> serTotalProfit = new ArrayList<String>();// 累计收益
		List<String> serDayProfit = new ArrayList<String>();// 当天盈利
		List<String> serDayExpend = new ArrayList<String>();// 当天亏损
		try {
			// 执行存储过程
			params1.put("uuid", uuid);
			params1.put("userId", userId);
			dao.kpiAnalysis(params1);
			// 查询数据
			params2.put("qryUuid", uuid);
			List<Map<String, Object>> queryMap = dao.queryDefaultSize(params2);
			for (Map<String, Object> map : queryMap) {
				xAxisData.add(map.get("calTime") + "");
				serTotalProfit.add(map.get("totalProfit") + "");
				serDayProfit.add(map.get("dayProfit") + "");
				serDayExpend.add(map.get("dayExpend") + "");
			}
		} catch (Exception e) {
			logger.error("query infomation homePage", e);
		}
		reMap.put("xAxisData", xAxisData);
		reMap.put("serTotalProfit", serTotalProfit);
		reMap.put("serDayProfit", serDayProfit);
		reMap.put("serDayExpend", serDayExpend);
		return reMap;
	}

}
