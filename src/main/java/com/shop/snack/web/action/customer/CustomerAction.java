package com.shop.snack.web.action.customer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.CustomerInfo;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.customer.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerAction {

	@Autowired
	private CustomerService customerService;

	private static Logger logger = LoggerFactory.getLogger(CustomerAction.class);

	@RequestMapping(value = "/customer")
	public ModelAndView customer(QueryBean bean, HttpServletRequest request, Integer pageIndex, Integer pageSize) {
		ModelAndView mv = new ModelAndView("/customer/customer");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", pageSize);
		params.put("pageIndex", pageIndex);
		if (bean.getCustomerName() != null && !bean.getCustomerName().equals("")) {
			params.put("customerName", bean.getCustomerName());
		}
		PageBean page = customerService.queryCustomer(params);
		mv.addObject("page", page);
		mv.addObject("bean", bean);
		return mv;
	}

	@RequestMapping(value = "/edit")
	public ModelAndView edit(HttpServletRequest request, Integer id) {
		ModelAndView mv = new ModelAndView("/customer/child");
		if (id != null && !id.equals("")) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
			CustomerInfo customerInfo = customerService.queryById(params);
			mv.addObject("customerInfo", customerInfo);
		} else {
			mv.addObject("customerInfo", null);
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
	@RequestMapping(value = "/delete")
	public @ResponseBody
	Map<String, Object> delete(HttpServletRequest request, Integer id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = customerService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

	/**
	 * 修改或者新添
	 * 
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/save")
	public @ResponseBody
	Map<String, Object> save(@ModelAttribute CustomerInfo customerInfo, HttpServletRequest request) {
		Map<String, Object> re = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Map<String, Object> paramsQuery = new HashMap<String, Object>();
		Integer num = -1;

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date());
		customerInfo.setCreateTime(time);
		customerInfo.setModifyTime(time);
		params.put("customerInfo", customerInfo);
		// 判断是添加还是修改
		if (customerInfo.getId() != null) {
			// 修改
			num = customerService.updOne(params);
		} else {
			// 判断顾客名称是否已存在
			paramsQuery.put("customerName", customerInfo.getCustomerName());
			CustomerInfo ci = customerService.queryByName(paramsQuery);
			if (ci != null && ci.getCustomerName() != null) {
				re.put("msg", num);
				re.put("info", "已存在该顾客信息");
			} else {
				// 添加
				num = customerService.addOne(params);
			}
		}
		re.put("msg", num);
		return re;
	}

	@RequestMapping(value = "/searchCustomerName")
	public @ResponseBody
	Map<String, Object> searchCustomersByName(HttpServletRequest request, String customerName) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<CustomerInfo> customers = customerService.searchCustomersByName(customerName);
		map.put("customers", customers);
		return map;
	}
}
