package com.pinker.servlet;

import com.pinker.entity.CollectionBlog;
import com.pinker.entity.pk_user;
import com.pinker.service.CollectionBlogService;
import com.pinker.service.Impl.CollectionBlogServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CollectionBlogServlet" ,urlPatterns = {"/CollectionBlogServlet"})
public class CollectionBlogServlet extends BaseServlet {

    private CollectionBlogService cbs=new CollectionBlogServiceImpl();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        /**
         * 1.从session域中获取user的对象
         */
        pk_user collectBlogMy = (pk_user) req.getSession().getAttribute("user");

        /**
         * 2.从user中获取id
         */
        Integer id = collectBlogMy.getId();
        /**
         * 3.调用查询该用户所有收藏博客方法
         */
        List<CollectionBlog> collectBlog = cbs.findAllByUserId(id);
        System.out.println(collectBlog);
        /**
         * 4.将获取的集合放到域中
         */
        req.setAttribute("collectBlog",collectBlog);
        /**
         * 5.转发到CollectBlog.jsp的页面
         */
        req.getRequestDispatcher("/pinker/CollectBlog.jsp").forward(req,resp);
    }
}
