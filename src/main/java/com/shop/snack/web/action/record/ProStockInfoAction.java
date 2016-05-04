package com.shop.snack.web.action.record;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.record.ProStockService;
import com.shop.snack.web.utils.TimeUtils;
import com.shop.snack.web.utils.WebConstants;

@Controller
@RequestMapping("/proStock")
public class ProStockInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoAction.class);

	@Autowired
	public ProStockService service;

	@RequestMapping(value = "/proStock")
	public ModelAndView proStock(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/record/proStockInfo");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? WebConstants.PAGE_DEFAULT_PAGESIZE : pageSize);
		// 进货订单查询
		params.put("type", 1);
		// 产品名称
		params.put("productName", (bean.getProductName() == null || bean.getProductName().equals("") ? null : bean.getProductName()));
		// 时间条件
		if (bean != null && bean.getQueryTime() != null && !bean.getQueryTime().equals("")) {
			Map<String, String> time = TimeUtils.getSETime(bean.getQueryTime());
			params.put("starttime", time.get("starttime") + " 00:00:00");
			params.put("endtime", time.get("endtime") + " 23:59:59");
		}

		PageBean page = service.queryPage(params);

		mv.addObject("bean", bean);
		mv.addObject("page", page);
		return mv;
	}

}
