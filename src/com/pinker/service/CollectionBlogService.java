package com.pinker.service;

import com.pinker.entity.CollectionBlog;

import java.util.Date;
import java.util.List;

public interface CollectionBlogService {

    /**
     * 查询所有blog收藏的方法
     */
    List<CollectionBlog> getAllCollectionBlog();

    /**
     * 查询一个blog收藏的方法
     * @param userId
     * @return
     */
    CollectionBlog findCollectionBlogByUserId(int blogId, int userId);

    /**
     * 通过时间查询一个blog收藏的方法
     * @param collectTime
     * @return
     */
    CollectionBlog findCollectionBlogByCollectTime(Date collectTime);

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
    int  deleteCollectionBlogByUserId(int blogId, int userId);
}
