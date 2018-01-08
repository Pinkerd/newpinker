package com.pinker.service;

import com.pinker.entity.Friend;
import com.pinker.entity.Page;
import com.pinker.entity.pk_user;

import java.util.List;

public interface FriendService {
    /**
     * 通过userID分页查询该用户所有好友信息
     * @param page
     * @param
     * @return
     */
    Page<Friend> findFriendByUserId(Page<Friend> page, pk_user user);


    /**
     * 新建好友关系
     */
    boolean beFriend(Friend friend);

    /**
     * 发送好友请求
     */
    boolean friendRequest(Friend friend);

    /**
     * 查询是否为好友关系（0：好友邀请 1：好友 2：无关系 ）
     */
    int isFriend(Friend friend);

    /**
     * 按用户ID以及好友状态查询所有好友
     */
    List<Friend> getAllFriByUserIdAndStatue(int userId,int statue);


    /**
     * 删除好友关系，相互删除两条数据
     */
    boolean deleteEachFri(Friend friend);
}
