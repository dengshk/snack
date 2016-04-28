package com.shop.snack.web.service.inventory;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.dao.customer.CustomerDao;
import com.shop.snack.web.dao.inventory.InventoryDao;
import com.shop.snack.web.model.CustomerInfo;
import com.shop.snack.web.model.InventoryInfo;
import com.shop.snack.web.service.commManager.BaseService;

@Service("inventoryService")
public class InventoryService extends BaseService {

	private static Logger logger = LoggerFactory.getLogger(InventoryService.class);

	@Autowired
	private InventoryDao inventoryDao;

	/**
	 * 分页查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public PageBean queryInventory(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(InventoryDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public InventoryInfo queryById(Map<String, Object> params) {
		try {
			InventoryInfo inventoryInfo = inventoryDao.queryById(params);
			return inventoryInfo;
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
			re = inventoryDao.deleteOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 添加
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer addOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = inventoryDao.addOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}

	/**
	 * 修改
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer updNums(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = inventoryDao.updNums(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
}
