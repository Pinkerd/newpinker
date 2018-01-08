package com.pinker.dao.impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.CollectionBlogDao;
import com.pinker.entity.CollectionBlog;

import java.util.Date;
import java.util.List;

public class CollectionBlogDaoImpl extends BaseDao<CollectionBlog> implements CollectionBlogDao {
    @Override
    public List<CollectionBlog> getAllCollectionBlog() {
        String sql = "select blogId, userId, concerntime from pk_collectionblog";
        return this.getListBean(sql);
    }

    @Override
    public CollectionBlog findCollectionBlogByUserId(int blogId,int userId) {
        String sql = "select blogId, userId, collecttime from pk_collectionblog where blogId=? and userId=?";
        return this.getBean(sql,blogId,userId);
    }

    @Override
    public CollectionBlog findCollectionBlogByCollectTime(Date collectTime) {
        String sql = "select blogId, userId, collecttime from pk_collectionblog where collecttime=?";
        return this.getBean(sql, collectTime);
    }

    @Override
    public int saveCollectionBlog(CollectionBlog collectionBlog) {
        String sql = "insert into pk_collectionblog(blogId, userId, collecttime) values(?,?,?)";
        return this.update(sql, collectionBlog.getBlogId(), collectionBlog.getUserId(), collectionBlog.getCollecttime());
    }

    @Override
    public int deleteCollectionBlogByUserId(int blogId,int userId) {
        String sql = "delete from pk_collectionblog where blogId=? and userId=?";
        return this.update(sql,blogId,userId);
    }

}
