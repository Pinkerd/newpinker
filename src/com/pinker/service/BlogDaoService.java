package com.pinker.service;


import com.pinker.entity.Blog;
import com.pinker.entity.Page;

import java.util.List;

public interface BlogDaoService {
    /**
     * 增加一条数据
     */
    int SaveBlog(Blog blog);
    /**
     *查询所有数据
     */
    List<Blog> getAllBlog();
    /**
     * 查询一条数据
     */
    Blog getBlogById(Integer id);
    /**
     * 删除一条数据
     */
    int DelBlog(Integer id);
    /**
     * 更新一条数据(修改)
     */
    int UpdateBlog(Blog blog, Integer id);

    /**
     * 分页查询
     */
    Page<Blog> findBlog(Page<Blog> page);

    /**
     * 查询用户博文内容
     */
    List<Blog> findUser(int userId);


    /**
     * 查询话题下博文列表
     */
    List<Blog> findTopicBlogList(int topicId);

}
