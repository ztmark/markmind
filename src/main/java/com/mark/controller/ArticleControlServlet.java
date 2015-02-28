package com.mark.controller;

import com.mark.domain.Message;
import com.mark.domain.User;
import com.mark.service.ArticleService;
import com.mark.utils.CommonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Author: Mark
 * Date  : 2015/2/25
 * Time  : 12:26
 */
@WebServlet(name = "ArticleControlServlet")
public class ArticleControlServlet extends HttpServlet {

    private ArticleService service = new ArticleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String text = request.getParameter("text");
        User user = (User) request.getSession().getAttribute("user");
        Message message = service.addArticle(title, text, user.getId());
        if (message.success) {
            request.getSession().setAttribute("message", "添加成功，3秒后跳转...");
        } else {
            request.getSession().setAttribute("message", message.message);
        }
        request.getSession().setAttribute("url", request.getContextPath() + "/home");
        request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/backend/post.jsp").forward(request, response);
    }
}
