package com.pinker.dao.impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.ConcernTopicDao;
import com.pinker.entity.ConcernTopic;

import java.util.Date;
import java.util.List;

public class ConcernTopicDaoImpl extends BaseDao<ConcernTopic> implements ConcernTopicDao {

    /**
     * 查询一个话题收藏
     */
    @Override
    public ConcernTopic findConcernTopicByUserIdAndTopicId(int userId, int topicId) {
        String sql="select * from pk_concerntopic where userId=? and topicId=?";
        return this.getBean(sql,userId,topicId);
    }

    /**
     * 增加一个话题收藏
     */
    @Override
    public int saveConcernTopic(ConcernTopic concernTopic) {
        String sql = "insert into pk_concerntopic(userId, topicId, concerntime) values(?,?,?)";
        return this.update(sql, concernTopic.getUesrId(), concernTopic.getTopicId(), concernTopic.getConcernTime());
    }

    /**
     * 删除一个话题收藏
     */
    @Override
    public int deleteConcernTopicByUserId(int userId, int topicId) {
        String sql= "delete from pk_concerntopic where userId=? and topicId=?";
        return this.update(sql,userId,topicId);
    }


    /**
     *查询该用户所有话题收藏
     */
    @Override
    public List<ConcernTopic> findAllByUserId(int userId) {
        String sql="select * from pk_concerntopic where userId=?";
        return this.getListBean(sql,userId);
    }


}
