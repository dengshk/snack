package com.shop.snack.web.service.record;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.dao.record.ProductDao;
import com.shop.snack.web.model.Product;
import com.shop.snack.web.model.ProductType;
import com.shop.snack.web.service.commManager.BaseService;

@Service("productService")
public class ProductService extends BaseService {

	private static Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Autowired
	private ProductDao productDao;

	/**
	 * 分页查询用户信息
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public PageBean queryProduct(Map<String, Object> params) {
		try {
			PageBean page = super.queryForList(ProductDao.class, params);
			return page;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}
	
	/**
	 * 查询产品分类
	 * 
	 * @param params
	 *            查询参数
	 * @return
	 */
	public List<ProductType> queryProductTypes(Map<String, Object> params) {
		try {
			List<ProductType> productTyps = productDao.queryProductTypes(params);
			return productTyps;
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
	public Product queryById(Map<String, Object> params) {
		try {
			Product product = productDao.queryById(params);
			return product;
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * 修改用户状态
	 * 
	 * @param params
	 *            参数
	 * @return
	 */
	public Integer changeState(Map<String, Object> params) {
		Integer re = -1;
		try {
			re = productDao.updState(params);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return re;
	}
}