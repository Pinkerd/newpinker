package com.pinker.service.Impl;

import com.pinker.entity.pk_user;
import com.pinker.service.UserService;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by Aries.Gu on 2018/1/5.
 */

public class UserServiceImplTest {

    UserService us=new UserServiceImpl();
    @Test
    public void findByLoginName() throws Exception {
        pk_user caiyingshi = us.findByLoginName("caiyingshi");
        System.out.println(caiyingshi);
    }

}