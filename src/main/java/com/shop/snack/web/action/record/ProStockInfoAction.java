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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.ProOrderLog;
import com.shop.snack.web.model.Product;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.record.ProOrderLogService;
import com.shop.snack.web.service.record.ProductService;
import com.shop.snack.web.utils.TimeUtils;
import com.shop.snack.web.utils.WebConstants;

@Controller
@RequestMapping("/proStock")
public class ProStockInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoAction.class);

	@Autowired
	public ProductService productService;
	@Autowired
	public ProOrderLogService proOrderLogService;

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

		PageBean page = proOrderLogService.queryPage(params);

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
	@Transactional
	public @ResponseBody
	Map<String, Object> deleteOne(HttpServletRequest request, String id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer re = -1;
		// 订单ID
		params.put("id", id);
		// 查询订单信息
		ProOrderLog pol = proOrderLogService.queryById(params);
		// 查询库存信息
		params.put("id", pol.getProductId());
		Integer inventoryNums = productService.queryInventory(params);
		inventoryNums = inventoryNums == null ? 0 : inventoryNums;
		params.put("id", id);
		// 删除订单后,判断库存数是否小于零
		if (pol.getOrderNum() != null && !"".equals(pol.getOrderNum())) {
			if (inventoryNums - Integer.parseInt(pol.getOrderNum()) >= 0) {
				// 删除订单
				re = proOrderLogService.deleteOne(params);
				// 更新库存
				params.put("orderNum", -Integer.parseInt(pol.getOrderNum()));
				productService.updInventory(params);
			} else {
				msg.put("info", "违规操作,删除后库存为负!");
			}
		}

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
	@Transactional
	public @ResponseBody
	Map<String, Object> saveOrder(@ModelAttribute ProOrderLog proOrderLog, HttpServletRequest request) {
		Map<String, Object> re = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, Object> qryParams = new HashMap<String, Object>();
		Map<String, Object> proParams = new HashMap<String, Object>();
		Integer num = -1;

		// 通过产品名称查询产品信息
		proParams.put("name", proOrderLog.getProductName());
		Product product = productService.queryByName(proParams);
		if (product != null) {
			proOrderLog.setTypeId(product.getTypeId());
			proOrderLog.setProductId(product.getId());

			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
			String time = df.format(new Date());
			proOrderLog.setCreateTime(time);
			proOrderLog.setOrderDate(time);
			params.put("proOrderLog", proOrderLog);

			// 判断是添加还是修改
			if (proOrderLog.getId() != null && !proOrderLog.getId().equals("")) {
				// 修改订单后,判断库存数是否小于零
				qryParams.put("id", proOrderLog.getId());
				ProOrderLog pol = proOrderLogService.queryById(qryParams);
				Integer inventoryNums = product.getNums() == null ? 0 : product.getNums();
				if (pol.getOrderNum() != null && !"".equals(pol.getOrderNum())) {
					if (inventoryNums - Integer.parseInt(pol.getOrderNum()) + Integer.parseInt(proOrderLog.getOrderNum()) >= 0) {
						// 修改
						num = proOrderLogService.updOne(params);
						// 更新库存
						qryParams.put("id", product.getId());
						qryParams.put("orderNum", -Integer.parseInt(pol.getOrderNum()) + Integer.parseInt(proOrderLog.getOrderNum()));
						productService.updInventory(qryParams);
					} else {
						// 更新后库存为负数
						re.put("info", "违规操作,删除后库存为负!");
					}
				}
			} else {
				// 添加
				num = proOrderLogService.addOne(params);
				// 更新库存
				qryParams.put("id", product.getId());
				qryParams.put("orderNum", Integer.parseInt(proOrderLog.getOrderNum()));
				productService.updInventory(qryParams);
			}
		} else {
			re.put("info", "操作失败,产品不存在!");
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
			ProOrderLog proOrderLog = proOrderLogService.queryById(params);
			mv.addObject("stockOrder", proOrderLog);
		} else {
			mv.addObject("stockOrder", null);
		}

		return mv;
	}
}
