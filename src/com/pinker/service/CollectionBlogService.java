package com.pinker.service;

import com.pinker.entity.CollectionBlog;

import java.util.Date;
import java.util.List;

public interface CollectionBlogService {



    /**
     * 查询一个blog收藏的方法
     * @param userId
     * @return
     */
    CollectionBlog findCollectionBlogByUserIdAndBlogId(int userId,int blogId);



    /**
     * 增加一个blog收藏的方法
     * @param collectionBlog
     * @return
     */
    int saveCollectionBlog(CollectionBlog collectionBlog);

    /**
     * 删除一个blog收藏的方法
     * @param userId
     * @return
     */
    int  deleteCollectionBlogByUserId(int userId,int blogId);

    /**
     * 查询该用户所有收藏博客方法
     */
    List<CollectionBlog> findAllByUserId(int userId);

}
