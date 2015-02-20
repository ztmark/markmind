package com.mark.controller;

import com.mark.domain.Message;
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
@WebServlet(name = "SignUpServlet")
public class SignUpServlet extends HttpServlet {

    private UserService service = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username").trim();
        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();
        Message message = service.addUser(username, email, password);
        if (message.success) {
            request.getSession().setAttribute("msg", "注册成功，3秒后跳转...");
            request.getSession().setAttribute("url", "index.html");
            request.getRequestDispatcher("WEB-INF/message.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("msg", message.message);
            request.getRequestDispatcher("WEB-INF/frontend/register.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/frontend/register.jsp").forward(request, response);
    }
}
