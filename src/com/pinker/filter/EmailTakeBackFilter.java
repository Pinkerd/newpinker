package com.pinker.filter;

import com.pinker.entity.pk_user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;


/**
 * 邮件找回密码页面间控制
 */
@WebFilter(filterName = "EmailTakeBackFilter",urlPatterns = {"/pinker/emailTakeBack2.jsp","/pinker/emailTakeBack3.jsp","/pinker/emailTakeBack4.jsp"})
public class EmailTakeBackFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        pk_user user= (pk_user) req.getAttribute("user");
        if (user != null) {
            chain.doFilter(req,resp);
        }else{
            req.getRequestDispatcher("/pinker/emailTakeBack1.jsp").forward(req,resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
