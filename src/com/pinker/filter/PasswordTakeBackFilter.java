package com.pinker.filter;

import com.pinker.entity.pk_user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;


/**
 * 密保问题找回密码页面跳转控制
 */
@WebFilter(filterName = "PasswordTakeBackFilter",urlPatterns = {"/pinker/pswTakeBack2.jsp","/pinker/pswTakeBack3.jsp"})
public class PasswordTakeBackFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        pk_user user= (pk_user) req.getAttribute("user");

        if (user != null) {
            chain.doFilter(req, resp);
        } else {
            req.getRequestDispatcher("/pinker/pswTakeBack1.jsp").forward(req,resp);
        }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
