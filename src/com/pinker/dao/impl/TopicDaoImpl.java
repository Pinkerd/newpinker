package com.pinker.dao.impl;


import com.pinker.dao.BaseDao;
import com.pinker.dao.TopicDao;
import com.pinker.entity.Page;
import com.pinker.entity.pk_topic;

import java.util.Date;
import java.util.List;

public class TopicDaoImpl extends BaseDao<pk_topic > implements TopicDao {
    @Override
    public pk_topic selectOne(Integer id) {
      String sql = "select id,title,content,titleimg,userId,publishtime from pk_topic where id =?";
        return getBean(sql,id);
    }

    @Override
    public List<pk_topic> selectAll() {
        String sql = "select * from pk_topic";
        return getListBean(sql);
    }

    @Override
    public int add(int topicId,String title, String content, String titleimg, Integer userId) {
        String sql = "insert into pk_topic(id,title,content,titleimg,userId,publishtime,status) values(?,?,?,?,?,NOW(),0)";
        return update(sql,topicId,title,content,titleimg,userId);
    }

    @Override
    public int change(String title,String content,String titleimg,Integer userId) {
        String sql = "update pk_topic set title=? ,content = ?,titleimg=?,userId = ?, publishtime =NOW() where id=?";
        return update(sql,title,content,titleimg,userId);
    }

    @Override
    public int delete(Integer id) {
        String sql = "delete from pk_topic where id=?";
        return update(sql,id);
    }

    public List<pk_topic> mhFind(String ps) {
        String sql="select * from pk_topic where title like ?";
        return this.getListBean(sql,"%"+ps+"%");
    }

    @Override
    public Page<pk_topic> findTopic(Page<pk_topic> page) {
        String totalRecodeSql="select count(*) from pk_topic";
        //书总数
        long totalRecodeL= 0;

        totalRecodeL = (long) this.getSingleValue(totalRecodeSql);

        int totalRecode= (int) totalRecodeL;
        page.setTotalRecord(totalRecode);
        //页面显示行数
        int pageSize=page.getPageSize();
        //偏移索引值
        int index=page.getIndex();

        String listSql="select * from pk_topic limit ?,?";
        List<pk_topic> list=this.getListBean(listSql,index,pageSize);

        page.setData(list);
        return page;

    }

    @Override
    public List<pk_topic> findByUserId(Integer userId) {
        String sql="select * from pk_topic where userId=?";
        return this.getListBean(sql,userId);

    }


    /**
     * 上传话题，ID程序生成
     * @param id
     * @param title
     * @param content
     * @param userId
     * @param publishtime
     * @return
     */
    @Override
    public int uploadTopic(int id, String title, String content, int userId, Date publishtime) {
        String sql="insert into pk_topic (id,title,content,userId,publishtime,status) values (?,?,?,?,?,0)";

        return this.update(sql,id,title,content,userId,publishtime);

    }

    /**
     * 模糊查询话题
     * @param key
     * @return
     */
    @Override
    public List<pk_topic> fuzzSearchTopic(String key) {
        String sql="select * from pk_topic where title like ? and status=1";
        return this.getListBean(sql,"%"+key+"%");

    }

    /**
     * 更新话题状态
     * @param topicId
     * @param status
     * @return
     */
    @Override
    public int updateStaus(int topicId, int status) {
        String sql="update pk_topic set status=? where id=?";
        return this.update(sql,status,topicId);
    }

    /**
     * 分页按状态查询
     * @param status
     * @param page
     * @return
     */
    @Override
    public Page<pk_topic> findTopicByStatus(int status,Page<pk_topic> page) {
        String totalRecordSql="select count(*) from pk_topic where status=?";
        long totalRecordL= (Long) this.getSingleValue(totalRecordSql,status);
        page.setTotalRecord((int)totalRecordL );

        //显示行数
        int pageSize=page.getPageSize();
        //偏移值
        int index=page.getIndex();

        String listSql="select * from pk_topic where status=? limit ?,?";
        List<pk_topic> list=this.getListBean(listSql,status,index,pageSize);
        page.setData(list);
        return page;
    }


}
