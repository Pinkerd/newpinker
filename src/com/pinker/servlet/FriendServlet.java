package com.pinker.servlet;

import com.pinker.entity.Friend;
import com.pinker.entity.pk_user;
import com.pinker.service.FriendService;
import com.pinker.service.Impl.FriendServiceImpl;
import com.pinker.service.Impl.UserServiceImpl;
import com.pinker.service.UserService;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
        out.flush();
        out.close();
    }


    /**
     * 查询好友请求
     */
    protected void haveFriendReq(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        pk_user user=(pk_user) req.getSession().getAttribute("user");
        int userId=user.getId();
        List<Friend> list=friendService.getAllFriByUserIdAndStatue(userId,0);
        System.out.println(list);
        JSONArray json= JSONArray.fromObject(list.toArray());
        System.out.println(json);

    }


    /**
     * 接受好友请求
     */
    protected void recieveFri(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        pk_user user=(pk_user) req.getSession().getAttribute("user");
        int friId=Integer.parseInt(req.getParameter("userId"));
        Friend friend= new Friend();
        friend.setUserId(user.getId());
        friend.setFriendId(friId);
        boolean result=friendService.beFriend(friend);
        String an="";
        if(result){
            an="true";
        }else{
            an="false";
        }
        PrintWriter out=resp.getWriter();
        out.write(an);
        out.flush();
        out.close();
    }


    /**
     * 删除好友关系
     */
    protected void deleteFri(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        pk_user user=(pk_user) req.getSession().getAttribute("user");
        int friendId=Integer.parseInt(req.getParameter("friendId"));

        Friend friend= new Friend();
        friend.setUserId(user.getId());
        friend.setFriendId(friendId);
        boolean result=friendService.deleteEachFri(friend);
        PrintWriter out=resp.getWriter();
        if (result){
            out.print("true");
        }else{
            out.print("false");
        }
        out.flush();
        out.close();

    }
}
