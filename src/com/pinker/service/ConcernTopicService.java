package com.pinker.service;

import com.pinker.entity.ConcernTopic;

import java.util.Date;
import java.util.List;

public interface ConcernTopicService {

    /**
     * 查询该用户所有话题收藏
     * @param userId
     * @return
     */
    List<ConcernTopic> findConcernTopicByUserId(int userId);


    /**
     * 增加一个话题收藏
     * @param concernTopic
     * @return
     */
    int saveConcernTopic(ConcernTopic concernTopic);

    /**
     * 删除一个话题收藏
     * @param userId 用户ID
     * @param topicId 话题ID
     * @return
     */
    int  deleteConcernTopicByUserId(int userId,int topicId);
}
