package com.pinker.dao;

import com.pinker.entity.Thirdparty;

public interface ThirdPartyDao {

    //按照站点，及第三方登录名来查询是否有重复
    Thirdparty selectBySourceSiteAndloginName(String sourceSite, String loginName);


    //插入第三方信息
    int insertThird(String sourceSite,String loginName,String userName,int userId);


}
