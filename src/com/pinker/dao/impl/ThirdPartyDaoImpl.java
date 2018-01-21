package com.pinker.dao.impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.ThirdPartyDao;
import com.pinker.entity.Thirdparty;

public class ThirdPartyDaoImpl extends BaseDao<Thirdparty> implements ThirdPartyDao {
    @Override
    public Thirdparty selectBySourceSiteAndloginName(String sourceSite, String loginName) {
        String sql="select * from pk_thirdparty where sourceSite=? and loginName=?";
       return this.getBean(sql, sourceSite, loginName);

    }

    @Override
    public int insertThird(String sourceSite, String loginName, String userName, int userId) {
        String sql="insert into pk_thirdparty (sourcesite,loginName,userName,userId)values(?,?,?,?)";
        return this.update(sql,sourceSite,loginName,userName,userId);
    }
}
