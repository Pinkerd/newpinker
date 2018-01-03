package com.pinker.service.Impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.CollectionBlogDao;
import com.pinker.dao.impl.CollectionBlogDaoImpl;
import com.pinker.entity.CollectionBlog;
import com.pinker.service.CollectionBlogService;

import java.util.Date;
import java.util.List;

public class CollectionBlogServiceImpl extends BaseDao<CollectionBlog> implements CollectionBlogService {
    CollectionBlogDao collectionBlogDao=new CollectionBlogDaoImpl();
    @Override
    public List<CollectionBlog> getAllCollectionBlog() {
        return collectionBlogDao.getAllCollectionBlog();
    }

    @Override
    public CollectionBlog findCollectionBlogByUserId(int userId) {
        String sql = "select blogId, userId, collecttime from pk_collectionblog where userId=?";
        return this.getBean(sql, userId);
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
    public int deleteCollectionBlogByUserId(int userId) {
        String sql = "delete from pk_collectionblog where userId=?";
        return this.update(sql, userId);
    }
}
