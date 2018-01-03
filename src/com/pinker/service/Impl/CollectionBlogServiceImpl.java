package com.pinker.service.Impl;

import com.pinker.dao.BaseDao;
import com.pinker.dao.BlogDao;
import com.pinker.dao.CollectionBlogDao;
import com.pinker.dao.UserDao;
import com.pinker.dao.impl.BlogDaoImpl;
import com.pinker.dao.impl.CollectionBlogDaoImpl;
import com.pinker.dao.impl.UserDaoImpl;
import com.pinker.entity.Blog;
import com.pinker.entity.CollectionBlog;
import com.pinker.entity.pk_user;
import com.pinker.service.CollectionBlogService;

import java.util.Date;
import java.util.List;

public class CollectionBlogServiceImpl implements CollectionBlogService {
    CollectionBlogDao collectionBlogDao=new CollectionBlogDaoImpl();
    UserDao userDao=new UserDaoImpl();
    BlogDao blogDao= new BlogDaoImpl();
    /**
     * 填充用户和博文
     */
    private void setFull(CollectionBlog collectionBlog){
        int userId=collectionBlog.getUserId();
        int blogId=collectionBlog.getBlogId();

        pk_user user=userDao.findByUserId(userId);
        Blog blog= blogDao.getBlogById(blogId);

        collectionBlog.setBlog(blog);
        collectionBlog.setUser(user);

    }

    @Override
    public CollectionBlog findCollectionBlogByUserIdAndBlogId(int userId, int blogId) {
        String sql="select * from pk_collectionblog where userId=? and blogId=?";
        CollectionBlog collectionBlog=collectionBlogDao.findCollectionBlogByUserIdAndBlogId(userId,blogId);
        this.setFull(collectionBlog);
        return collectionBlog;
    }

    @Override
    public int saveCollectionBlog(CollectionBlog collectionBlog) {
        return collectionBlogDao.saveCollectionBlog(collectionBlog);

    }


    @Override
    public int deleteCollectionBlogByUserId(int userId, int blogId) {
        return collectionBlogDao.deleteCollectionBlogByUserId(userId,blogId);
    }

    @Override
    public List<CollectionBlog> findAllByUserId(int userId) {
        List<CollectionBlog> list=collectionBlogDao.findAllByUerId(userId);
        for (CollectionBlog colle:list) {
            this.setFull(colle);
        }

        return list;
    }


}
