package com.pinker.servlet;

import com.pinker.dao.BlogDao;
import com.pinker.dao.CommentDao;
import com.pinker.dao.impl.BlogDaoImpl;
import com.pinker.dao.impl.CommentDaoImpl;
import com.pinker.entity.Blog;
import com.pinker.entity.Comment;
import com.pinker.entity.pk_user;
import com.pinker.service.BlogDaoService;
import com.pinker.service.Impl.BlogDaoServiceImpl;
import com.pinker.util.WEBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "BlogServlet",urlPatterns = ("/BlogServlet"))
public class BlogServlet extends BaseServlet {
    BlogDaoService blogDaoService=new BlogDaoServiceImpl();
    CommentDao commentDao=new CommentDaoImpl();




    /**
     * 查询单条blog数据库信息
     */
    protected void selectblogOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String blogId = request.getParameter("blogId");
        //System.out.println(blogId);
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
        String title=req.getParameter("title");
        String blogData=req.getParameter("blogData");
        int topicId=Integer.parseInt(req.getParameter("topicId"));
        pk_user user= (pk_user) req.getSession().getAttribute("user");

        Blog blog=new Blog();
        blog.setTitle(title);
        blog.setUserId(user.getId());
        blog.setContent(blogData);
        blog.setPublishtime(new Date());
        blog.setTopicId(topicId);
        blogDaoService.SaveBlog(blog);
    }


}
