package com.pinker.service;

import com.pinker.entity.Comment;
import com.pinker.entity.Page;

import java.util.List;

/***
 * CommentService接口
 */

public interface CommentService {
    /**
     * 增加评论
     */
    boolean savecom(Comment comment);
    /**
     * 删除评论
     */
    boolean getdelct(Comment comment);
    /**
     * 查询博客下所有评论
     */
    List<Comment> getselect(int blogId);
    /**
     * 查询多个评论
     */
    List<Comment> getselectAll();

    /**
     * 分页查询
     */
    Page<Comment> findComment(Page<Comment> page);
}
