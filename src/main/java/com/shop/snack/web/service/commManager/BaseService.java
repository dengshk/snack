package com.shop.snack.web.service.commManager;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.shop.snack.support.PageBean;
import com.shop.snack.web.dao.commManager.BaseDao;

public class BaseService {
	
	private static Logger logger = LoggerFactory.getLogger(BaseService.class);
	
	@Autowired
	protected BaseDao baseDao;
	
	/**
	 * 分页查询
	 * @param params
	 *         查询参数
	 * @param clazz
	 *         目标dao
	 * @return
	 * @throws Exception
	 */
	protected PageBean queryForList(Class<?> clazz, Map<String,Object> params) throws Exception {		
		return baseDao.queryForList(clazz, params);
	}

}
