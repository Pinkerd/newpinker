package com.pinker.dao.impl;

import com.pinker.dao.UserDao;
import com.pinker.entity.pk_user;
import org.junit.Test;

/**
 * Created by Aries.Gu on 2018/1/5.
 */

public class UserDaoImplTest {

    UserDao ud=new UserDaoImpl();
    @Test
    public void findStatusById() throws Exception {
       /* Long statusById = ud.findStatusById(1);*/
      /*  System.out.println(statusById);*/
    }


    @Test
    public void updatePassword1() throws Exception {
        boolean b = ud.updatePassword(1, "123123");
        System.out.println(b);
    }

    @Test
    public void findByLoginName() throws Exception {
        pk_user caiyingshi = ud.findByLoginName("caiyingshi");
        System.out.println(caiyingshi);


    }

}