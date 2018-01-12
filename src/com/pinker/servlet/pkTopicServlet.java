package com.pinker.servlet;



import com.google.gson.Gson;
import com.pinker.entity.pk_topic;
import com.pinker.service.Impl.TopicServiceImpl;
import com.pinker.util.WEBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
/**
 * Created by Liu on 2017/12/26.
 * user管理servlet
 * function：
 * 1.查询所有topic
 * 2.根据id查询topic
 * 3.根据用户id查询 用户关注的话题
 * 4.删除话题
 * 5.修改话题
 * 6.新增话题
 * 7.根据标题模糊查询
 */
@WebServlet(name = "pkTopicServlet",urlPatterns = "/pkTopicServlet")
public class pkTopicServlet extends BaseServlet {
    TopicServiceImpl tsi = new TopicServiceImpl();
    Gson gson=new Gson();
    /*1.查询所有topic*/
    protected void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai");
        List<pk_topic> list = tsi.selectAll();
        System.out.println(list);
        request.setAttribute("list",list);
        request.getRequestDispatcher("/pinker/topicListgly.jsp").forward(request,response);
    }
    /*2.根据id查询topic*/
    protected void selectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai2");
        String i = request.getParameter("numb");
        Integer id = Integer.valueOf(i);
        pk_topic pt = tsi.selectOne(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("topicDetailGly.jsp").forward(request,response);
    }
    /*2.根据id查询topic*/
    protected void selectById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai3");
        String i = request.getParameter("id");
        Integer id = Integer.valueOf(i);
        pk_topic pt = tsi.selectOne(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("topicDetailGly.jsp").forward(request,response);
    }
    /*3.根据用户id查询 用户关注的话题*/
    protected void findByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai4");
        String i = request.getParameter("uid");
        Integer id = Integer.valueOf(i);
        List<pk_topic> pt = tsi.findByUserId(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("topicDetailGly.jsp").forward(request,response);
    }

    /*4.删除话题*/
    protected void deletePkTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String i = request.getParameter("numb");
        Integer id = Integer.valueOf(i);
        tsi.delete(id);
        response.sendRedirect(request.getContextPath()+"/pkTopicServlet?meth7od=showAll");
    }
    /*5.修改话题*/
    protected void changePkTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlaiXG");
        String t = request.getParameter("numb");
        Integer a = Integer.valueOf(t);
        pk_topic pt1 = tsi.selectOne(a);
        request.setAttribute("list",pt1);
        request.getRequestDispatcher("topicChange.jsp").forward(request,response);

    }
    /*6新增话题*/
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


    /**
     * 7.根据标题模糊查询
     */
    protected void fuzzSearch(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String key=req.getParameter("searchKey");
        List<pk_topic> list=tsi.fuzzSearch(key);
        String listJ=gson.toJson(list);
        resp.getWriter().write(listJ);
    }

    /**
     * 审核话题
     */
    protected void topicCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int topicId= Integer.parseInt(req.getParameter("topicId"));
        String check=req.getParameter("check");
        int status=0;
        if(check=="yes"){
            status=1;
        }else if(check=="no"){
            status=2;
        }



    }
}
