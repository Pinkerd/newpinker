package com.pinker.dao;

import com.pinker.entity.Blog;
import com.pinker.entity.CollectionBlog;

import java.util.Date;
import java.util.List;

//修改版
public interface CollectionBlogDao {


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
     * 按用户查找该用户所有收藏
     */
    List<CollectionBlog> findAllByUerId(int userId);

}
