package com.pinker.servlet;

import com.google.gson.Gson;
import com.pinker.entity.Blog;
import com.pinker.entity.Friend;
import com.pinker.entity.pk_topic;
import com.pinker.entity.pk_user;
import com.pinker.service.BlogDaoService;
import com.pinker.service.FriendService;
import com.pinker.service.Impl.BlogDaoServiceImpl;
import com.pinker.service.Impl.FriendServiceImpl;
import com.pinker.service.Impl.UserServiceImpl;
import com.pinker.service.TopicService;
import com.pinker.service.UserService;
import com.pinker.service.Impl.TopicServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OtherServlet",urlPatterns = {"/OtherServlet"})
public class OtherServlet extends BaseServlet {
    UserService userService= new UserServiceImpl();
    BlogDaoService blogDaoService= new BlogDaoServiceImpl();
    TopicService topicService= new TopicServiceImpl();

    Gson gson=new Gson();

    /**
     * 跳转到他人主页
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void toOthersPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId=Integer.parseInt(request.getParameter("userId"));
        pk_user user=new pk_user();
        user.setId(userId);
        user=userService.findByUserId(userId);
        request.setAttribute("other",user);
        request.getRequestDispatcher("pinker/othersPage.jsp").forward(request,response);

    }

    FriendService friendService =new FriendServiceImpl();
    /**
     * 好友请求
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void friendRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userId=Integer.parseInt(req.getParameter("userId"));
        int otherId=Integer.parseInt(req.getParameter("otherId"));
        Friend friend=new Friend();
        friend.setUserId(otherId);
        friend.setFriendId(userId);
        Boolean result=friendService.friendRequest(friend);
        PrintWriter out = resp.getWriter();
        out.write(result.toString());
    }

    /**
     * 查询该用户所有博文
     */
    protected void findOtherBlog(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int otherId=Integer.parseInt(req.getParameter("otherId"));
        List<Blog>  list= blogDaoService.findUser(otherId);
        String slist=gson.toJson(list);
        PrintWriter out=resp.getWriter();
        out.write(slist);
        out.flush();
        out.close();
    }


    /**
     * 查询该用户所有话题
     */
    protected void findOtherTopic(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int otherId=Integer.parseInt(req.getParameter("otherId"));
        List<pk_topic> list=topicService.findByUserId(otherId);
        String slist=gson.toJson(list);
        System.out.println(slist);
        PrintWriter out=resp.getWriter();
        out.write(slist);
        out.flush();
        out.close();


    }
}
