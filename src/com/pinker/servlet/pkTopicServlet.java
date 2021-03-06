package com.pinker.servlet;



import com.google.gson.Gson;
import com.pinker.entity.Page;
import com.pinker.entity.pk_topic;
import com.pinker.entity.pk_user;
import com.pinker.service.Impl.TopicServiceImpl;
import com.pinker.service.TopicService;
import com.pinker.util.IDUtil;
import com.pinker.util.IOUtil;
import com.pinker.util.WEBUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
    /*2.根据话题id查询topic*/
    protected void selectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai2");
        String i = request.getParameter("numb");
        Integer id = Integer.valueOf(i);
        pk_topic pk = tsi.selectOne(id);
        System.out.println(pk);
        List<pk_topic> list = new ArrayList();
            list.add(pk);
        request.setAttribute("topic",list);
        request.getRequestDispatcher("/pinker/topicDetailGly.jsp").forward(request,response);
    }

    /*3.根据用户id查询 用户关注的话题*/
    protected void findByUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("jinlai4");
        String i = request.getParameter("uid");
        Integer id = Integer.valueOf(i);
        System.out.println(id);
        List<pk_topic> pt = tsi.findByUserId(id);
        System.out.println(pt);
        request.setAttribute("topic",pt);
        request.getRequestDispatcher("/pinker/topicDetailGly.jsp").forward(request,response);
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
        request.getRequestDispatcher("/pinker/topicChange.jsp").forward(request,response);

    }
    /*6新增话题*/
    protected void updateTopic(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        pk_topic topic = WEBUtils.para2bean(request,pk_topic.class);
         if(topic.getId()==0){
//             tsi.add(topic.getTitle(),topic.getContent(),topic.getTitleimg(),topic.getUserId());
         }
         else {
             tsi.change(topic.getTitle(),topic.getContent(),topic.getTitleimg(),topic.getUserId());
         }
        response.sendRedirect(request.getContextPath()+"/pkTopicServlet?method=showAll");
    }

    /*管理员在后台进行话题查询*/
    protected void mhFind(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进来模糊查询啦");
        String ps = request.getParameter("htbt");
        System.out.println(ps);
        List<pk_topic> list6 = tsi.mhFind(ps);
        System.out.println(list6);
        request.setAttribute("topic",list6);
        request.getRequestDispatcher("/pinker/topicDetailGly.jsp").forward(request,response);
    }


    /*后台分页*/
    protected void findBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("进来分页");
        Page<pk_topic> page1 =new Page() ;
        int pageNumber= Integer.parseInt(request.getParameter("pn"));
        page1.setPageSize(4);
        page1.setPageNumber(pageNumber);
        System.out.println(page1);
        Page<pk_topic> page2 = tsi.findTopic(page1);
        System.out.println(page2);
        request.setAttribute("page6",page2);
        request.getRequestDispatcher("/pinker/topicListgly.jsp").forward(request,response);

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
     * 8.审核话题
     */
    protected void topicCheck(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int topicId= Integer.parseInt(req.getParameter("topicId"));
        String check=req.getParameter("check");
        int status=0;
        if(check.equals("yes")){
            status=1;
        }else if(check.equals("no")){
            status=2;
        }
        int row=tsi.updateStatus(topicId,status);
        PrintWriter out=resp.getWriter();
        out.print(row);
        out.flush();
        out.close();

    }

    private int topicId;
    /**
     * 9.发布话题
     */
    protected void publishTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        pk_user user= (pk_user) req.getSession().getAttribute("user");
        String title= req.getParameter("title");
        String content=req.getParameter("topicData");
        topicId= Integer.parseInt(IDUtil.createID());
        int row=tsi.uploadTopic(topicId,title,content,user.getId());
        PrintWriter out=resp.getWriter();
        out.print(row);
        out.flush();
        out.close();
    }

    /**
     * 10.上传话题图
     */
    protected void publishTopicImg(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IOUtil.uploadImg(req,resp,"E:\\site\\topicImg",topicId);

    }

    /**
     * 分页获取
     */
    protected void findByPageNum(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNum= Integer.parseInt(req.getParameter("pageNum"));
        Page<pk_topic> page= new Page<>();
        page.setPageNumber(pageNum);
        page.setPageSize(12);
        page=tsi.findTopic(page);
        page.getTotalPage();
        String pageJ=gson.toJson(page);
        PrintWriter out=resp.getWriter();
        out.print(pageJ);
        out.flush();
        out.close();
    }
}
