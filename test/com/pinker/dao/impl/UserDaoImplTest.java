package com.pinker.dao.impl;

import com.pinker.dao.UserDao;
import com.pinker.entity.pk_user;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by Aries.Gu on 2018/1/5.
 */

public class UserDaoImplTest {
    UserDao ud=new UserDaoImpl();
    @Test
    public void findByLoginName() throws Exception {
        pk_user caiyingshi = ud.findByLoginName("caiyingshi");
        System.out.println(caiyingshi);


    }

}