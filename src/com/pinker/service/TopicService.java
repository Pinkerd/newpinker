package com.pinker.service;


import com.pinker.entity.Page;
import com.pinker.entity.pk_topic;

import java.util.Date;
import java.util.List;

public interface TopicService {
     /**
      * 查询一个话题的方法
      * @param id
      * @return
      */
     pk_topic selectOne(Integer id);

     /**
      * 查询多个话题的方法
      * @return
      */
     List<pk_topic> selectAll();

     /**
      * 增加话题的方法
      * @param title
      * @param content
      * @param titleimg
      * @param userId
      * @return
      */
     int add(String title, String content, String titleimg, Integer userId);

     /**
      * 修改话题的方法
      * @param title
      * @param content
      * @param titleimg
      * @param userId
      * @return
      */
     int change(String title, String content, String titleimg, Integer userId);

     /**
      * 删除话题的方法
      * @param id
      * @return
      */
     int delete(Integer id);

     /**
      * 分页查询的方法
      * @param page
      * @return
      */
     Page<pk_topic> findTopic(Page<pk_topic> page);

     /**
      * 按照用户id查询
      * @param userId
      * @return
      */
     List<pk_topic> findByUserId(Integer userId);


     /**
      * 上传话题
      */
     int uploadTopic(int id, String title, String content, int userId);
}
