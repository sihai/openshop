/*
 * Copyright 2005-2013 AIGECHIBAOLE. All rights reserved.
 * Support: http://www.aigechibaole.com
 * License: http://www.aigechibaole.com/license
 */
package com.openteach.openshop.server.service.dao.impl;

import org.springframework.stereotype.Repository;

import com.openteach.openshop.server.service.dao.AdDAO;
import com.openteach.openshop.server.service.entity.Ad;

/**
 * Dao - 广告
 * 
 * @author AIGECHIBAOLE Team
 * @version 0.0.1
 */
@Repository("adDaoImpl")
public class AdDAOImpl extends BaseDAOImpl<Ad, Long> implements AdDAO {

}