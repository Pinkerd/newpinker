package com.pinker.servlet;



import com.pinker.entity.pk_topic;
import com.pinker.service.serviceimpl.TopicServiceImpl;
import com.pinker.util.WEBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "pkTopicServlet",urlPatterns = "/pkTopicServlet")
public class pkTopicServlet extends BaseServlet {
    TopicServiceImpl tsi = new TopicServiceImpl();
    protected void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai");
        List<pk_topic> list = tsi.selectAll();
        System.out.println(list);
        request.setAttribute("list",list);
        request.getRequestDispatcher("/pages/topicListgly.jsp").forward(request,response);
    }

    protected void selectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai2");
        String i = request.getParameter("numb");
        Integer id = Integer.valueOf(i);
        pk_topic pt = tsi.selectOne(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("/pages/topicDetailGly.jsp").forward(request,response);
    }

    protected void selectById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai3");
        String i = request.getParameter("id");
        Integer id = Integer.valueOf(i);
        pk_topic pt = tsi.selectOne(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("/pages/topicDetailGly.jsp").forward(request,response);
    }

    protected void findByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai4");
        String i = request.getParameter("uid");
        Integer id = Integer.valueOf(i);
        pk_topic pt = tsi.findByUserId(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("/pages/topicDetailGly.jsp").forward(request,response);
    }



    protected void deletePkTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String i = request.getParameter("numb");
        Integer id = Integer.valueOf(i);
        tsi.delete(id);
        response.sendRedirect(request.getContextPath()+"/pkTopicServlet?meth7od=showAll");
    }
    protected void changePkTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlaiXG");
        String t = request.getParameter("numb");
        Integer a = Integer.valueOf(t);
        pk_topic pt1 = tsi.selectOne(a);
        request.setAttribute("list",pt1);
        request.getRequestDispatcher("/pages/topicChange.jsp").forward(request,response);

    }
    protected void updateTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        pk_topic topic = WEBUtils.para2bean(request,pk_topic.class);
         if(topic.getId()==0){
             tsi.add(topic.getTitle(),topic.getContent(),topic.getTitleimg(),topic.getUserId());
         }
         else {
             tsi.change(topic.getTitle(),topic.getContent(),topic.getTitleimg(),topic.getUserId());
         }
        response.sendRedirect(request.getContextPath()+"/pkTopicServlet?method=showAll");
    }


}
