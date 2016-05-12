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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.ProStockInfo;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.record.ProOrderLogService;
import com.shop.snack.web.service.record.ProStockInfoService;
import com.shop.snack.web.utils.TimeUtils;
import com.shop.snack.web.utils.WebConstants;

@Controller
@RequestMapping("/proStock")
public class ProStockInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoAction.class);

	@Autowired
	protected ProStockInfoService proStockInfoService;
	@Autowired
	protected ProOrderLogService proOrderLogService;

	@RequestMapping(value = "/proStock")
	public ModelAndView proStock(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/proStock/proStockInfo");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? WebConstants.PAGE_DEFAULT_PAGESIZE : pageSize);
		// 时间条件
		if (bean != null && bean.getQueryTime() != null && !bean.getQueryTime().equals("")) {
			Map<String, String> time = TimeUtils.getSETime(bean.getQueryTime());
			params.put("starttime", time.get("starttime") + " 00:00:00");
			params.put("endtime", time.get("endtime") + " 23:59:59");
		}

		PageBean page = proStockInfoService.queryPage(params);

		mv.addObject("bean", bean);
		mv.addObject("page", page);
		return mv;
	}

	@RequestMapping(value = "/flowInfo")
	public ModelAndView flowInfo(String flowId, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/proStock/proStockFlow");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? WebConstants.PAGE_DEFAULT_PAGESIZE : pageSize);
		params.put("flowId", flowId);

		// 流水ID(新增/修改)
		if (flowId == null || flowId.equals("")) {
			mv.addObject("proStockInfo", null);
			mv.addObject("page", null);
		} else {
			ProStockInfo proStockInfo = proStockInfoService.queryByFlowId(flowId);
			PageBean page = proOrderLogService.queryPage(params);
			
			mv.addObject("proStockInfo", proStockInfo);
			mv.addObject("page", page);
		}

		return mv;
	}

	/**
	 * 删除
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteOne")
	public @ResponseBody
	Map<String, Object> deleteProduct(HttpServletRequest request, String id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("flowId", id);
		Integer re = proOrderLogService.deleteFlowId(params);
		re = proStockInfoService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

}
