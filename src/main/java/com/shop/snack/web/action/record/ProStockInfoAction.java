package com.shop.snack.web.action.record;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.shop.snack.web.model.ProOrderLog;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.record.ProOrderLogService;
import com.shop.snack.web.utils.TimeUtils;
import com.shop.snack.web.utils.WebConstants;

@Controller
@RequestMapping("/proStock")
public class ProStockInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoAction.class);

	@Autowired
	public ProOrderLogService service;
	
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

	/**
	 * 删除
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/deleteOne")
	public @ResponseBody
	Map<String, Object> deleteOne(HttpServletRequest request, String id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = service.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

	/**
	 * 修改或者新添
	 * 
	 * @param ProOrderLog
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/saveOrder")
	public @ResponseBody
	Map<String, Integer> saveProduct(@ModelAttribute ProOrderLog proOrderLog, HttpServletRequest request) {
		Map<String, Integer> re = new HashMap<String, Integer>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date());
		proOrderLog.setCreateTime(time);
		proOrderLog.setOrderDate(time);
		params.put("proOrderLog", proOrderLog);
		// 判断是添加还是修改
		if (proOrderLog.getId() != null && !proOrderLog.getId().equals("")) {
			// 修改
			num = service.updOne(params);
		} else {
			// 添加
			num = service.addOne(params);
		}
		re.put("msg", num);
		return re;
	}
	
	@RequestMapping(value = "/editStockOrder")
	public ModelAndView editUser(HttpServletRequest request, String id) {
		ModelAndView mv = new ModelAndView("/record/proStockInfoChild");
		if (id != null && !id.equals("")) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			ProOrderLog proOrderLog = service.queryById(params);
			mv.addObject("stockOrder", proOrderLog);
		} else {
			mv.addObject("stockOrder", null);
		}

		return mv;
	}
}
