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
import com.shop.snack.web.model.EPQueryBean;
import com.shop.snack.web.service.record.ProSaleInfoService;
import com.shop.snack.web.service.record.ProductService;

@Controller
@RequestMapping("/proSale")
public class ProSaleInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProSaleInfoAction.class);

	@Autowired
	public ProSaleInfoService service;
	@Autowired
	public ProductService productService;

	@Autowired
	@RequestMapping(value = "/fetchPage")
	public ModelAndView proInQuery() {
		ModelAndView mv = new ModelAndView("/record/proSaleInfo");
		EPQueryBean bean = new EPQueryBean();
		Map<String, Object> params = new HashMap<String, Object>();
		PageBean page = service.queryPage(params);

		mv.addObject("page", page);
		mv.addObject("countrys", null);
		mv.addObject("citys", null);
		mv.addObject("areas", null);
		mv.addObject("models", null);
		mv.addObject("colletions", null);
		mv.addObject("visions", null);
		return mv;
	}

	@RequestMapping(value = "/child")
	public ModelAndView child(EPQueryBean bean ,Integer pageIndex ,
			Integer pageSize,Integer id ,HttpServletResponse response ,HttpServletRequest request){
		ModelAndView mv = new ModelAndView("/record/proSaleInfoChild");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", pageSize);
		params.put("pageIndex", pageIndex);
		PageBean page = productService.queryProduct(params);
		mv.addObject("page", page);
		return mv;
	}
}
