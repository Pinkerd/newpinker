package com.pinker.dao;

import com.pinker.entity.Friend;
import com.pinker.entity.Page;
import com.pinker.entity.pk_user;

import java.util.List;

public interface FriendDao {
    /**
     * 按userID，friendID查询一个
     * @param friend
     * @return
     */
    Friend selectOneFri(Friend friend);

    /**
     * 查询所有好友列表
     * @return
     */
    List<Friend> selectAllFri();

    /**
     * 按照userID,以及状态查询该用户好友
     * @param friend
     * @return
     */
    List<Friend> selectFriendsByUserId(Friend friend, Integer statue);

    /**
     * 插入好友，默认为申请状态
     * @param friend
     * @return
     */
    int insertFri(Friend friend, Integer statue);


    /**
     * 分页查按照userID查询该用户好友
     * @param
     * @param page
     * @return
     */
    Page<Friend> findFriendByUserId(pk_user user, Page<Friend> page);

    /**
     * 更新好友状态
     */
    int updateFri(Friend friend, Integer statue);

    /**
     * 按好友状态查询所有好友
     */
    List<Friend> selectFriByIdAndStatue(Friend friend);


    /**
     * 按用户Id，friendId删除好友关系
     */
    int deleteFri(Friend friend);
}
