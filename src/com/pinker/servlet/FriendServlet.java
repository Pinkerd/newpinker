package com.pinker.servlet;

import com.pinker.entity.Friend;
import com.pinker.service.FriendService;
import com.pinker.service.Impl.FriendServiceImpl;
import com.pinker.service.Impl.UserServiceImpl;
import com.pinker.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "FriendServlet",urlPatterns = {"/FriendServlet"})
public class FriendServlet extends BaseServlet {
    FriendService friendService= new FriendServiceImpl();
    UserService userService=new UserServiceImpl();

    /**
     * 查询好友状态 0：好友邀请 1：好友 2：无关系
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void friendStatue(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId=Integer.parseInt(request.getParameter("userId"));
        int otherId=Integer.parseInt(request.getParameter("otherId"));
        Friend friend=new Friend();
        friend.setUserId(userId);
        friend.setFriendId(otherId);
        //查询好友状态
        Integer statue=friendService.isFriend(friend);

        PrintWriter out = response.getWriter();
        out.print(statue);

    }


    /**
     * 查询收否有好友请求
     */
    protected void haveFriendReq(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Integer userId=Integer.parseInt(req.getParameter("userId"));
        List<Friend> list=friendService.getAllFriByUserIdAndStatue(userId,0);
        PrintWriter out = resp.getWriter();

    }
}
