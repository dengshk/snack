package com.shop.snack.web.action.record;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.EPQueryBean;
import com.shop.snack.web.service.record.ProInService;

@Controller
@RequestMapping("/proIn")
public class ProInAction {

	private static final Logger logger = LoggerFactory.getLogger(ProInAction.class);

	@Autowired
	public ProInService service;

	@Autowired
	// public ImportEpinfoService importService;
	@RequestMapping(value = "/fetchPage")
	public ModelAndView proInQuery() {
		ModelAndView mv = new ModelAndView("/epinfo/epinfo");
		EPQueryBean bean = new EPQueryBean();
		PageBean page = null;

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
