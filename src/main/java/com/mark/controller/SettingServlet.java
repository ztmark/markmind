package com.mark.controller;

import com.mark.domain.Message;
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
 * Date  : 2015/2/26
 * Time  : 15:49
 */
@WebServlet(name = "SettingServlet")
public class SettingServlet extends HttpServlet {

    private UserService service = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String newPwd = request.getParameter("password");
        User user = (User) request.getSession().getAttribute("user");
        Message message;
        if (newPwd != null) { // 修改密码
            message = service.updatePwd(user, newPwd);
        } else { //修改blog name 和 motto
            String blogName = request.getParameter("blog-name");
            String motto = request.getParameter("motto");
            message = service.updateBlogInfo(user, blogName, motto);
        }
        if (message.success) {
            request.getSession().setAttribute("user", message.getData());
        }
        request.getSession().setAttribute("msg", message.message);
        request.getSession().setAttribute("url", request.getContextPath() + "/manage/setting");
        request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/backend/setting.jsp").forward(request, response);
    }
}
