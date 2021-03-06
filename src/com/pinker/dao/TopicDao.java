package com.pinker.dao;


import com.pinker.entity.Page;
import com.pinker.entity.pk_topic;

import java.util.Date;
import java.util.List;

public interface TopicDao {
     pk_topic selectOne(Integer id);

     List<pk_topic> selectAll();

     int add(int topicId, String title, String content, String titleimg, Integer userId);

     int change(String title, String content, String titleimg, Integer userId);

     int delete(Integer id);

     Page<pk_topic> findTopic(Page<pk_topic> page);

     List<pk_topic> findByUserId(Integer userId);

     /**
      * 上传话题..
      */

      /*管理员通过相关字段查询话题*/
     List<pk_topic> mhFind(String ps);


     int uploadTopic(int id, String title, String content, int userId, Date publishtime);

     /**
      * 模糊查询话题
      */
     List<pk_topic> fuzzSearchTopic(String key);


     /**
      *更新话题状态
      */
     int updateStaus(int topicId, int status);


     /**
      * 按照话题状态查询话题
      */
     Page<pk_topic> findTopicByStatus(int status, Page<pk_topic> page);


}
