package com.mark.controller;

import com.mark.domain.Article;
import com.mark.domain.Message;
import com.mark.domain.User;
import com.mark.service.ArticleService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Author: Mark
 * Date  : 2015/2/27
 * Time  : 16:16
 */
@WebServlet(name = "ManageServlet")
public class ManageServlet extends HttpServlet {

    private ArticleService service = new ArticleService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        Message<List<Article>> message = service.getAllArticle(user.getId());
        if (message.success) {
            request.getSession().setAttribute("articles", message.getData());
            request.getRequestDispatcher("/WEB-INF/backend/manage.jsp").forward(request, response);
        } else {
            request.getSession().setAttribute("msg", message.message);
            request.getSession().setAttribute("url", request.getContextPath() + "/home");
            request.getRequestDispatcher("/WEB-INF/message.jsp").forward(request, response);
        }
    }
}
