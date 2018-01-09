package com.pinker.dao.impl;


import com.pinker.dao.FriendDao;
import org.junit.jupiter.api.Test;

public class FriendTest {

    @Test
    public void testfriendRe(){
        FriendDao friendDao= new FriendDaoImpl();

        System.out.println(friendDao.countRequest(1));

    }
}
