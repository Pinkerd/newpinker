package com.pinker.dao.impl;

import com.pinker.dao.UserDao;
import com.pinker.entity.Page;
import com.pinker.entity.pk_user;
import org.junit.Test;

import java.util.List;

/**
 * Created by Aries.Gu on 2018/1/5.
 */

public class UserDaoImplTest {
    UserDao ud=new UserDaoImpl();

    @Test
    public void findUserByEmail() throws Exception {
       /* "674675741@qq.com"*/

        pk_user userByEmail   = ud.findUserByEmail("caiyingshi1@qq.com");
        System.out.println(userByEmail);
    }


    @Test
    public void findIdResult() throws Exception {
        Page<pk_user> page=new  Page<pk_user>();
        Page<pk_user> idResult = ud.findIdResult(page, 1, 1);
        System.out.println(idResult);
    }

    @Test
    public void findNameResult() throws Exception {
        Page<pk_user> page=new  Page<pk_user>();
        Page<pk_user> userPage = ud.findNameResult(page, "王", 1);
        System.out.println(userPage);
    }


    @Test
    public void findByUserName() {
        List<pk_user> user = ud.findByUserName("顾");
        System.out.println(user);
    }


    @Test
   public  void findByUserId() {
        pk_user byUserId = ud.findByUserId(1);
        System.out.println(byUserId);
    }


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