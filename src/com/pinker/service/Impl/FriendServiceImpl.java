package com.pinker.service.Impl;

import com.pinker.dao.FriendDao;
import com.pinker.dao.UserDao;
import com.pinker.dao.impl.FriendDaoImpl;
import com.pinker.dao.impl.UserDaoImpl;
import com.pinker.entity.Friend;
import com.pinker.entity.Page;
import com.pinker.entity.pk_user;
import com.pinker.service.FriendService;

import java.util.List;

public class FriendServiceImpl implements FriendService {
    UserDao userDao=new UserDaoImpl();
    FriendDao friendDao=new FriendDaoImpl();

    /**
     * 填充用户，好友用户实体
     * @param friend
     */
    private void setFull(Friend friend){
        pk_user user=userDao.findByUserId(friend.getUserId());
        pk_user friendUser=userDao.findByUserId(friend.getFriendId());

        friend.setUser(user);
        friend.setFriend(friendUser);
    }


    /**
     * 交换userID,friendIdy以实现相互添加
     * @param friend
     */
    private void swapFriend(Friend friend){
        int temp=friend.getUserId();
        friend.setUserId(friend.getFriendId());
        friend.setFriendId(temp);
    }

    /**
     * 通过userID查询该用户所有好友信息
     * @param page
     * @param friend
     * @return
     */
    @Override
    public Page<Friend> findFriendByUserId(Page<Friend> page, Friend friend) {
        Page<Friend> friendPage=friendDao.findFriendByUserId(friend,page);
        for (Friend frienb:friendPage.getData()) {
            setFull(friend);
        }
        return friendPage;
    }



    /**
     * 新建好友关系
     */
    @Override
    public boolean beFriend(Friend friend) {
        friendDao.updateFri(friend,1);
        this.swapFriend(friend);
        int row=friendDao.insertFri(friend,1);
        return row!=0;
    }

    /**
     * 发送好友请求
     * @param friend
     * @return
     */
    @Override
    public boolean friendRequest(Friend friend) {
        return friendDao.insertFri(friend,0)!=0;
    }

    /**
     * 查询是否为好友关系（0：好友邀请 1：好友 2：无关系 ）
     */
    @Override
    public int isFriend(Friend friend) {
        this.swapFriend(friend);
        Friend fri=friendDao.selectOneFri(friend);
        if (fri != null) {
            return fri.getStatue();
        }else{
            return 2;
        }
    }





    /**
     * 按好友状态查询所有好友
     */
    @Override
    public List<Friend> getAllFriByUserIdAndStatue(int userId, int statue) {
        Friend friend=new Friend();
        friend.setUserId(userId);
        friend.setStatue(statue);
        List<Friend> list= friendDao.selectFriByIdAndStatue(friend);
        for (Friend fri:list) {
            setFull(fri);
        }
        return list;
    }

    /**
     * 删除好友关系
     * @param friend
     * @return
     */
    @Override
    public boolean deleteEachFri(Friend friend) {
        System.out.println("deleteFri");
       int i= friendDao.deleteFri(friend);
        this.swapFriend(friend);
       int j= friendDao.deleteFri(friend);
       if(i!=0&&j!=0){
           return true;
       }
        return false;
    }

}
