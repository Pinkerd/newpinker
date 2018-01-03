package com.pinker.servlet;

import com.pinker.entity.CollectionBlog;
import com.pinker.service.CollectionBlogService;
import com.pinker.service.Impl.CollectionBlogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CollectionBlogServlet")
public class CollectionBlogServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private CollectionBlogService collectionBlogService = new CollectionBlogServiceImpl();

    /**
     * 删除blog收藏的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteCollectionBlog(HttpServletRequest request,
                                      HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        collectionBlogService.deleteCollectionBlogByUserId(userId);
        response.sendRedirect(request.getContextPath()+"/CollectionBlogServlet?method=#");

    }


    /**
     * 添加话题收藏的方法
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /**
         * 获取从页面中输入的信息
         */
        CollectionBlog collectionBlog = new CollectionBlog();

        /**
         * 调用service中的增加信息的方法
         */
        collectionBlogService.saveCollectionBlog(collectionBlog);

        /**
         * 重定向到#方法
         */
        response.sendRedirect(request.getContextPath()+"/CollectionBlogServlet?method=#");

    }

    /**
     * 查询所有blog收藏的信息并带着信息去页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void concernTopicList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<CollectionBlog> collectionBlog = collectionBlogService.getAllCollectionBlog();

        /**
         * 将查询到的blog收藏对象放进请求域中
         */
        request.setAttribute("list", collectionBlog);

        /**
         * 转发到 #.jsp
         */
        request.getRequestDispatcher("#.jsp").forward(request, response);
    }
}
