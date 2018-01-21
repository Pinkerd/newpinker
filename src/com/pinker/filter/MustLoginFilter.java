package com.pinker.filter;

import com.pinker.entity.pk_user;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(filterName = "MustLoginFilter",urlPatterns = {"/pinker/publishTopic.jsp","/pinker/publishBlog.jsp","/pinker/CollectBlog.jsp","/pinker/CollectTopic.jsp","/pinker/Myblo.jsp","/pinker/MyTopic.jsp","/pinker/PersonPage.jsp"})
public class MustLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request= (HttpServletRequest) req;
        pk_user user= (pk_user) request.getSession().getAttribute("user");
        if (user != null) {
            chain.doFilter(req, resp);
        }else{
            req.getRequestDispatcher("/pinker/login.jsp").forward(req,resp);
        }




    }

    public void init(FilterConfig config) throws ServletException {

    }

}
