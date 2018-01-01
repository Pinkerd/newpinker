package com.pinker.servlet;

import com.pinker.entity.Friend;
import com.pinker.entity.pk_user;
import com.pinker.service.FriendService;
import com.pinker.service.Impl.FriendServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OtherServlet",urlPatterns = {"/OtherServlet"})
public class OtherServlet extends BaseServlet {
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
}
