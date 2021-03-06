package com.pinker.servlet;

import com.pinker.dao.CommentDao;
import com.pinker.dao.impl.CommentDaoImpl;
import com.pinker.entity.Blog;
import com.pinker.entity.pk_user;
import com.pinker.service.BlogDaoService;
import com.pinker.service.Impl.BlogDaoServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 * Created by Yang on 2017/12/26.
 * Blog管理servlet
 * function：
 * 1.查询单条blog数据库信息
 * 2.查询所有
 * 3.发布博文
 */
@WebServlet(name = "BlogServlet",urlPatterns = ("/BlogServlet"))
public class BlogServlet extends BaseServlet {
    BlogDaoService blogDaoService=new BlogDaoServiceImpl();
    CommentDao commentDao=new CommentDaoImpl();


    /**
     * 查询单条blog数据库信息
     */
    protected void selectblogOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String blogId = request.getParameter("blogId");
        Integer integer = Integer.valueOf(blogId);
        Blog blogById = blogDaoService.getBlogById(integer);
        request.setAttribute("key",blogById);
        request.getRequestDispatcher("/pinker/blog.jsp").forward(request,response);


    }

    /**
     * 获取Blog表中的id，根据该条id对应的topicid查询user表对应的id的数据
     * blog topicid =user id
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    /*protected void selectuserOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blodId = request.getParameter("blodId");
        Integer integer = Integer.valueOf(blodId);
        Blog blogById = blogDaoService.getBlogById(integer);
        pk_user user = blogById.getUser();
        System.out.print(user);
    }*/

    /**
     * 查询所有
     */
    protected void selectAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> allBlog = blogDaoService.getAllBlog();
        request.setAttribute("list",allBlog);
        request.getRequestDispatcher("/pinker/topic_blogList.jsp").forward(request,response);
    }


    /**
     * 发布博文
     */
    protected void publishBlog(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int topicId= Integer.parseInt(req.getParameter("topicId"));
        String blogData=req.getParameter("blogData");
        String title=req.getParameter("title");
        pk_user user= (pk_user) req.getSession().getAttribute("user");
        Blog blog=new Blog();
        blog.setTitle(title);
        blog.setTopicId(topicId);
        blog.setContent(blogData);
        blog.setUserId(user.getId());
        int row=blogDaoService.SaveBlog(blog);
        if(row!=0){
            resp.getWriter().write("true");
        }else{
            resp.getWriter().write("false");
        }
    }
}
