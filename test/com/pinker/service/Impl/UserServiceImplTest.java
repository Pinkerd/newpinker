package com.pinker.service.Impl;

import com.pinker.entity.pk_user;
import com.pinker.service.UserService;
import org.junit.Test;

import java.util.List;

/**
 * Created by Aries.Gu on 2018/1/5.
 */

public class UserServiceImplTest {
    @Test
   public  void updatePswQA()   throws Exception{
        boolean b = us.updatePswQA("asdasd", "111", "qweqwe", "222", "333", "zczxz", 1);
        System.out.println(b);
    }

    @Test
    public void findUserByEmail() throws Exception {
        pk_user userByEmail = us.findUserByEmail("674675741@qq.com");
        System.out.println(userByEmail);
    }

    UserService us=new UserServiceImpl();
    @Test
    public void findByUserId() throws Exception {
        pk_user byUserId = us.findByUserId(1);
        System.out.println(byUserId);
    }

    @Test
    public void findByUserName() throws Exception {
        List<pk_user> user = us.findByUserName("顾");
        System.out.println(user);
    }


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