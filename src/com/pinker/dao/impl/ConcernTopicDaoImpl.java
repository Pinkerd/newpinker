package com.pinker.dao.impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.ConcernTopicDao;
import com.pinker.entity.ConcernTopic;

import java.util.Date;
import java.util.List;

public class ConcernTopicDaoImpl extends BaseDao<ConcernTopic> implements ConcernTopicDao {
    @Override
    public ConcernTopic findConcernTopicByUserId(int userId) {
        String sql = "select userId, topicId, concerntime from pk_concerntopic where userId=?";
        return this.getBean(sql, userId);
    }

    @Override
    public List<ConcernTopic> getAllConcernTopic() {
        String sql = "select userId, topicId, concernTime from pk_concerntopic";
        return this.getListBean(sql);
    }

    @Override
    public ConcernTopic findConcernTopicByConcernTime(Date concernTime) {
        String sql = "select userId, topicId, concerntime from pk_concerntopic where concerntime=?";
        return this.getBean(sql, concernTime);
    }

    @Override
    public int saveConcernTopic(ConcernTopic concernTopic) {
        String sql = "insert into pk_concerntopic(userId, topicId, concerntime) values(?,?,?)";
        return this.update(sql, concernTopic.getUesrId(), concernTopic.getTopicId(), concernTopic.getConcernTime());
    }

    @Override
    public int deleteConcernTopicByUserId(int userId) {
        String sql = "delete from pk_concerntopic where userId=?";
        return this.update(sql, userId);
    }
}
