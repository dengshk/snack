package com.shop.snack.web.action.record;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.model.CustomerInfo;
import com.shop.snack.web.model.ProSaleInfo;
import com.shop.snack.web.model.QueryBean;
import com.shop.snack.web.service.customer.CustomerService;
import com.shop.snack.web.service.record.ProOrderLogService;
import com.shop.snack.web.service.record.ProSaleImportService;
import com.shop.snack.web.service.record.ProSaleInfoService;
import com.shop.snack.web.utils.StringUtils;
import com.shop.snack.web.utils.TimeUtils;
import com.shop.snack.web.utils.WebConstants;

@Controller
@RequestMapping("/proSale")
public class ProSaleInfoAction {

	private static final Logger logger = LoggerFactory.getLogger(ProSaleInfoAction.class);

	@Autowired
	public ProSaleInfoService service;
	@Autowired
	public ProOrderLogService proOrderLogService;
	@Autowired
	public ProSaleImportService proSaleImportService;
	@Autowired
	public CustomerService customerService;

	@RequestMapping(value = "/fetchPage")
	public ModelAndView fetchPage(QueryBean bean, Integer pageIndex, Integer pageSize, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfo");
		Map<String, Object> params = new HashMap<String, Object>();

		// 分页条件
		params.put("pageIndex", pageIndex == null ? WebConstants.PAGE_DEFAULT_PAGEINDEX : pageIndex);
		params.put("pageSize", pageSize == null ? WebConstants.PAGE_DEFAULT_PAGESIZE : pageSize);
		// 订货人
		params.put("customerName", (bean.getCustomerName() == null || bean.getCustomerName().equals("") ? null : bean.getCustomerName()));
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

	@RequestMapping(value = "/child")
	public ModelAndView child(QueryBean bean, Integer pageIndex, Integer pageSize, String flowId, HttpServletResponse response, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfoChild");
		// 顾客信息
		List<CustomerInfo> customers = customerService.searchCustomersByName(null);
		mv.addObject("customers", customers);

		if (flowId == null || flowId.equals("")) {
			mv.addObject("proSaleInfo", null);
			mv.addObject("page", null);
		} else {
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("flowId", flowId);
			params.put("pageSize", pageSize);
			params.put("pageIndex", pageIndex);
			ProSaleInfo proSaleInfo = service.queryById(params);
			mv.addObject("proSaleInfo", proSaleInfo);
			// 销售订单查询
			params.put("type", 2);
			// 订单查询
			PageBean page = proOrderLogService.queryPage(params);
			mv.addObject("page", page);
		}
		return mv;
	}

	@RequestMapping(value = "/updSaleInfoValue")
	public @ResponseBody
	Map<String, Integer> updSaleInfoValue(@ModelAttribute ProSaleInfo proSaleInfo, HttpServletRequest request) {
		Map<String, Integer> re = new HashMap<String, Integer>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;

		params.put("flowId", proSaleInfo.getFlowId());
		params.put("state", proSaleInfo.getState());
		params.put("pay", proSaleInfo.getPay());
		params.put("type", proSaleInfo.getType());

		num = service.updSaleInfoValue(params);
		re.put("msg", num);

		return re;
	}

	/**
	 * 
	 * 功能说明: 保存或修改销售信息 修改者名字: dsk 修改日期 2016年4月27日 修改内容
	 * 
	 * @参数： @param proSaleInfo
	 * @参数： @param request
	 * @参数： @return
	 * @throws
	 */
	@RequestMapping(value = "/saveSaleInfo")
	public @ResponseBody
	Map<String, Object> saveProduct(@ModelAttribute ProSaleInfo proSaleInfo, HttpServletRequest request) {
		Map<String, Object> re = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		Integer num = -1;

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 设置日期格式
		String time = df.format(new Date());
		proSaleInfo.setCreateTime(time);
		params.put("proSaleInfo", proSaleInfo);
		// 订单日期为空,则为当天
		if (proSaleInfo.getOrderDate() == null || "".equals(proSaleInfo.getOrderDate())) {
			proSaleInfo.setOrderDate(time);
		}
		// 运费及其他
		if (proSaleInfo.getExpressPrice() == null || "".equals(proSaleInfo.getExpressPrice())) {
			proSaleInfo.setExpressPrice("0");
		}
		// 判断是添加还是修改
		if (proSaleInfo.getFlowId() != null && !proSaleInfo.getFlowId().equals("")) {
			// 修改
			num = service.updOne(params);
		} else {
			// 流水号
			proSaleInfo.setFlowId(StringUtils.getFlowId());
			// 默认已付款/交易完成
			proSaleInfo.setPay(1);
			proSaleInfo.setState(3);
			proSaleInfo.setType(proSaleInfo.getExpress() == null || proSaleInfo.getExpress().equals("") ? 1 : 2);

			// 添加
			num = service.addOne(params);
		}
		re.put("flowId", proSaleInfo.getFlowId());
		re.put("msg", num);
		return re;
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
	Map<String, Object> deleteProduct(HttpServletRequest request, String id) {
		Map<String, Object> msg = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("flowId", id);
		Integer re = proOrderLogService.deleteFlowId(params);
		re = service.deleteOne(params);
		msg.put("msg", re);
		return msg;
	}

	/**
	 * 查询
	 * 
	 * @param request
	 * @param customerName
	 * @return
	 */
	@RequestMapping(value = "/queryByName")
	public @ResponseBody
	Map<String, Object> queryByName(HttpServletRequest request, String customerName) {
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> params = new HashMap<String, Object>();

		params.put("customerName", customerName);
		CustomerInfo customer = customerService.queryByName(params);
		map.put("customer", customer);
		return map;
	}

	@RequestMapping(value = "/createExport")
	public @ResponseBody
	String createExport(QueryBean bean, HttpServletRequest request) {
		String fileName = "-1";
		try {
			fileName = service.createExport(request, bean);
		} catch (Exception e) {
			logger.error("Large batch processing", e);
		}
		return fileName;
	}

	@RequestMapping(value = "/importFile")
	public ModelAndView importFile(Integer id) {
		ModelAndView mv = new ModelAndView("/record/proSaleInfoImportFile");
		return mv;
	}

	@RequestMapping(value = "saveExcel", method = RequestMethod.POST)
	public void saveExcel(HttpServletRequest request, HttpServletResponse response, @RequestParam("file") MultipartFile file) throws IOException {
		// 生成文件存放于服务器的路径
		String filePath = request.getSession().getServletContext().getRealPath("/");
		filePath = filePath.replace("\\", "/");
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> list = proSaleImportService.analytical(file, filePath);
			if (list != null && list.size() > 0) {
				map.put("msg", -1);
				map.put("error", getModal(list));
			} else {
				map.put("msg", 0);
				map.put("error", null);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(map).toString();
		StringUtils.sendJson(json, response);
	}

	private String getModal(List<Map<String, Object>> list) {
		StringBuilder sb = new StringBuilder();
		for (Map<String, Object> info : list) {
			sb.append(info.get("name") + " : " + info.get("info") + "<br />");
		}
		return sb.toString();
	}
}
