package com.shop.snack.web.action.record;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.EPQueryBean;
import com.shop.snack.web.service.record.ProSaleInfoService;

@Controller
@RequestMapping("/proSale")
public class ProSaleInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProSaleInfoAction.class);

	@Autowired
	public ProSaleInfoService service;

	@Autowired
	// public ImportEpinfoService importService;
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

}
