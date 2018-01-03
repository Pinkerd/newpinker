package com.pinker.dao;


import com.pinker.entity.Page;
import com.pinker.entity.pk_topic;

import java.util.List;

public interface TopicDao {
     pk_topic selectOne(Integer id);

     List<pk_topic> selectAll();

     int add(String title, String content, String titleimg, Integer userId);

     int change(String title, String content, String titleimg, Integer userId);

     int delete(Integer id);

     Page<pk_topic> findTopic(Page<pk_topic> page);

     List<pk_topic> findByUserId(Integer userId);

}
