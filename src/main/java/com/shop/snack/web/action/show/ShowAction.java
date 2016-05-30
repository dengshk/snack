package com.shop.snack.web.action.show;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/show")
public class ShowAction {
	private static final Logger logger = LoggerFactory.getLogger(ShowAction.class);
	
	@RequestMapping(value = "/product")
	public ModelAndView netWorkHome(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/show/product");
		return mv;
	}
}
