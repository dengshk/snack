package com.shop.snack.web.action.record;

import java.awt.geom.Area;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.shop.snack.web.model.Product;
import com.shop.snack.web.service.record.ProductService;

@Controller
@RequestMapping("/record")
public class ProductManagerAction {

	@Autowired
	private ProductService productService;

	private static Logger logger = LoggerFactory.getLogger(ProductManagerAction.class);

	@RequestMapping(value = "/newProduct")
	public ModelAndView proManagerPage(HttpServletRequest request, Integer pageIndex, Integer pageSize) {
		ModelAndView mv = new ModelAndView("/record/newProduct");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("pageSize", pageSize);
		params.put("pageIndex", pageIndex);
		PageBean page = productService.queryProduct(params);
		mv.addObject("page", page);
		return mv;
	}

	/**
	 * 进入用户编辑页面
	 * 
	 * @param request
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/editProduct")
	public ModelAndView editUser(HttpServletRequest request, Integer userId) {
		ModelAndView mv = new ModelAndView("/record/editProduct");
		Map<String, Object> params = new HashMap<String, Object>();
		List<Area> provinces = new ArrayList<Area>();
		List<Area> districts = new ArrayList<Area>();
		List<Area> countys = new ArrayList<Area>();
		List<Map<String, Object>> groups = new ArrayList<Map<String, Object>>();

		mv.addObject("checkuni", "1");
		mv.addObject("checkmob", "0");
		mv.addObject("checktele", "0");
		mv.addObject("provinces", provinces);
		mv.addObject("districts", districts);
		mv.addObject("countys", countys);
		mv.addObject("groups", groups);
		mv.addObject("user", null);
		return mv;
	}
	
	/**
	 * 修改用户启用状态
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/changeState")
	public @ResponseBody Map<String ,Integer> changeUserState(@ModelAttribute Product product,HttpServletRequest request) {
		Map<String, Integer> re = new HashMap<String, Integer>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;
		
		params.put("state", product.getState());
		//判断是添加还是修改
		params.put("id", product.getId());
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());
		params.put("modifyDate", time);
		num = productService.changeState(params);
		re.put("msg", num);
		return re;
	}
	
	
}
