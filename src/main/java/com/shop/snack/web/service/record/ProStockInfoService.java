package com.shop.snack.web.service.record;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.dao.record.ProStockInfoDao;
import com.shop.snack.web.model.ProSaleInfo;
import com.shop.snack.web.model.ProStockInfo;
import com.shop.snack.web.service.commManager.BaseService;

@Service("proStockInfoService")
public class ProStockInfoService extends BaseService {

	private static final Logger logger = LoggerFactory.getLogger(ProStockInfoService.class);
	@Autowired
	public ProStockInfoDao proStockInfoDao;

	/**
	 * 分页查询
	 * 
	 * @param params
	 * @return
	 */
	public PageBean queryPage(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProStockInfoDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 删除
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer deleteOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = proStockInfoDao.deleteOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 根据流水号查询
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public ProStockInfo queryByFlowId(String flowId) {
		try {
			ProStockInfo proStockInfo = proStockInfoDao.queryByFlowId(flowId);
			return proStockInfo;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
}
