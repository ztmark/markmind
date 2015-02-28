package com.mark.controller;

import com.mark.domain.User;
import com.mark.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Author: Mark
 * Date  : 2015/2/17
 * Time  : 21:41
 */
@WebServlet(name = "SignInServlet")
public class SignInServlet extends HttpServlet {

    private UserService service = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        User user = service.loginChecker(username, password);
        if (user != null) {
            request.getSession().setAttribute("user", user);
            request.getSession().setAttribute("msg", "登录成功，3秒后跳转...");
            request.getSession().setAttribute("url", request.getContextPath() + "/home");
            request.getRequestDispatcher("WEB-INF/message.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("msg", "用户名或密码错误");
            request.getRequestDispatcher("WEB-INF/frontend/login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        if (user != null) {
            request.getSession().setAttribute("msg", "您已登录，3秒后跳转...");
            request.getSession().setAttribute("url", request.getContextPath() + "/home");
            request.getRequestDispatcher("WEB-INF/message.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("WEB-INF/frontend/login.jsp").forward(request, response);
        }
    }
}
