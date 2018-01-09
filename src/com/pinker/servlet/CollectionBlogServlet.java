package com.pinker.servlet;

import com.pinker.entity.CollectionBlog;
import com.pinker.entity.pk_user;
import com.pinker.service.CollectionBlogService;
import com.pinker.service.Impl.CollectionBlogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CollectionBlogServlet",urlPatterns = {"/CollectionBlogServlet"})
public class CollectionBlogServlet extends BaseServlet {
    private static final long serialVersionUID = 1L;

    private CollectionBlogService collectionBlogService = new CollectionBlogServiceImpl();
    /**
     * 查询一个博文收藏的方法  根据userid 和blogid
     */

    protected void findCollectionBlogByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("jump into findCollectionBlogByUserId");
        int blogId= Integer.parseInt(request.getParameter("blogId")) ;
        pk_user user= (pk_user) request.getSession().getAttribute("user");
        CollectionBlog collectionBlogByUserId = collectionBlogService.findCollectionBlogByUserIdAndBlogId(user.getId(), blogId);
        System.out.print(collectionBlogByUserId);

        Boolean result=null;
        if (collectionBlogByUserId!=null){
            result=true;
        }else if (collectionBlogByUserId==null){
            result=false;
        }
        System.out.println(result);
        response.getWriter().print(result);
    }

    /**
     * 删除blog收藏的方法
     * blog
     */
    protected void deleteCollectionBlog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("jump into delete...");
        /**
         * 获取blog页面传来的博客id，在本表删除
         */
        int blogId= Integer.parseInt(request.getParameter("blogId")) ;
        /**
         * 获取session域中的user
         */
        pk_user user= (pk_user) request.getSession().getAttribute("user");
        /**
         * ajax返回
         */
        Integer row=collectionBlogService.deleteCollectionBlogByUserId(user.getId(),blogId);
        response.getWriter().print(row.toString());
    }


    /**
     * 添加博文关注的方法
     * blog
     */
    protected void saveCollectionBlog(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /**
        * 获取blog页面传来的博客id，在本表删除
        */
        int blogId= Integer.parseInt(request.getParameter("blogId")) ;
        /**
         * 获取session域中的user
         */
        pk_user user= (pk_user) request.getSession().getAttribute("user");
        /**
         * 获取点击博文关注
         */
        CollectionBlog collectionBlog = new CollectionBlog(blogId,user.getId(),new Date());

        /**
         * 调用service中的增加信息的方法
         */
        Integer row = collectionBlogService.saveCollectionBlog(collectionBlog);
        PrintWriter out = response.getWriter();
        out.print(row.toString());
    }

    /**
     * 查询所有blog收藏的信息并带着信息去页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void concernTopicList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("jump into concernTopicList...");
        pk_user user= (pk_user) request.getSession().getAttribute("user");
        List<CollectionBlog> collectionBlog = collectionBlogService.findAllByUserId(user.getId());
        System.out.print(collectionBlog);
        /**
         * 将查询到的blog收藏对象放进请求域中
         */
        request.setAttribute("list", collectionBlog);

        /**
         * 转发到 #.jsp
         */
        request.getRequestDispatcher("/pinker/CollectBlog.jsp").forward(request, response);
    }



    protected void isCollect(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /**
         * 获取blog页面传来的博客id，在本表删除
         */
        int blogId= Integer.parseInt(req.getParameter("blogId")) ;
        /**
         * 获取session域中的user
         */
        pk_user user= (pk_user) req.getSession().getAttribute("user");




    }
}
