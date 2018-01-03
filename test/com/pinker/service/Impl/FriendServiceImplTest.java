package com.pinker.service.Impl;

import com.pinker.entity.Friend;
import com.pinker.service.FriendService;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class FriendServiceImplTest {
    @Test
    void getAllFriByUserIdAndStatue() {
        FriendService service= new FriendServiceImpl();

        List<Friend> list=service.getAllFriByUserIdAndStatue(3,0);
        System.out.println(list);
    }

}