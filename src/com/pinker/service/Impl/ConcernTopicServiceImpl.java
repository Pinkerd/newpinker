package com.pinker.service.Impl;


//修改版
import com.pinker.dao.ConcernTopicDao;
import com.pinker.dao.TopicDao;
import com.pinker.dao.UserDao;
import com.pinker.dao.impl.ConcernTopicDaoImpl;
import com.pinker.dao.impl.TopicDaoImpl;
import com.pinker.dao.impl.UserDaoImpl;
import com.pinker.entity.ConcernTopic;
import com.pinker.entity.pk_topic;
import com.pinker.entity.pk_user;
import com.pinker.service.ConcernTopicService;

import java.util.List;

public class ConcernTopicServiceImpl  implements ConcernTopicService {
    ConcernTopicDao concernTopicDao=new ConcernTopicDaoImpl();
    UserDao userDao= new UserDaoImpl();
    TopicDao topicDao= new TopicDaoImpl();


    /**
     * 填充用户，话题对象
     * @param concernTopic
     */
    private void setFull(ConcernTopic concernTopic){
        int userId=concernTopic.getUesrId();
        int topicId= concernTopic.getTopicId();

        pk_user user=userDao.findByUserId(userId);
        pk_topic topic= topicDao.selectOne(topicId);
        concernTopic.setUser(user);
        concernTopic.setTopic(topic);
    }


    /**
     * 查询该用户所有话题收藏
     * @param userId
     * @return
     */
    @Override
    public List<ConcernTopic> findConcernTopicByUserId(int userId) {
        List<ConcernTopic> list=concernTopicDao.findAllByUserId(userId);
        for (ConcernTopic conce:list) {
            this.setFull(conce);

        }
        return list;
    }

    /**
     * 增加一个话题收藏
     * @param concernTopic
     * @return
     */
    @Override
    public int saveConcernTopic(ConcernTopic concernTopic) {
        return concernTopicDao.saveConcernTopic(concernTopic);
    }

    /**
     * 删除一个话题收藏
     * @param userId 用户ID
     * @param topicId 话题ID
     * @return
     */
    @Override
    public int deleteConcernTopicByUserId(int userId, int topicId) {
        return concernTopicDao.deleteConcernTopicByUserId(userId,topicId);
    }

    /**
     * 查询一个。按userID和TopicId
     *
     * @param userId
     * @param topicId
     * @return
     */
    @Override
    public ConcernTopic findByUsrIdAndTopicId(int userId, int topicId) {
        return concernTopicDao.findConcernTopicByUserIdAndTopicId(userId,topicId);
    }
}
