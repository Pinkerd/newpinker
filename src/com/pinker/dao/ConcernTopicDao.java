package com.pinker.dao;

import com.pinker.entity.ConcernTopic;

import java.util.Date;
import java.util.List;

public interface ConcernTopicDao {

    /**
     * 查询一个话题收藏
     * @param userId
     * @return
     */
    ConcernTopic findConcernTopicByUserId(int userId);

    /**
     * 查询所有话题收藏
     * @return
     */
    List<ConcernTopic> getAllConcernTopic();

    /**
     * 按时间查询一个话题收藏
     * @param concernTime
     * @return
     */
    ConcernTopic  findConcernTopicByConcernTime(Date concernTime);

    /**
     * 增加一个话题收藏
     * @param concernTopic
     * @return
     */
    int saveConcernTopic(ConcernTopic concernTopic);

    /**
     * 删除一个话题收藏
     * @param userId
     * @return
     */
    int  deleteConcernTopicByUserId(int userId);

}
