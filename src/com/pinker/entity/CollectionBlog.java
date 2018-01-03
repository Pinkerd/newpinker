package com.pinker.entity;

import java.util.Date;

/**
 * 收藏博文
 */
public class CollectionBlog {
    //博文Id
    private int blogId;
    //用户Id
    private int userId;
    //收藏博文时间

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public pk_user getUser() {
        return user;
    }

    public void setUser(pk_user user) {
        this.user = user;
    }

    private Date collecttime;

    /**
     * 存放用户，博文内容的对象
     */
    Blog blog= new Blog();
    pk_user user= new pk_user();


    public CollectionBlog(int blogId) {
        this.blogId = blogId;
    }

    public CollectionBlog() {
    }

    public CollectionBlog(int blogId, int userId, Date collecttime) {
        this.blogId = blogId;

        this.userId = userId;
        this.collecttime = collecttime;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Date getCollecttime() {
        return collecttime;
    }

    public void setCollecttime(Date collecttime) {
        this.collecttime = collecttime;
    }

    @Override
    public String toString() {
        return "CollectionBlog{" +
                "blogId=" + blogId +
                ", userId=" + userId +
                ", collecttime=" + collecttime +
                '}';
    }
}
