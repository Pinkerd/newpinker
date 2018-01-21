package com.pinker.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import java.io.IOException;

@WebFilter(filterName = "LoginFilter",urlPatterns = {"/pinker/login.jsp"})
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;

        Object user = request.getSession().getAttribute("user");

        if (user == null) {
            chain.doFilter(req, resp);
        }else{
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
