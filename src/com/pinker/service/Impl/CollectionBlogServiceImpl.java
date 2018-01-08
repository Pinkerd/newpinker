package com.pinker.service.Impl;
//修改版
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

    /**
     * 查询一个blog收藏的方法
     * @param userId
     * @return
     */
    @Override
    public CollectionBlog findCollectionBlogByUserIdAndBlogId(int userId, int blogId) {
        String sql="select * from pk_collectionblog where userId=? and blogId=?";
        CollectionBlog collectionBlog=collectionBlogDao.findCollectionBlogByUserIdAndBlogId(userId,blogId);
        this.setFull(collectionBlog);
        return collectionBlog;
    }

    /**
     * 增加一个blog收藏的方法
     * @param collectionBlog
     * @return
     */
    @Override
    public int saveCollectionBlog(CollectionBlog collectionBlog) {
        return collectionBlogDao.saveCollectionBlog(collectionBlog);

    }


    /**
     * 删除一个blog收藏的方法
     * @param userId
     * @return
     */
    @Override
    public int deleteCollectionBlogByUserId(int userId, int blogId) {
        return collectionBlogDao.deleteCollectionBlogByUserId(userId,blogId);
    }

    /**
     * 查询该用户所有收藏博客方法
     */
    @Override
    public List<CollectionBlog> findAllByUserId(int userId) {
        List<CollectionBlog> list=collectionBlogDao.findAllByUerId(userId);
        for (CollectionBlog colle:list) {
            this.setFull(colle);
        }

        return list;
    }


}
