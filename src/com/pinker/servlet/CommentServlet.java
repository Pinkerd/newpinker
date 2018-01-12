package com.pinker.servlet;

import com.google.gson.Gson;
import com.pinker.entity.Comment;
import com.pinker.entity.pk_user;
import com.pinker.service.CommentService;
import com.pinker.service.Impl.CommentServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Yang on 2017/12/26.
 * Comment管理servlet
 * function：
 * 1.查询博客下所有的评论
 * 2.添加评论
 */
@WebServlet(name = "CommentServlet",urlPatterns = ("/CommentServlet"))
public class CommentServlet extends BaseServlet {
    private CommentService com =new CommentServiceImpl();
    private Gson gson= new Gson();
    /**
     * 查询博客下所有的评论
     * getselectAll
     */
    protected void getselectAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int blogId= Integer.parseInt(req.getParameter("blogId"));
        List<Comment> list=com.getselect(blogId);
        String listJ=gson.toJson(list);
        resp.getWriter().print(listJ);
    }

    /**
     * 添加评论
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void saveCom(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String comment = req.getParameter("comment");
        int blogId= Integer.parseInt(req.getParameter("blogId"));
        pk_user user= (pk_user) req.getSession().getAttribute("user");
        Comment comment1=new Comment(blogId,user.getId(),comment,new Date());
        Boolean savecom = com.savecom(comment1);
        resp.getWriter().print(savecom);
    }
    /**
     * 根据blogId查询该博文下的所有评论记录数
     */
    protected void findCountbyBlogId(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.print("jump into findCountbyBlogId...");
        int blogId = Integer.parseInt(req.getParameter("blogId"));
        long findcount = com.findcount(blogId);
        System.out.print(findcount);
        resp.getWriter().print(findcount);
    }
}
