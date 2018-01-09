package com.pinker.service.Impl;

import com.pinker.entity.pk_user;
import com.pinker.service.UserService;
import org.junit.Test;

/**
 * Created by Aries.Gu on 2018/1/5.
 */

public class UserServiceImplTest {
    UserService us=new UserServiceImpl();
    @Test
    public void findStatusById() throws Exception {
     /*   Long statusById = us.findStatusById(1);
        System.out.println(statusById);*/
    }


    @Test
    public void updatePassword() throws Exception {
        boolean b = us.updatePassword(1, "123123");
        System.out.println(b);
    }


    @Test
    public void findByLoginName() throws Exception {
        pk_user caiyingshi = us.findByLoginName("caiyingshi");
        System.out.println(caiyingshi);
    }

}