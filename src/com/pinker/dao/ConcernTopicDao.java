package com.pinker.dao;

import com.pinker.entity.ConcernTopic;

import java.util.Date;
import java.util.List;

public interface ConcernTopicDao {

    /**
     * 查询一个话题收藏
     */
    ConcernTopic findConcernTopicByUserIdAndTopicId(int userId,int topicId);

    /**
     * 增加一个话题收藏
     */
    int saveConcernTopic(ConcernTopic concernTopic);

    /**
     * 删除一个话题收藏
     */
    int  deleteConcernTopicByUserId(int userId,int topicId);


    /**
     *查询该用户所有话题收藏
     */
    List<ConcernTopic> findAllByUserId(int userId);
}
