package com.shop.snack.web.action.inventory;

import java.util.HashMap;
import java.util.List;
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
import com.shop.snack.web.model.ProductType;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.customer.CustomerService;
import com.shop.snack.web.service.inventory.InventoryService;
import com.shop.snack.web.service.record.ProductService;

@Controller
@RequestMapping("/inventory")
public class InventoryAction {

	@Autowired
	private InventoryService inventoryService;
	@Autowired
	private ProductService productService;

	private static Logger logger = LoggerFactory.getLogger(InventoryAction.class);

	@RequestMapping(value = "/inventory")
	public ModelAndView fetchPage(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/inventory/inventory");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", pageSize);
		params.put("pageIndex", pageIndex);
		PageBean page = inventoryService.queryInventory(params);
		List<ProductType> productTypes = productService.queryProductTypes(null);
		mv.addObject("productTypes", productTypes);
		mv.addObject("page", page);
		return mv;
	}

}
