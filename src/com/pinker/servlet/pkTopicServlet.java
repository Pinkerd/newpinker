package com.pinker.servlet;



import com.pinker.dao.TopicDao;
import com.pinker.entity.pk_topic;
import com.pinker.entity.pk_user;
import com.pinker.service.TopicService;
import com.pinker.service.serviceimpl.TopicServiceImpl;
import com.pinker.util.IDUtil;
import com.pinker.util.IOUtil;
import com.pinker.util.WEBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "pkTopicServlet",urlPatterns = "/pkTopicServlet")
public class pkTopicServlet extends BaseServlet {
    TopicService tsi = new TopicServiceImpl();
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
        List<pk_topic> pt = tsi.findByUserId(id);
        System.out.println(pt);
        request.setAttribute("abc",pt);
        request.getRequestDispatcher("/pages/topicDetailGly.jsp").forward(request,response);
    }



    protected void deletePkTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String i = request.getParameter("numb");
        Integer id = Integer.valueOf(i);
        tsi.delete(id);
        response.sendRedirect(request.getContextPath()+"/pkTopicServlet?method=showAll");
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



    int topicId;


    /**
     * 上传话题
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void publishTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        topicId=Integer.parseInt(IDUtil.createID());
        String title=req.getParameter("title");
        String topicData=req.getParameter("topicData");
        pk_user user= (pk_user) req.getSession().getAttribute("user");


        PrintWriter out=resp.getWriter();
        if(tsi.uploadTopic(topicId,title,topicData,user.getId())!=0){
            out.write("true");
        }else{
            out.write("false");
        }


    }

    /**
     * 上传话题图
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void publishTopicImg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        String filePath="E:\\site\\topicImg";
        IOUtil.uploadImg(req,resp,filePath,topicId);

    }
}
