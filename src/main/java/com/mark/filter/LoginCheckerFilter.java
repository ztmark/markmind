package com.mark.filter;

import com.mark.domain.User;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Author: Mark
 * Date  : 2015/2/28
 * Time  : 15:02
 */
@WebFilter(filterName = "LoginCheckerFilter")
public class LoginCheckerFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        User user = (User) request.getSession().getAttribute("user");
        if (user == null) {
            request.getSession().setAttribute("message", "请先登录！3秒后跳转到登录页面。");
            request.getSession().setAttribute("url", request.getContextPath() + "/signin");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        } else {
            chain.doFilter(req, resp);
        }
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
