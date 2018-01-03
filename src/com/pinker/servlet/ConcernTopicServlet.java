package com.pinker.servlet;

import com.pinker.entity.ConcernTopic;
import com.pinker.entity.pk_user;
import com.pinker.service.ConcernTopicService;
import com.pinker.service.Impl.ConcernTopicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ConcernTopicServlet")
public class ConcernTopicServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ConcernTopicService concernTopicService = new ConcernTopicServiceImpl();

    /** 先获取用户Id
     * @param request
     * @return
     */
    private pk_user getUserFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession();
        pk_user user = (pk_user) session.getAttribute("loginUser");
        return user;
    }

    /**
     * 删除话题收藏的方法
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteConcernTopic(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        concernTopicService.deleteConcernTopicByUserId(userId);
        response.sendRedirect(request.getContextPath()+"/ConcernTopicServlet?method=#");

    }


    /**
     * 添加话题收藏的方法
     */
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {

        /**
         * 获取从页面中输入的信息
         */
        ConcernTopic concernTopic = new ConcernTopic();

        /**
         * 调用service中的增加信息的方法
         */
        concernTopicService.saveConcernTopic(concernTopic);

        /**
         * 重定向到#方法
         */
        response.sendRedirect(request.getContextPath()+"/ConcernTopicServlet?method=#");

    }

    /**
     * 查询所有话题收藏的信息并带着信息去页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void concernTopicList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<ConcernTopic> concernTopic = concernTopicService.getAllConcernTopic();

        /**
         * 将查询到的话题收藏对象放进请求域中
         */
        request.setAttribute("list", concernTopic);

        /**
         * 转发到 #.jsp
         */
        request.getRequestDispatcher("#.jsp").forward(request, response);
    }
}
