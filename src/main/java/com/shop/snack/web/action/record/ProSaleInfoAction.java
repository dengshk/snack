package com.shop.snack.web.action.record;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.EPQueryBean;
import com.shop.snack.web.model.ProSaleInfo;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.record.ProOrderLogService;
import com.shop.snack.web.service.record.ProSaleInfoService;
import com.shop.snack.web.utils.TimeUtils;
import com.shop.snack.web.utils.WebConstants;

@Controller
@RequestMapping("/proSale")
public class ProSaleInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProSaleInfoAction.class);

	@Autowired
	public ProSaleInfoService service;
	@Autowired
	public ProOrderLogService proOrderLogService;

	@RequestMapping(value = "/fetchPage")
	public ModelAndView fetchPage(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfo");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? WebConstants.PAGE_DEFAULT_PAGESIZE : pageSize);
		// 订货人
		params.put("customerName", (bean.getCustomerName() == null || bean.getCustomerName().equals("") ? null : bean.getCustomerName()));
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

	@RequestMapping(value = "/child")
	public ModelAndView child(EPQueryBean bean, Integer pageIndex, Integer pageSize, Integer id, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfoChild");
		if (id == null || id.equals("")) {
			mv.addObject("proSaleInfo", null);
			mv.addObject("page", null);
		} else {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("flowId", id);
			params.put("pageSize", pageSize);
			params.put("pageIndex", pageIndex);
			ProSaleInfo proSaleInfo = service.queryById(params);
			mv.addObject("proSaleInfo", proSaleInfo);
			// 订单查询
			PageBean page = proOrderLogService.queryPage(params);
			mv.addObject("page", page);
		}
		return mv;
	}

	@RequestMapping(value = "/updSaleInfoValue")
	public @ResponseBody
	Map<String, Integer> updSaleInfoValue(@ModelAttribute ProSaleInfo proSaleInfo, HttpServletRequest request) {
		Map<String, Integer> re = new HashMap<String, Integer>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;

		params.put("flowId", proSaleInfo.getFlowId());
		params.put("state", proSaleInfo.getState());
		params.put("pay", proSaleInfo.getPay());
		params.put("type", proSaleInfo.getType());

		num = service.updSaleInfoValue(params);
		re.put("msg", num);

		return re;
	}
}
