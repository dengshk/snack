package com.shop.snack.web.action.record;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.web.model.Product;
import com.shop.snack.web.model.ProductType;
import com.shop.snack.web.service.record.ProOrderLogService;

@Controller
@RequestMapping("/proOrderLog")
public class ProOrderLogAction {
	private static final Logger logger = LoggerFactory.getLogger(ProOrderLogAction.class);

	@Autowired
	ProOrderLogService proOrderLogService;

	@RequestMapping(value = "/deleteOne")
	public @ResponseBody
	Map<String, Object> deleteProduct(HttpServletRequest request, Integer id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		Integer re = proOrderLogService.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}
	
	@RequestMapping(value = "/editSaleOrder")
	public ModelAndView editUser(HttpServletRequest request, Integer id) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfoChildChild");
		if (id != null && !id.equals("")) {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", id);
//			Product product = productService.queryById(params);
//			mv.addObject("product", product);
			mv.addObject("saleOrder", null);
		} else {
			mv.addObject("saleOrder", null);
		}

//		List<ProductType> productTypes = productService.queryProductTypes(null);
		mv.addObject("productTypes", null);
		return mv;
	}
}
