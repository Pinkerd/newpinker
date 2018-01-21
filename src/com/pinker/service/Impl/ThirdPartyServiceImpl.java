package com.pinker.service.Impl;

import com.pinker.dao.ThirdPartyDao;
import com.pinker.dao.impl.ThirdPartyDaoImpl;
import com.pinker.entity.Thirdparty;
import com.pinker.service.ThirdPartyService;

public class ThirdPartyServiceImpl implements ThirdPartyService{
    ThirdPartyDao thirdPartyDao= new ThirdPartyDaoImpl();


    @Override
    public Thirdparty selectBySourceSiteAndloginName(String sourceSite, String loginName) {
        return thirdPartyDao.selectBySourceSiteAndloginName(sourceSite,loginName);
    }

    @Override
    public int insertThird(String sourceSite, String loginName, String userName, int userId) {
        return  thirdPartyDao.insertThird(sourceSite,loginName,userName,userId);
    }

}
