package com.pinker.servlet;

import com.pinker.entity.User;
import com.pinker.entity.pk_user;
import com.pinker.service.Impl.UserServiceImpl;
import com.pinker.service.UserService;
import com.pinker.util.IOUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "IOServlet",urlPatterns = {"/IOServlet"})
public class IOServlet extends BaseServlet {

    /**
     *
     * 读取本用户头像
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    protected void loadHeadImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        pk_user user = (pk_user) request.getSession().getAttribute("user");
        if(user!=null) {
            IOUtil.readImg("E:\\site\\images\\" + user.getId() + ".jpg", request, response);
        }else {
            IOUtil.readImg("E:\\site\\images\\default.jpg", request, response);
        }
    }

    UserService userService=new UserServiceImpl();

    /**
     * 读取他人头像
     */
    protected void loadOtherHeadImg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

            String userId=request.getParameter("userId");

            IOUtil.readImg("E:\\site\\images\\" + userId + ".jpg", request, response);

    }
}
