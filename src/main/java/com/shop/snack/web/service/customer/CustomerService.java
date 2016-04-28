package com.shop.snack.web.service.customer;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.dao.customer.CustomerDao;
import com.shop.snack.web.model.CustomerInfo;
import com.shop.snack.web.service.commManager.BaseService;

@Service("customerService")
public class CustomerService extends BaseService {

	private static Logger logger = LoggerFactory.getLogger(CustomerService.class);

	@Autowired
	private CustomerDao customerDao;

	/**
	 * 分页查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public PageBean queryProduct(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(CustomerDao.class, params);
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
	public CustomerInfo queryById(Map<String, Object> params) {
		try {
			CustomerInfo customerInfo = customerDao.queryById(params);
			return customerInfo;
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
			re = customerDao.deleteOne(params);
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
			re = customerDao.addOne(params);
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
	public Integer updOne(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = customerDao.updOne(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
}
