package com.pinker.dao.impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.CollectionBlogDao;
import com.pinker.entity.Blog;
import com.pinker.entity.CollectionBlog;

import java.util.Date;
import java.util.List;

public class CollectionBlogDaoImpl extends BaseDao<CollectionBlog> implements CollectionBlogDao {


    @Override
    public CollectionBlog findCollectionBlogByUserIdAndBlogId(int userId, int blogId) {
        String sql="select * from pk_blog where userId=? and blogId=?";
        return this.getBean(sql,userId,blogId);
    }

    @Override
    public int saveCollectionBlog(CollectionBlog collectionBlog) {
        String sql = "insert into pk_collectionblog(blogId, userId, collecttime) values(?,?,?)";
        return this.update(sql, collectionBlog.getBlogId(), collectionBlog.getUserId(), new Date());
    }

    @Override
    public int deleteCollectionBlogByUserId(int userId, int blogId) {
        String sql = "delete from pk_collectionblog where userId=? and blogId=?";
        return this.update(sql, userId);
    }

    @Override
    public List<CollectionBlog> findAllByUerId(int userId) {
        String sql="select * from pk_blog where userId=?";
        return this.getListBean(sql,userId);
    }
}
