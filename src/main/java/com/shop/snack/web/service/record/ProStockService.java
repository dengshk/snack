package com.shop.snack.web.service.record;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.dao.record.ProOrderLogDao;
import com.shop.snack.web.service.commManager.BaseService;

@Service("proInService")
public class ProStockService extends BaseService {

	private static final Logger logger = LoggerFactory.getLogger(ProStockService.class);
	@Autowired
	public ProOrderLogDao dao;

	/**
	 * 分页查询
	 * 
	 * @param params
	 * @return
	 */
	public PageBean queryPage(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProOrderLogDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

}
