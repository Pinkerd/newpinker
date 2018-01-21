package com.pinker.servlet;

import com.google.gson.Gson;
import com.pinker.dao.UserDao;
import com.pinker.entity.Corner;
import com.pinker.entity.Smurfs;
import com.pinker.entity.Thirdparty;
import com.pinker.entity.pk_user;
import com.pinker.service.Impl.ThirdPartyServiceImpl;
import com.pinker.service.Impl.UserServiceImpl;
import com.pinker.service.ThirdPartyService;
import com.pinker.service.UserService;
import com.pinker.util.IDUtil;

import javax.servlet.ServletException;
import javax.servlet.SessionCookieConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ThirdServlet",urlPatterns = {"/ThirdServlet"})
public class ThirdServlet extends BaseServlet {

    UserService userService= new UserServiceImpl();
    ThirdPartyService thirdPartyService= new ThirdPartyServiceImpl();
    Gson gson= new Gson();
    /**
     * 提供对外
     * 第三方登录服务
     */
    protected void thirdParty(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String callback = req.getParameter("callback");

        pk_user user= (pk_user) req.getSession().getAttribute("user");
        PrintWriter out= resp.getWriter();
        String userJ=null;
        if (user != null) {
            userJ =gson.toJson(user);
            userJ=callback+"("+userJ+")";
        }
        out.write(userJ);
        out.flush();
        out.close();
    }

    /**
     *接入蓝鲸灵
     *第三方登录
     */
    protected void smurfsThird(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // 获取蓝鲸灵用户信息
        String userJ=req.getParameter("myUser");
        Smurfs smurfs = gson.fromJson(userJ, Smurfs.class);
        //转为第三方实体
        Thirdparty thirdparty= new Thirdparty();
        thirdparty.setLoginname(smurfs.getUsername());
        thirdparty.setSourcesite(smurfs.getSOURCESITE());
        thirdparty.setUserName(smurfs.getNickname());
        //查询曾登录
        Thirdparty th = thirdPartyService.selectBySourceSiteAndloginName(thirdparty.getSourcesite(), thirdparty.getLoginname());

        PrintWriter out= resp.getWriter();

        if(th!=null){
            pk_user byUserId = userService.findByUserId(th.getUserid());
            if (byUserId != null) {
                req.getSession().setAttribute("user",byUserId);
                out.print("true");
            }else{
                out.print("false");
            }
        }else{
            int id= Integer.parseInt(IDUtil.createID());
            thirdPartyService.insertThird(thirdparty.getSourcesite(),thirdparty.getLoginname(),thirdparty.getLoginname(),id);

            //生成随机登录名
            String loginName=IDUtil.createID();
            int i = userService.addThirdUser(id, loginName, thirdparty.getLoginname(), "123456");
            System.out.println(i);
            pk_user byUserId = userService.findByUserId(id);
            if (byUserId != null) {
                req.getSession().setAttribute("user",byUserId);
                out.print("true");
            }else{
                out.print("false");
            }
        }
        out.flush();
        out.close();
    }


    /**
     * 阔南第三方登录
     */
    protected void corThird(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取阔南用户信息
        String userJ=req.getParameter("myUser");
        Corner corner = gson.fromJson(userJ, Corner.class);
        //转为第三方实体
        Thirdparty thirdparty=new Thirdparty();

        thirdparty.setSourcesite(corner.getSOURCESITE());
        thirdparty.setLoginname(corner.getUsername());
        thirdparty.setUserName(corner.getUsername());
        //查询是否曾登录
        Thirdparty th = thirdPartyService.selectBySourceSiteAndloginName(thirdparty.getSourcesite(), thirdparty.getLoginname());
        PrintWriter out= resp.getWriter();
        if (th != null) {
            pk_user byUserId = userService.findByUserId(th.getUserid());
            req.getSession().setAttribute("user",byUserId);
        }else{
            int id= Integer.parseInt(IDUtil.createID());
            thirdPartyService.insertThird(thirdparty.getSourcesite(),thirdparty.getLoginname(),thirdparty.getLoginname(),id);

            //生成随机登录名
            String loginName=IDUtil.createID();
            int i = userService.addThirdUser(id, loginName, thirdparty.getLoginname(), "123456");
            System.out.println(i);
            pk_user byUserId = userService.findByUserId(id);
            if (byUserId != null) {
                req.getSession().setAttribute("user",byUserId);
                out.print("true");
            }else{
                out.print("false");
            }

        }

        out.flush();
        out.close();

    }
}
