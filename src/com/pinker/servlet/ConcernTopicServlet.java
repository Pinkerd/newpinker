package com.pinker.servlet;


import com.pinker.entity.ConcernTopic;
import com.pinker.entity.pk_topic;
import com.pinker.entity.pk_user;
import com.pinker.service.ConcernTopicService;
import com.pinker.service.Impl.ConcernTopicServiceImpl;
import com.pinker.service.TopicService;
import com.pinker.service.serviceimpl.TopicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;


@WebServlet(name = "ConcernTopicServlet",urlPatterns = {"/ConcernTopicServlet"})
public class ConcernTopicServlet extends BaseServlet {

private ConcernTopicService con=new ConcernTopicServiceImpl();
    /**
     * 查询的方法
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void hasConcern(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.从页面获取话题
        String topicId = req.getParameter("topicId");
        int topid = Integer.parseInt(topicId);
        //2.从域中获取user
        pk_user user = (pk_user) req.getSession().getAttribute("user");
        Integer id = user.getId();

        ConcernTopic byUsrIdAndTopicId = con.findByUsrIdAndTopicId(id, topid);

        String result="false";
        if(byUsrIdAndTopicId!=null){
            result="true";
        }
        //将获取的值发送到界面
        resp.getWriter().print(result);

    }
    /**
     * 增加的方法
     */
    protected void addConc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1.从页面获取话题
        String topicId = req.getParameter("topicId");
        int topid = Integer.parseInt(topicId);
        //2.从域中获取user
        pk_user user = (pk_user) req.getSession().getAttribute("user");
        Integer id = user.getId();
        //3填充对象
        ConcernTopic conn=new ConcernTopic(id,topid,new Date());
        //调用增加的方法
        int concernTopic = con.saveConcernTopic(conn);
        String result="false";
        if(concernTopic!=0){
            result="true";
        }
        resp.getWriter().print(result);


    }

    /**
     * 删除的方法
     */
    protected void deleteConc(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("删除");

        //1.从页面获取话题
        String topicId = req.getParameter("topicId");
        int topid = Integer.parseInt(topicId);
        //2.从域中获取user
        pk_user user = (pk_user) req.getSession().getAttribute("user");
        Integer id = user.getId();
        //调用删除的方法
        int concernTopics = con.deleteConcernTopicByUserId(id, topid);

        String result="false";
        if(concernTopics!=0){
            result="true";
        }
        resp.getWriter().print(result);

    }
}
